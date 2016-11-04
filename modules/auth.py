# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey
from sqlalchemy.types import String, VARCHAR, Integer
from .base import BaseModel


class Auth(BaseModel):
    __tablename__ = 'auth'
    uuid = Column(String(32), primary_key=True)
    username = Column(VARCHAR(32), nullable=False)
    password = Column(VARCHAR(32), nullable=False)
    power = Column(Integer, default=1)
