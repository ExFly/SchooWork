import modules
import modules.base
from sqlalchemy.orm import sessionmaker

from modules.auth import Auth
from modules.book import Book
from modules.base import Engine
from modules.borrow import BorrowReturn
from modules.message import Message


def init_db():
    modules.base.BaseModel.metadata.create_all(Engine)

def drop_db():
    modules.base.BaseModel.metadata.drop_all(Engine)

Session = sessionmaker(bind=Engine)
