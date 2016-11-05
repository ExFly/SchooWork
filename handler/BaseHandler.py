# -*- coding:utf-8 -*-

import tornado.web


class BaseHandler(tornado.web.RequestHandler):
    def get_current_user(self):
        return self.get_cookie("uuid")

    def get_option(self, title):
        username = self.get_cookie('username')
        option = {
            'username': username,
            'title': title,
        }
        return option
