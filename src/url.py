# -*- coding:utf-8 -*-

import tornado.web

from etc import etc
import os
from ctrls.TestHandler import PrintSettingHandler, TestTemplateHandler
from ctrls.user import Signin, Logout, Signup, UserInfoHandler
from ctrls.index import IndexHandler
from ctrls.movie import Moviedetails, MoviesSort
from ctrls.collection import Collection, Comment

url = [

    # 正常业务
    (r'/', IndexHandler),
    (r'/movie/([0-9]*)', Moviedetails),
    (r'/movie/([a-zA-Z]*)', MoviesSort),  #根据不同指标进行排序
    (r'/collection/(.+)/(.*)', Collection),
    (r'/comment/(.+)', Comment),

    # 管理
    (r'/user', UserInfoHandler),
    (r'/signin', Signin),
    (r'/signup', Signup),
    (r'/logout', Logout),

    # 静态文件
    (r'/movie/img/playbill/(.*)', tornado.web.StaticFileHandler, dict(path=os.path.join(etc['movie_assets'], 'playbill'))),

    #   test
    (r'/template', TestTemplateHandler),
    (r'/test', PrintSettingHandler),

]
