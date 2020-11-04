package api

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type TestApiController struct {
	beego.Controller
}

type testApi struct {
	ID          int    `json:"id" orm:"column(id)"`
	Description string `json:"description" orm:"column(description)"`
}

func (c *TestApiController) Get() {
	o := orm.NewOrm()

	var resultTest []*testApi
	query := "SELECT id, description "
	query += "FROM test "

	if _, err := o.Raw(query).QueryRows(&resultTest); err != nil {
		if err != orm.ErrNoRows {
			beego.Error(err)
		}
	}
	beego.Debug(resultTest)

	for _, t := range resultTest {
		beego.Debug(t)
	}

	c.Data["json"] = resultTest
	c.ServeJSON()
}
