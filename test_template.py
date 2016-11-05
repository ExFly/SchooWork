#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# Copyright @ 2016 Exborn
#

import os
import tornado.web
import tornado.httpserver
import tornado.ioloop


class IndexHandler(tornado.web.RequestHandler):
    def get(self):
        self.render("index.html")


class BookInfoHandler(tornado.web.RequestHandler):
    def get(self):
        self.render('bookinfo.html')


class Application(tornado.web.Application):
    def __init__(self):
        handlers = [
            (r"/", IndexHandler),
            (r"/bookinfo", BookInfoHandler),
        ]
        settings = {
            "static_path": os.path.join(os.path.dirname(__file__), "static"),
            "template_path": os.path.join(os.path.dirname(__file__), "templates"),
            "login_url": "/login",
            "cookie_secret": "61oErDjxqAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",
            "xsrf_cookies": True,
            "debug": True,
        }
        tornado.web.Application.__init__(self, handlers, **settings)


def main():
    http_server = tornado.httpserver.HTTPServer(Application())
    http_server.listen('8080')
    print('Run port at {0}'.format('8080'))
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()