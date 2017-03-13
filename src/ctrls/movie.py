# -*- coding:utf-8 -*-

from ctrls.base import BaseHandler

class Moviedetails(BaseHandler):
    def get(self, id):
        comments = self.datum('datum').result(
            r'select ui.*, users.username from user_movie_impressions ui, users where ui.userid=users.id and movieid=:movieid;', movieid=id
        )
        movie = self.datum('movies').single(r'select * from movies where id=:id', id=id)
        self.render('moviedetails.html', movie=movie, comments=comments)


class MoviesSort(BaseHandler):
    # TODO: 根据不同标准排序
    def get(self, sort_type):
        movies = {}
        if sort_type == 'classical':
            movies = self.datum('movies').result('select * from movies order by douban_score desc limit 250;')
        elif sort_type == 'new':
            movies = self.datum('movies').result('select * from movies order by `release` limit 250;')
        elif sort_type == 'hot':
            movies = self.datum('movies').result('select * from movies order by douban_score desc limit 250;')
        else:
            movies = self.datum('movies').result('select * from movies,filmtype, filmtype_meta where movies.id=filmtype.movieid and filmtype.filmtype=filmtype_meta.id and filmtype_meta.type=:movietype order by douban_score desc limit 250;', movietype=sort_type)

        self.render('movielist.html', movies=movies)
