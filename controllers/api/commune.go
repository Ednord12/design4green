package api

import (
	"design-4-green/libs"
	"design-4-green/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type CommuneAPIController struct {
	beego.Controller
}

func (c *CommuneAPIController) Get() {
	// if c.Ctx.Input.IsAjax() == false {
	// 	c.Ctx.WriteString("")
	// 	return
	// }

	o := orm.NewOrm()
	id := c.Ctx.Input.Param(":id")

	var commune models.Commune

	if err := o.QueryTable(commune).Filter("id", id).RelatedSel().One(&commune); err != nil {
		beego.Error(err)
		if err == orm.ErrNoRows {
			c.Ctx.WriteString("")
			return
		}
	}

	commune.NbCommunes = libs.CalculNombreCommunes()
	c.Data["json"] = commune
	c.ServeJSON()
}
