# -*- coding: utf-8 -*-

import uuid
from ..BaseHandler import BaseHandler
from modules import *
from .. import signin_


class LoginHandler(BaseHandler):

    def get(self):
        if self.get_current_user():
            self.redirect('/')
        else:
            self.render("login.html")

    def post(self):
        username = self.get_argument('username')
        password = self.get_argument('password')

        session = Session()
        is_signin, uuid,  power_= signin_(username, password, session)    #xss

        if not (is_signin):
            self.redirect('/login')
        else:
            self.set_cookie("username", username)
            self.set_cookie("uuid", uuid)
            self.set_cookie("power", str(power_))
            self.redirect('/')


class LogoutHandler(BaseHandler):

    def get(self):
        uid = self.get_current_user()
        self.clear_all_cookies()
        self.redirect("/")

    def post(self):
        self.clear_all_cookies()
        self.redirect("/")


class SignUpHandler(BaseHandler):

    def get(self):
        msg = ''
        self.render("signup.html", msg=msg)
        self.render("signup.html")

    def post(self):
        session = Session()

        username = self.get_argument('username')
        password = self.get_argument('password')

        msg = ''
        if session.query(Auth).filter(Auth.username == username).first():
            msg = '账号存在'
            session.close()
            self.render("signup.html", msg=msg)
        elif (username and password):
            session.add(
                Auth(uuid=uuid.uuid4().hex, username=username,
                     password=password)
            )
            session.commit()
            session.close()
            self.redirect("/login")
        else:
            msg = '账号和密码不能为空'
            self.render("signup.html", msg=msg)
