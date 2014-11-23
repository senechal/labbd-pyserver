# from bottle import route, run, template, post, request
from bottle import run
import json
from database.database import DataBaseManager as database
import sys


db = database()
import controller as __name__
def runserver(host, port):
	run(host=host, port=port)