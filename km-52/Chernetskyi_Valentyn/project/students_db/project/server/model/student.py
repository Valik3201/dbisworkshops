import datetime

from flask import current_app
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship, foreign

from project.server import db, bcrypt


class Student(db.Model):

    __tablename__ = 'students'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    first_name = db.Column(db.String(255), nullable=False)
    last_name = db.Column(db.String(255), nullable=False)
    group_id = db.Column(db.Integer, ForeignKey('group.id'), nullable=False)
    group = relationship('Group')

    def __repr__(self):
        return '<Student {0}, id:{1}>'.format(self.email, self.id)

    def serialize(self):
        return {
            "first_name": self.first_name,
            "email": self.email,
            "last_name": self.last_name,
            "group_id": self.group_id
        }
