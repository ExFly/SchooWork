# -*- coding:utf-8 -*-

import logging

PORT = '9001'
DEBUG = True
Security = True # xsrf_cookies

LOG_POSITION = './log/log.log'
LOG_FORMAT = '[%(asctime)s] %(name)s %(levelname)-8s %(message)s'
LOG_LEVAL = logging.INFO

MYSQL_DB_LINK = 'mysql+pymysql://root:toor@127.0.0.1/bms?charset=utf8'

# 书封面默认path
BOOK_COVER_PICTURE_PATH = 'bookpicture'
