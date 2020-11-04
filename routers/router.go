package routers

import (
	"design-4-green/controllers"
	"design-4-green/controllers/api"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})

	ns := beego.NewNamespace("/api",
		beego.NSRouter("/test", &api.TestApiController{}, "get:Get"),
		beego.NSRouter("/codepostal/:cp", &api.CodePostalAPIController{}, "get:Get"),
		beego.NSRouter("/commune/:id", &api.CommuneAPIController{}, "get:Get"),
	)

	beego.AddNamespace(ns)
}
