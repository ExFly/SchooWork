# -*- coding:utf-8 -*-

import tornado.web

from ctrls.base import BaseHandler
from models.admin import AdminModel


class Signin(BaseHandler):
    def get(self):
        self.del_current_sess()
        self.render('signin.html', next=self.input('next', '/'))

    def post(self):
        if not self.human_valid():
            return
        username = self.input('username')
        password = self.input('password')
        remember = self.input('remember', None)
        redirect = self.input('redirect', '/')

        if remember:
            remember = int(remember)

        user = self.datum('users').get_user_by_name(username)
        self.write(str(AdminModel.signin(username, password)))
        if user and AdminModel.signin(username, password):
            self.set_current_sess(user, days=remember)
            self.redirect('/')
        else:
            self.get_logger('safe').info('signin  faild:'+ username + " " + password)
            self.redirect('/signin')


class Signup(BaseHandler):
    def get(self):
        self.render('signup.html')

    def post(self):
        username = self.input('username')
        password = self.input('password')
        self.model('admin').signup(username, password)
        self.redirect('/signin')


class Logout(BaseHandler):
    def get(self):
        self.del_current_sess()
        self.redirect('/')


class UserInfoHandler(BaseHandler):
    @tornado.web.authenticated
    def get(self):
        # users中的内容
        userinfo = self.datum('users').get_user_by_id(self.current_user)
        self.render('userinfo.html', userinfo=userinfo)
