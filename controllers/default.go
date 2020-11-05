package controllers

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/astaxie/beego"
	"github.com/johnfercher/maroto/pkg/consts"
	"github.com/johnfercher/maroto/pkg/pdf"
	"github.com/johnfercher/maroto/pkg/props"
)

type MainController struct {
	beego.Controller
}

type reponse struct {
	CodePostal  string `json:"cp"`
	Commune     string `json:"commune"`
	Iris        string `json:"iris"`
	ScoreGlobal string `json:"score_global"`
	ScoreRegion string `json:"score_reg"`
	ScoreDep    string `json:"score_dep"`
	ScoreAcces1 string `json:"score_acces_1"`
	ScoreAcces2 string `json:"score_acces_2"`
	ScoreComp1  string `json:"score_comp_1"`
	ScoreComp2  string `json:"score_comp_2"`
	Region      string `json:"reg"`
	Departement string `json:"dep"`
}

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

func (c *MainController) Post() {
	var ob reponse
	/*var fichierConf string
	if fichierConf = filepath.Join("static", "css", "styles.css"); !utils.FileExists(fichierConf) {
		beego.Debug("Fichier de configuration 'styles.css' inexistant")
		os.Exit(0)
	}
	c.Ctx.Output.Download(fichierConf, "test.css")

	w.Header().Set("Content-Disposition", "attachment; filename="+strconv.Quote(fichierConf))
	w.Header().Set("Content-Type", "application/octet-stream")
	http.ServeFile(w, r, fichierConf)*/

	json.Unmarshal(c.Ctx.Input.RequestBody, &ob)

	m := pdf.NewMaroto(consts.Portrait, consts.Letter)

	m.Row(40, func() {
		m.Row(120, func() {
			m.Text("Fragil'Indice", props.Text{
				Top:         12,
				Size:        30,
				Extrapolate: true,
			})
			m.Text("Code Postal : "+ob.CodePostal, props.Text{
				Size: 12,
				Top:  30,
			})
			m.Text("Commune : "+ob.Commune, props.Text{
				Size: 12,
				Top:  40,
			})
			m.Text("Région : "+ob.Region, props.Text{
				Size: 12,
				Top:  50,
			})
			m.Text("Département : "+ob.Departement, props.Text{
				Size: 12,
				Top:  60,
			})
			m.Text("Scores : ", props.Text{
				Size: 12,
				Top:  70,
			})
			m.Text(ob.ScoreGlobal, props.Text{
				Size:  12,
				Top:   80,
				Align: consts.Center,
			})
			m.Text("Regional : "+ob.ScoreRegion, props.Text{
				Size:  12,
				Top:   90,
				Align: consts.Center,
			})
			m.Text("Departemental : "+ob.ScoreDep, props.Text{
				Size:  12,
				Top:   100,
				Align: consts.Center,
			})
			m.Text("Acces aux interfaces numérique : "+ob.ScoreAcces1+" ---------  Acces à l'information : "+ob.ScoreAcces2, props.Text{
				Size:  12,
				Top:   110,
				Align: consts.Center,
			})
			m.Text("Compétences administratives "+ob.ScoreComp1+" ---------  Compétences numériques/scolaires : "+ob.ScoreComp2, props.Text{
				Size:  12,
				Top:   120,
				Align: consts.Center,
			})
		})
		m.ColSpace(4)
	})

	err := m.OutputFileAndClose("Indices_Fragilite_Numerique.pdf")
	if err != nil {
		fmt.Println("Could not save PDF:", err)
		os.Exit(1)
	}
	c.Redirect("#", 200)
}
