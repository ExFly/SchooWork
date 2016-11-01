#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# Copyright @ 2016 Exborn
# 

import os
import tornado.web
import tornado.httpserver
import tornado.ioloop

import config
from handler.auth.LoginHandler import LoginHandler, LogoutHandler
from handler.IndexHandler import IndexHandler


class Application(tornado.web.Application):
    def __init__(self):
        handlers = [
            (r"/", IndexHandler),
            (r'/login', LoginHandler),
            (r'/logout', LogoutHandler),
        ]
        settings = {
            "static_path": os.path.join(os.path.dirname(__file__), "static"),
            "template_path": os.path.join(os.path.dirname(__file__), "templates"),
            "login_url": "/login",
            "cookie_secret": "61oErDjxqAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
            "xsrf_cookies": config.Security,
            "debug": config.DEBUG,
        }
        tornado.web.Application.__init__(self, handlers, **settings)

def main():
    http_server = tornado.httpserver.HTTPServer(Application())
    http_server.listen(config.PORT)
    print('Run port at {0}'.format(config.PORT))
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()
