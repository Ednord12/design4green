package models

import "github.com/astaxie/beego/orm"

type Departement struct {
	ID          int    `json:"id" orm:"auto;pk;column(id)"`
	Nom         string `json:"nom" orm:"column(nom)"`
	ScoreGlobal int    `json:"score_global" orm:"column(score_global)"`
}

func init() {
	orm.RegisterModel(new(Departement))
}

// TableName : table Departement
func (c *Departement) TableName() string {
	return "Departement"
}
