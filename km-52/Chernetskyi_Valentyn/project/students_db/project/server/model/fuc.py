import datetime

from flask import current_app
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship, foreign

from project.server import db, bcrypt


class Fuc(db.Model):

    __tablename__ = 'fuc'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(5), unique=True, nullable=False)
    university_id = db.Column(db.Integer, ForeignKey('university.id'), nullable=False)
    university = relationship('University')

    def __repr__(self):
        return '<University {0}, id:{1}>'.format(self.email, self.id)

    def serialize(self):
    	return {
    		"id": self.id,
    		"name": self.name,
    		"university_id": self.university_id
    	}
