# -*- coding:utf-8 -*-
# 收集用户喜好

import datetime
import tornado
import tornado.web
from ctrls.base import BaseHandler


class Collection(BaseHandler):
    @tornado.web.authenticated
    def get(self, hadsaw_want, movieid):
        self.datum('movies').hadsaw_want(self.current_user, hadsaw_want, movieid)
        self.redirect('/movie/{0}'.format(movieid))

    @tornado.web.authenticated
    def post(self, hadsaw_want, movieid):
        self.get(hadsaw_want, movieid)
        self.redirect('/movie/{0}'.format(movieid))


class Comment(BaseHandler):
    @tornado.web.authenticated
    def get(self, movieid):
        self.render('comment.html', movieid=movieid)

    @tornado.web.authenticated
    def post(self, movieid):
        userid = self.current_user
        score = self.input("score")
        comment = self.input('comment')
        datum = self.datum('datum')
        if score == '':
            # TODO: 评论内容不可以为空的判断不成功
            self.redirect('/movie/{0}'.format(movieid))

        result = datum.single('select * from user_movie_impressions where userid=:userid and movieid=:movieid',
                                   userid=userid, movieid=movieid)
        if not result:
            datum.affect('insert into user_movie_impressions(userid,movieid,score,comment,datetime)'
                        ' VALUE (:userid,:movieid,:score,:comment,:datetime);',
                         userid=userid,movieid=movieid,score=score,comment=comment, datetime=datetime.datetime.now())
        else:
            datum.affect("update user_movie_impressions set score=:score,comment=:comment,datetime=:datetime where userid=:userid and movieid=:movieid;",
                         userid=userid, movieid=movieid,score=score, comment=comment, datetime=datetime.datetime.now())
        self.redirect('/movie/{0}'.format(movieid))
