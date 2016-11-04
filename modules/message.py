# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey
from sqlalchemy.types import String, VARCHAR, Integer, Date, Text, DateTime
from .base import BaseModel


class Message(BaseModel):
    __tablename__ = 'messages'
    uuid = Column(String(32), ForeignKey('auth.uuid'), primary_key=True)
    message = Column(VARCHAR(255), primary_key=True)
    date = Column(DateTime, nullable=False)
