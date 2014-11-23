# -*- coding: utf-8 -*-
from bottle import route, run, template, post, request, response
from models.pessoa import Pessoa 
from models.artigo import Artigo
from models.despesa import Despesa
from models.edicao import Edicao
from models.escreve import Escreve
from models.evento import Evento
from models.inscrito import Inscrito
from models.organiza import Organiza
from models.patrocinador import Patrocinador
from models.patrocinio import Patrocinio
from models.base import GenericModel
from database.database import Q
from bin.util import dumps

sucess = dumps({'error':0,'message':'OK'})

#
#
#	EVENTOS
#
#

@route('/eventos')
def eventos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		eventos = Evento.objects().all()
		print type(eventos.getJson())
		return eventos.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarevento')
def editarcriarevento():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict = {} #TODO, receber dicionario postado
	try:
		evento = Evento(dict)
		evento.save()
		return sucess
	except ValueError as e:
		return e.message

@post('/deletarevento')
def deletarevento():
	response.content_type = 'application/json; charset=charset=UTF8'
	codEv = ''#TODO pegar o id do eventos
	try:
		evento = Evento.objects().get(codEv = codEv)
	except ValueError as e:
		return e.message
	try:
		evento.delete()
		return sucess
	except ValueError as e:
		return e.message


#
#
#	EDIÇOES
#
#


@route('/edicoes')
def eventos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		edicoes = Edicao.objects().all()
		return edicoes.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriaredicao')
def editarcriaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict = {} #TODO, receber dicionario postado
	try:
		edicao = Edicao(dict)
		edicao.save()
		return sucess
	except ValueError as e:
		return e.message

@post('/deletaredicao')
def deletaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	codEv = ''#TODO pegar o codEv
	numEd = ''#TODO pegar o numEd
	try:
		edicao = Edicao.objects().get(codEv = codEv, numEd = numEd)
	except ValueError as e:
		return e.message
	try:
		edicao.delete()
		return sucess
	except ValueError as e:
		return e.message


#
#
#	PESSOAS
#
#

@route('/pessoa')
def eventos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		pessoas = Pessoa.objects().all()
		return pessoas.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriaredicao')
def editarcriaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict = {} #TODO, receber dicionario postado
	try:
		pessoa = Pessoa(dict)
		pessoa.save()
		return sucess
	except ValueError as e:
		return e.message

@post('/deletarpessoa')
def deletaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	idPe = ''#TODO pegar o idPe
	try:
		pessoa = Pessoa.objects().get(idPe =idPe)
	except ValueError as e:
		return e.message
	try:
		pessoa.delete()
		return sucess
	except ValueError as e:
		return e.message

@route('/testepessoa')
def testpoess():
	dict = {"tipoAutor": 1, "instituicaoPe": "Hong Kong Baptist University", "enderecoPe": "Kowloon Tong, Hong Kong", "nomePe": "teste test", "emailPe": "aaaa444@aaaaaa.com.br", "tipoParticipante": 1, "telefonePe": "415-327-0583", "nacionalidadePe": "Chinesa", "tipoOrganizador": 0}
	pessoa = Pessoa(dict)
	try:
		pessoa.save()
		print pessoa.idPe
	except ValueError as e:
		return e.message