from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime
import json


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = params["local_server"]

app = Flask(__name__)
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params["gmail-user"],
    MAIL_PASSWORD = params["gmail-password"]
)

mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):

    # sno, name , phone_no , msg , date , email
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_no = db.Column(db.String(12),  nullable=False)
    msg = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(12),  nullable=True)
    email = db.Column(db.String(20),  nullable=False)


class Projects(db.Model):
    serial_number = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    project_name = db.Column(db.String(120), nullable=False)
    content = db.Column(db.String(12), nullable=True)
    site = db.Column(db.String(120), nullable=True)


@app.route("/")
def homePage():
    return render_template('index.html' , params = params)


@app.route("/project/<string:project_slug>", methods=['GET'])
def project_route(project_slug):
    project = Projects.query.filter_by(slug=project_slug).first()
    return render_template('project.html', params=params, project=project)

@app.route("/index")
def index():
    return render_template('index.html', params = params)

@app.route("/login")
def login():
    return render_template('login.html', params = params)

@app.route("/projects")
def projects():
    projects = Projects.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('projects.html', projects = projects)

@app.route("/whatever")
def whatever():
    return render_template('whatever.html')

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name= name, phone_no = phone, msg = message, date = datetime.now(),  email = email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name, sender=email, 
                recipients = [params['gmail-user']],
                body = message + "\n" + phone
                )
    return render_template('contact.html')

app.run(debug=True)
