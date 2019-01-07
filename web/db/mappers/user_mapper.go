package mappers

import (
	"go-iris/web/db"
	"go-iris/web/models"

	"github.com/go-xorm/xorm"
	"github.com/kataras/golog"
)

//type Query func(user models.User) bool

type UserMapper interface {
	RegisteUser(user *models.User) error
	QueryByUsername(user *models.User) (bool, error)
}

func NewUserMapper() UserMapper {
	return &userMapper{
		db: db.MasterEngine(),
	}
}

type userMapper struct {
	db *xorm.Engine
}

func (m *userMapper) RegisteUser(user *models.User) error {
	golog.Info(user)
	_, err := m.db.Insert(user)
	return err
}

func (m *userMapper) QueryByUsername(user *models.User) (bool, error) {
	return m.db.Get(user)
}
