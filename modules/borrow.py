# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey
from sqlalchemy.types import String, VARCHAR, Integer
from .base import BaseModel


class BorrowReturn(BaseModel):
    __tablename__ = 'borrowreturn'
    uuid = Column(String(32), ForeignKey('auth.uuid') , primary_key=True)
    book = Column(Integer, ForeignKey('book.id'), primary_key=True)
    # bdate = 
    