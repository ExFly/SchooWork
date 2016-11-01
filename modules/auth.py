# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey
from sqlalchemy.types import String, VARCHAR
from .base import BaseModel

class Auth(BaseModel):
    __tablename__ = 'auth'
    uuid = Column(VARCHAR(32), primary_key=True)
    username = Column(VARCHAR(32), nullable=False)
    password = Column(VARCHAR(32), nullable=False)

class Group(BaseModel):
    __tablename__ = 'groups'
    uuid = Column(VARCHAR(32), ForeignKey('auth.uuid'), index=True, nullable=False, primary_key=True)
    group = Column(VARCHAR(32), nullable=False, primary_key=True)
