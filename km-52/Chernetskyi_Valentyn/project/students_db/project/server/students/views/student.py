from flask import (
    Blueprint, url_for,
    redirect, request, jsonify, render_template
)
from project.server import db

from project.server.model.student import Student
from project.server.model.group import Group
from project.server.model.fuc import Fuc
from project.server.model.university import University

from project.server.students.forms.student import student_validator


bp = Blueprint('student', __name__, url_prefix='/student')

@bp.route('/student_form', methods=['GET'])
def student_form():
    fields = [{"name": "email"}, {"name": "first_name"}, {"name": "last_name"},{"name": "group_id"},]
    return render_template(
        'university/university_form.html',
        fields=fields,
        action='/student/create_student'
        )


@bp.route('/create_student', methods=['POST'])
def add_student():
    student = Student(
        email=request.form['email'],
        first_name=request.form['first_name'],
        last_name=request.form['last_name'],
        group_id=int(request.form['group_id'])
        )
    db.session.add(student)
    db.session.commit()
    return jsonify(student.serialize())

@bp.route('/student_list', methods=['GET'])
def student_list():
    students = (
        Student.query
        .with_entities(
            Student.first_name.label('first_name'),
            Student.last_name.label('last_name'),
            Group.name.label('group_name'),
            Fuc.name.label('fuc_name'),
            University.name.label('university_name')
        )
        .join(Group)
        .join(Fuc)
        .join(University)
        .all()
        )
    resp = []
    students = (
        [{  
            "first_name": student.first_name,
            "last_name": student.last_name,
            "group_name": student.group_name,
            "fuc_name": student.fuc_name,
            "university_name": student.university_name,
        } 
        for student in students])
    return render_template(
        'university/student_list.html',
        students=students,
        )


@bp.route('/student/<int:student_id>')
def student_id(student_id: int):
    student = Student.query.filter(Student.id == student_id).first()
    if student:
        return jsonify(student.serialize())
    resp = jsonify()
    resp.status_code = 404
    return resp