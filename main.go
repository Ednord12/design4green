package main

import (
	_ "design-4-green/routers"
	"fmt"
	"net/url"
	"os"
	"os/signal"
	"path/filepath"
	"syscall"
	"time"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/config"
	"github.com/astaxie/beego/logs"
	"github.com/astaxie/beego/orm"
	"github.com/astaxie/beego/utils"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	var fichierConf string

	if fichierConf = filepath.Join("conf", "database.local.conf"); !utils.FileExists(fichierConf) {
		if fichierConf = filepath.Join("conf", "database.conf"); !utils.FileExists(fichierConf) {
			logs.Error("Fichier de configuration 'database.conf' inexistant")
			os.Exit(0)
		}
	}

	conf, err := config.NewConfig("ini", fichierConf)
	if err != nil {
		logs.Error(err)
		os.Exit(0)
	}

	var connexion string
	provider := "default"
	connexion = conf.String(provider + "::user")
	connexion += ":" + conf.String(provider+"::password")
	connexion += "@"
	switch {
	case conf.DefaultString(provider+"::socket", "") != "":
		connexion += "unix(" + conf.DefaultString(provider+"::socket", "") + ")"
	case conf.DefaultString(provider+"::host", "") != "" && conf.DefaultString(provider+"::host", "") != "localhost" && conf.DefaultString(provider+"::host", "") != "127.0.0.1":
		connexion += "tcp(" + conf.String(provider+"::host") + ":" + conf.DefaultString(provider+"::port", "3306") + ")"
	}
	connexion += "/" + conf.String("default::db")
	connexion += "?charset=utf8"
	connexion += "&loc=" + url.QueryEscape(conf.String(provider+"::location"))

	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", connexion)

}

func main() {
	dossierLog := beego.AppConfig.DefaultString("logs", "logs")
	_, err := os.Stat(dossierLog)
	if err != nil {
		err = os.Mkdir(dossierLog, 0755)
	}
	beego.SetLogger(
		logs.AdapterMultiFile,
		`{
			"filename": "`+dossierLog+`/`+beego.AppConfig.String("appname")+`.log",
			"daily": true,
			"rotate": true,
			"maxdays": 14,
			"separate": ["alert", "critical", "emergency", "error"]
		}`,
	)
	beego.SetLogFuncCall(true)
	logs.SetPrefix(fmt.Sprintf("[%s]", beego.AppConfig.String("AppName")))

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	signal.Notify(c, syscall.SIGTERM)
	signal.Notify(c, syscall.SIGKILL)
	go func() {
		<-c
		beego.Info("http server Stopped")
		time.Sleep(50 * time.Millisecond)
		os.Exit(0)
	}()

	beego.Run()
}
