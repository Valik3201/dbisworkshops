from cerberus import Validator
from sqlalchemy.sql import exists

from project.server.model.fuc import Fuc
from project.server.model.university import University

from project.server import db


def unique_name(field, value, error):
    if db.session.query(exists().where(Fuc.name == value)).scalar():
        error(field, "Fuc with this name already exists")


def university_foreignkey(field, value, error):
    if not db.session.query(exists().where(University.id == value)).scalar():
        error(field, "University with this id does not exist")


fuc_schema = {
	'name': {'type':'string', 'validator': unique_name },
	'university_id': {'type':'integer', 'validator': university_foreignkey }
}

fuc_validator = Validator(fuc_schema)