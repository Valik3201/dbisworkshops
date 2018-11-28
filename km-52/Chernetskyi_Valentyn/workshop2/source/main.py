from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

user_list = {
     "user_name": "user_1",
     "user_email": "email1@gmail.com"
}

student_list = {
     "first_name": "first",
	 "last_name": "last"

}

@app.route('/api/<action>', methods=['GET'])
def apiget(action):

    if action == "user":
        return render_template("user.html", user=user_list)

    elif action == "student":
        return render_template("students.html", student=student_list)

    elif action == "all":
        return render_template("all.html", user=user_list, student=student_list)

    else:
        return render_template("404.html", action_value=action, link=["user", "student"])

@app.route('/api', methods=['POST'])
def apipost():
	if request.form["action"] == "user_update":
		user_list["user_name"] = request.form["user_name"]
		user_list["user_email"] = request.form["user_email"]
	if request.form["action"] == "student_update":
		student_list["first_name"] = request.form["first_name"]
		student_list["last_name"] = request.form["last_name"]
		
	return redirect(url_for('apiget', action="all"))



if __name__ == '__main__':
    app.run()
