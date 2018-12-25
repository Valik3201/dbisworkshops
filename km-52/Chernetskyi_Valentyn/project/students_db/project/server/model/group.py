import datetime

from flask import current_app
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship, foreign

from project.server import db, bcrypt


class Group(db.Model):

    __tablename__ = 'group'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(5), unique=True, nullable=False)
    fuc_id = db.Column(db.Integer, ForeignKey('fuc.id'), nullable=False)
    fuc = relationship('Fuc')

    def __repr__(self):
        return '<Group {0}, id:{1}>'.format(self.email, self.id)

    def serialize(self):
        return {"name": self.name, "id": self.id, "fuc": self.fuc_id}
