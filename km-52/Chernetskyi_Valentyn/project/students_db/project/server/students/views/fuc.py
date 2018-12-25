from flask import (
    Blueprint, url_for,
    redirect, request, jsonify, render_template
)
from project.server import db

from project.server.model.fuc import Fuc
from project.server.students.forms.fuc import fuc_validator


bp = Blueprint('fac', __name__, url_prefix='/faculties')


@bp.route('/fac_form', methods=['GET'])
def group_form():
    fields = [{"name": "name", "type": 'text'}, {"name": "university_id", "type": 'number'},]
    return render_template(
        'university/university_form.html',
        fields=fields,
        action='/faculties/create_fac'
        )



@bp.route('/create_fac', methods=['POST'])
def add_fac():
    fac = Fuc(
            name=request.form["name"],
            university_id=int(request.form["university_id"])
        )
    db.session.add(fac)
    db.session.commit()
    return jsonify(fac.serialize())

@bp.route('/fac_list', methods=['GET'])
def fac_list():
    faculties = Fac.query.all()
    return jsonify([fac.serialize() for fac in faculties])


@bp.route('/fac/<int:group_id>')
def fac_id(group_id: int):
    fac = fac.query.filter(Fac.id == fac_id).first()
    if fac:
        return jsonify(fac.serialize())
    resp = jsonify()
    resp.status_code = 404
    return resp