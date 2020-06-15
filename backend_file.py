from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = params["local_server"]

app = Flask(__name__)

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


@app.route("/")
def homePage():
    return render_template('index.html')

@app.route("/index")
def index():
    return render_template('index.html')

@app.route("/projects")
def projects():
    return render_template('projects.html')

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
    return render_template('contact.html')

app.run(debug=True)
