# -*- coding:utf-8 -*-

from ctrls.base import BaseHandler

class PrintSettingHandler(BaseHandler):
    def get(self):
        self.write(str(self.settings)+ '<br><a href="/logout">logout</a><br><a href="/signin">signin</a><br><a href="/signup">signup</a><br>'+ str(self.get_current_user())+" ")


class TestTemplateHandler(BaseHandler):
    def get(self, *args, **kwargs):
        self.render('index.html' , two = '?????')
