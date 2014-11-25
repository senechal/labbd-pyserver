from bottle import run
import json
from database.database import DataBaseManager as database
import sys

"""
App.__init__.py:
Script principal do Aplicativo, controla o servidor e a conexção com o banco.
A variavel db é global e é importada onde a conexão com o banco é necessaria.

"""


#Cria o objeto de conexão com o banco de dados.
db = database()
# Importa os controladores.
import controller as __name__

#Função responsavel pelo inico do servidor.
def runserver(host, port):
	run(host=host, port=port)