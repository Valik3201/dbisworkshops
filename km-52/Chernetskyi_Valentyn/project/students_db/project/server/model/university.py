import datetime

from flask import current_app
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship, foreign

from project.server import db, bcrypt


class University(db.Model):

    __tablename__ = 'university'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(5), unique=True, nullable=False)

    def __repr__(self):
        return '<University {0}, id:{1}>'.format(self.id)

    def serialize(self):
        return {"name": self.name, "id": self.id}