from flask import (
    Blueprint, url_for,
    redirect, request, jsonify, render_template
)
from project.server import db

from project.server.model.group import Group
from project.server.students.forms.group import group_validator


bp = Blueprint('group', __name__, url_prefix='/groups')


@bp.route('/group_form', methods=['GET'])
def group_form():
    fields = [{"name": "name"}, {"name": "fuc_id"},]
    return render_template(
        'university/university_form.html',
        fields=fields,
        action='/groups/create_group'
        )



@bp.route('/create_group', methods=['POST'])
def add_group():
    group = Group(
        name=request.form['name'],
        fuc_id=int(request.form['fuc_id'])
        )
    db.session.add(group)
    db.session.commit()
    return jsonify(group.serialize())

@bp.route('/group_list', methods=['GET'])
def group_list():
	groups = Group.query.all()
	return jsonify([group.serialize() for group in groups])


@bp.route('/group/<int:group_id>')
def group_id(group_id: int):
    group = Group.query.filter(Group.id == group_id).first()
    if group:
        return jsonify(group.serialize())
    resp = jsonify()
    resp.status_code = 404
    return resp