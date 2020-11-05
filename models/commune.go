package models

import "github.com/astaxie/beego/orm"

type Commune struct {
	ID               int          `json:"id" orm:"auto;pk;column(id)"`
	NomIris          string       `json:"nom_iris,omitempty" orm:"column(nom_iris)"`
	CodePostal       string       `json:"code_postal,omitempty" orm:"column(code_postal)"`
	NomCommune       string       `json:"nom_commune" orm:"column(nom_commune)"`
	ScoreGlobal      int          `json:"score_global" orm:"column(score_global)"`
	ScoreAccesIntnum int          `json:"score_acces_intnum" orm:"column(score_acces_intnum)"`
	ScoreAccesInfo   int          `json:"score_acces_info" orm:"column(score_acces_info)"`
	ScoreCompAdmin   int          `json:"score_comp_admin" orm:"column(score_comp_admin)"`
	ScoreCompNumsco  int          `json:"score_comp_numsco" orm:"column(score_comp_numsco)"`
	Departement      *Departement `json:"departement" orm:"rel(fk)"`
	Region           *Region      `json:"region,omitempty" orm:"rel(fk)"`
	Rang             int          `json:"rang" orm:"column(rang)"`
	NbCommunes       int          `json:"nb_communes" orm:"-"`
	ScoreMax         int          `json:"score_max" orm:"-"`
}

func init() {
	orm.RegisterModel(new(Commune))
}

// TableName : table Commune
func (c *Commune) TableName() string {
	return "Commune"
}
