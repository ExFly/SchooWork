# -*- coding: utf-8 -*-

from ..BaseHandler import BaseHandler
from modules import *
from .. import signin_
class LoginHandler(BaseHandler):
    def get(self):
        self.render("login.html")

    def post(self):
        username = self.get_argument('username')
        password = self.get_argument('password')

        session = Session()
        is_signin, uuid = signin_(username, password, session)    #xss

        if not (is_signin):
            self.redirect('/login')

        self.set_cookie("username", username)
        self.set_cookie("uuid", uuid)
        self.redirect('/')


class LogoutHandler(BaseHandler):
    def get(self):
        uid = self.get_current_user()
        self.clear_all_cookies()
        self.redirect("/")

    def post(self):
        self.clear_all_cookies()
        self.redirect("/")