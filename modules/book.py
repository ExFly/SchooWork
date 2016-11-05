# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey
from sqlalchemy.types import String, VARCHAR, Integer, Date
from .base import BaseModel

class Book(BaseModel):
    __tablename__ = 'book'
    id = Column(Integer, primary_key=True)
    name = Column(VARCHAR(32))
    num = Column(VARCHAR(32))
    category = Column(VARCHAR(32)) # 类别
    publishing = Column(VARCHAR(32))# 出版社
    pubdate = Column(Date)
    price = Column(Integer, default=0)
    picture = Column(VARCHAR(32), default='default.png') # 书封面path
