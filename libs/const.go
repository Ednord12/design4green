package libs

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

var (
	nombreCommunes int = 0
	scoreGlobalMax int = 0
)

// CalculNombreCommunes retourne le nombre de communes
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

// CalculMax retourne le max de chacun des scores
func CalculMax() int {
	if scoreGlobalMax == 0 {

		o := orm.NewOrm()

		query := "SELECT MAX(score_global) FROM Commune "

		if err := o.Raw(query).QueryRow(&scoreGlobalMax); err != nil {
			beego.Error(err)
		}
	}

	return scoreGlobalMax
}
