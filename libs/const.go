package libs

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

var (
	nombreCommunes int = 0
)

func CalculNombreCommunes() int {
	if nombreCommunes == 0 {

		o := orm.NewOrm()

		query := "SELECT MAX(rang) FROM Commune "

		if err := o.Raw(query).QueryRow(&nombreCommunes); err != nil {
			beego.Error(err)
		}
		beego.Debug(nombreCommunes)
	}

	return nombreCommunes
}
