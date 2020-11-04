package api

import (
	"design-4-green/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type CodePostalAPIController struct {
	beego.Controller
}

func (c *CodePostalAPIController) Get() {
	// if c.Ctx.Input.IsAjax() == false {
	// 	c.Ctx.WriteString("")
	// 	return
	// }

	o := orm.NewOrm()
	cp := c.Ctx.Input.Param(":cp")

	var communesCP []*models.Commune
	var params []interface{}
	query := "SELECT id, nom_commune, nom_iris "
	query += "FROM Commune "
	query += "WHERE code_postal = ? "

	params = append(params, cp)

	if _, err := o.Raw(query, params...).QueryRows(&communesCP); err != nil {
		if err != orm.ErrNoRows {
			beego.Error(err)
		}
	}

	if len(communesCP) == 0 {
		c.Ctx.WriteString("")
		return
	}

	for _, com := range communesCP {
		if com.NomCommune == com.NomIris {
			com.NomIris = ""
		}
	}

	c.Data["json"] = communesCP
	c.ServeJSON()

}
