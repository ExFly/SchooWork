# -*- coding:utf-8 -*-

from ctrls.base import BaseHandler

class IndexHandler(BaseHandler):
    def get(self):
        movies = self.datum('movies').result('select * from movies order by douban_score desc limit 250;')
        self.render('index.html', movies=movies)
