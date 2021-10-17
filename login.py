from flask import Flask, render_template, url_for,  redirect, request, session
import os
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from datetime import date
from textblob import TextBlob
from sqlalchemy.sql import func
from sqlalchemy import desc
from sqlalchemy import extract

server = app.server
app= Flask(__name__)
app.secret_key ="hithere"

db = SQLAlchemy()
app.config["SQLALCHEMY_DATABASE_URI"] = 'mysql+mysqlconnector://root:1@localhost/login'
app.config['SECRET_KEY'] = "random string"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)
class complains(db.Model):
    __tablename__ = "complains"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    reason = db.Column(db.String(100), nullable=False)
    fot = db.Column(db.String(100), nullable=True)
    there_name = db.Column(db.String(20), nullable=False)
    complain = db.Column(db.String(400), nullable=False)
    state = db.Column(db.String(20), default='unseen')
    date = db.Column(db.DateTime, default=func.now())
    


class admin(db.Model):
    __tablename__ = 'admin'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    
class students(db.Model):
    __tablename__ = 'students'
    Rn = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    batch = db.Column(db.String(100), nullable=False)
    Semester = db.Column(db.String(10), nullable=False)
    
class chair(db.Model):
    __tablename__ = 'chair'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)



@app.route("/chairman", methods=['GET'])
def his():
    compl = complains.query.filter(complains.state == 'varified').all()
    if session.get('username')=='his':
    
    
     return render_template("chair.html",compl=compl)
    else:
     return redirect(url_for('web'))
     
     
@app.route("/New", methods=['GET'])
def new():
    compl = complains.query.filter(complains.state == 'unseen').order_by(complains.date).all()
    if session.get('username')=='his':
    
    
     return render_template("chair.html",compl=compl)
    else:
     return redirect(url_for('web'))
     
@app.route("/rejected", methods=['GET'])
def rejected():
    compl = complains.query.filter(complains.state == 'rejected').all()
    if session.get('username')=='his':
    
    
     return render_template("chair.html",compl=compl)
    else:
     return redirect(url_for('web'))
     
@app.route("/acknowladged", methods=['GET'])
def acknowladged():
    compl = complains.query.filter(complains.state == 'acknowladged').all()
    if session.get('username')=='his':
    
    
     return render_template("chair.html",compl=compl)
    else:
     return redirect(url_for('web'))




@app.route("/student/<path:name>", methods=['GET'])
def student(name):
    if session.get('username')=='n':
       today = date.today()
       month = complains.query.filter(name==complains.name,extract('month', complains.date)  == today.month).all() 
       if not month: 
        return render_template("student.html",name=name)
        print ("full")
        
       else:
        return render_template("student2.html",name=name)
        print (month)
     

    
    
       
    else:
     return redirect(url_for('web'))

@app.route("/studentack/<name>", methods=['GET'])
def ack(name):
    compl = complains.query.filter(name==complains.name,complains.state == 'acknowladged').all()
    if session.get('username')=='n':
    
    
     return render_template("studentmsg.html",compl=compl,name=name)
    else:
     return redirect(url_for('web'))    
     
@app.route("/studentsent/<name>", methods=['GET'])
def sent(name):
    compl = complains.query.filter(name==complains.name).all()
    if session.get('username')=='n':
    
    
     return render_template("studentmsg.html",compl=compl,name=name)
    else:
     return redirect(url_for('web')) 
     

@app.route("/", methods=['GET'])
def hello():
    compl = complains.query.all()
    if session.get('username')=='admin':
     


     return render_template("admin.html",compl=compl)
    else:
     return redirect(url_for('web'))

@app.route("/pending", methods=['GET'])
def pending():
    compl = complains.query.filter(complains.state =='unseen' ).all()
    if session.get('username')=='admin':
       return render_template("admin.html",compl=compl)
    else:
     return redirect(url_for('web'))


@app.route("/verify", methods=['GET'])
def verify():
    compl = complains.query.filter(complains.state == 'varified').all()
    if session.get('username')=='admin':
       return render_template("admin.html",compl=compl)
    else:
     return redirect(url_for('web'))
     
@app.route("/reject", methods=['GET'])
def rejectadmin():
    compl = complains.query.filter(complains.state == 'Rejected').all()
    if session.get('username')=='admin':
       return render_template("admin.html",compl=compl)
    else:
     return redirect(url_for('web'))



@app.route("/login", methods=['GET', 'POST'])
def web():
   error = None

   if request.method == 'POST':
       username = request.form['username'] 
       password = request.form['password'] 
       admins = admin.query.filter(admin.username == username).first()
       student = students.query.filter(students.name == username).first()
       chairs = chair.query.filter(chair.name == username).first()
       
       if admins != None and username.lower() == admins.username and password==admins.password: 
                 session['username'] = "admin"
                 return redirect(url_for('hello'))
       if student != None and username.lower() == student.name and password==student.password :
                 session['username'] = "n"
                 name=student.name
                 return redirect(url_for('student',name=name))
       elif chairs != None and username.lower() == chairs.name and password==chairs.password:
                 session['username'] = "his"
                 return redirect(url_for('his'))
       else:
                 error = "Wrong password or name"
                 return render_template("login.html",error=error)
            

   else:


       return render_template("login.html",error=error)

@app.route("/intro", methods=['POST', 'GET'])
def intro():
    if request.method == "POST":
        username = request.form.get("username")
        reason = request.form.get("reason")
        fot = request.form.get("fot")
        there_name = request.form.get("there_name")
        complain = request.form.get("complain")
        
        
        
        stud = complains(name = username, reason=reason,  
        fot=fot,there_name=there_name,complain=complain)
        db.session.add(stud)
        db.session.commit() 
        return redirect(url_for('student',name=username))
    else:
        return redirect(url_for('web'))   
        
@app.route("/update/<int:id>/", methods=['GET', 'POST'])
def update(id):
   
       status = complains.query.filter_by(id = id).first()
       
       status.state="varified"
       db.session.commit()
       
       return redirect(url_for('verify'))
       
@app.route("/know/<int:id>", methods=['GET', 'POST'])
def acknowladge(id):
   
       status = complains.query.filter_by(id = id).first()
       
       status.state="Acknowladged"
       db.session.commit()
       
       return redirect(url_for('his'))
       
       
@app.route("/reject/<int:id>", methods=['GET', 'POST'])
def reject(id):
   
       status = complains.query.filter_by(id = id).first()
       
       status.state="rejected"
       db.session.commit()
       
       return redirect(url_for('his'))
 
@app.route("/delete/<int:id>/", methods=['POST','GET'])
def delete(id):
      
        group = complains.query.get(id)
        db.session.delete(group)
        db.session.commit()
        return redirect(url_for('hello'))
    
   
@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for('web'))
    
    
if __name__ == "__main__":
    app.run(debug=True)
