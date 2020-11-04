package routers

import (
	"design-4-green/controllers"
	"design-4-green/controllers/api"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/api/test", &api.TestApiController{}, "get:Get")
}
