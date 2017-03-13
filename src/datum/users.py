# -*- coding:utf-8 -*-
from datum.Datum import Datum

class UsersDatum(Datum):
    def get_user_by_id(self, user_id):
        return self.single('select * from users where id = :user_id;', user_id=user_id)

    def get_user_by_name(self, name):
        return self.single('select * from users where username = :name', name=name)

    def get_user_by_mail(self, mail):
        userinfo = self.single('select userid from userinfo where email = :mail', mail=mail)
        return self.get_user_by_id(userinfo['userid'])

    def get_userinfo_by_id(self, user_id):
        return self.single('select * from users, userinfo where users.id=:user_id and users.id=userinfo.userid;', user_id=user_id)

    def add_one_user(self,
                     userid, username, pwd, salt, auid, cretime, modtime):
        self.affect(
            'insert into users (id,username, password, salt, authid, create_time, modify_time) values (:userid, :username,:pwd, :salt, :auid,:cretime,:modtime);',
            userid=userid, username=username, pwd=pwd, salt=salt, auid=auid, cretime=cretime, modtime=modtime)
