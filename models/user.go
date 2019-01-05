package models

import "time"

// 用于前端的user
type VUser struct {
	Id         int    `xorm:"pk autoincr INT(10) notnull "`
	Username   string `xorm:"notnull" json:"username"`
	Appid      string `xorm:"notnull"`
	Name       string `xorm:"notnull"`
	Phone      string `xorm:"notnull"`
	Email      string `xorm:"notnull"`
	Userface   string `xorm:"notnull"`
	CreateTime time.Time
	UpdateTime time.Time
}

type User struct {
	Id         int64    `xorm:"pk autoincr INT(10) notnull "`
	Username   string `xorm:"notnull" json:"username"`
	Password   string `xorm:"notnull" json:"password"`
	Appid      string `xorm:"notnull"`
	Name       string `xorm:"notnull"`
	Phone      string `xorm:"notnull"`
	Email      string `xorm:"notnull"`
	Userface   string `xorm:"notnull"`
	CreateTime time.Time
	UpdateTime time.Time
}
