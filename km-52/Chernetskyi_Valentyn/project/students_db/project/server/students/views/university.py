from flask import (
    Blueprint, url_for,
    redirect, request, jsonify, render_template
)
from project.server import db

from project.server.model.university import University
from project.server.students.forms.university import university_validator


bp = Blueprint('university', __name__, url_prefix='/university')


@bp.route('/university_form', methods=['GET'])
def university_form():
    fields = [{
        "name": "name"
    },]
    return render_template(
        'university/university_form.html',
        fields=fields,
        action='/university/create_university'
        )


@bp.route('/create_university', methods=['POST'])
def add_university():
    print(request.form)
    if university_validator.validate(request.form):
        print(university_validator.document['name'])
        university = University(
            name=university_validator.document['name']
        )
        db.session.add(university)
        db.session.commit()

        return jsonify(university.serialize())
    resp = jsonify({"errors": university_validator.errors})
    resp.status_code = 422
    return resp


@bp.route('/universities', methods=['GET'])
def university_list():
	universities = University.query.all()
	return jsonify([university.serialize() for university in universities])


@bp.route('/universities/<int:university_id>')
def university_id(university_id: int):
    university = University.query.filter(University.id == university_id).first()
    print(university.name)
    if university:
        return jsonify(university.serialize())
    resp = jsonify()
    resp.status_code = 404
    return resp