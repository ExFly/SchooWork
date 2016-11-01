# -*- coding: utf-8 -*-

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base

import config

BaseModel = declarative_base()
Engine = create_engine(config.MYSQL_DB_LINK, echo=config.DEBUG, encoding='utf8', pool_size=100)
