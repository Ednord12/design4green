package models

import "github.com/astaxie/beego/orm"

type Region struct {
	ID          int        `json:"id" orm:"auto;pk;column(id)"`
	Nom         string     `json:"nom" orm:"column(nom)"`
	ScoreGlobal int        `json:"score_global" orm:"column(score_global)"`
	Commune     []*Commune `json:"commune,omitempty" orm:"reverse(many)"`
}

func init() {
	orm.RegisterModel(new(Region))
}

// TableName : table Region
func (c *Region) TableName() string {
	return "Region"
}
