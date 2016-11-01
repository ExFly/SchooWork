import modules
import modules.base
from modules.auth import Auth, Group
from modules.base import Engine
from sqlalchemy.orm import sessionmaker

def init_db():
    modules.base.BaseModel.metadata.create_all(modules.base.Engine)

def drop_db():
    modules.base.BaseModel.metadata.drop_all(modules.base.Engine)

Session = sessionmaker(bind=modules.base.Engine)


if __name__ == '__main__':
    pass
