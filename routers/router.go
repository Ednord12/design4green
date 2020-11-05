package routers

import (
	"design-4-green/controllers"
	"design-4-green/controllers/api"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})

	ns := beego.NewNamespace("/api",
		beego.NSRouter("/codepostal/:cp", &api.CodePostalAPIController{}),
		beego.NSRouter("/commune/:id", &api.CommuneAPIController{}),
	)

	beego.AddNamespace(ns)
}
