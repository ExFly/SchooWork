# -*- coding:utf-8 -*-

import _context

import tornado
import tornado.web
import tornado.ioloop
import tornado.httpserver
from tornado.options import define, options

from etc import etc
from url import url


class Application(tornado.web.Application):
    def __init__(self):
        tornado.web.Application.__init__(self, url,**etc)
        define("port", default=8001, help="run on the given port", type=int)


def main():
    options.parse_command_line()
    http_server = tornado.httpserver.HTTPServer(Application())
    http_server.listen(options.port)
    print('Runing port on {port}, http://localhost:{port}'.format(port=options.port))
    tornado.ioloop.IOLoop.instance().start()


if __name__ == "__main__":
    main()
