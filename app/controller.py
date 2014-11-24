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
from bin.util import dumps, parse
import json


def success(content = None):
	dict = {'error':0,'message':'OK'}
	if content:
		dict.update({'content':content})
	return dumps(dict)



""" 
Modelos:	
Artigo,			X
Auxilio,		X
Despesa,		X
Edição,			X
Escreve, 
Evento,	 		X
Inscrito,		X
Organiza,		X
Patrocinador,	X
Patrocinio,		X
Pessoa,			X

"""

#
#
#	ARTIGO
#
#

@route('/artigos')
def artigos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		artigos = Artigo.objects().all()
		return artigos.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarartigo')
def editarcriarartigo():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		artigo = Artigo(dict)
		artigo.save()
		return sucess(artigo)
	except ValueError as e:
		return e.message

@post('/deletarartigo')
def deletarartigo():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	idArt = dict.get('idArt')
	try:
		artigo = Artigo.objects().get(idArt = idArt)
	except ValueError as e:
		return e.message
	try:
		artigo.delete()
		return sucess()
	except ValueError as e:
		return e.message

#
#
#	AUXILIO
#
#

@route('/auxilios')
def auxilios():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		auxilios = Auxilio.objects().all()
		return auxilios.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarauxilio')
def editarcriarauxilio():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		auxilio = Auxilio(dict)
		auxilio.save()
		return sucess(auxilio)
	except ValueError as e:
		return e.message

@post('/deletarauxilio')
def deletarauxilio():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	codEvApr = dict.get('codEvApr')
	numEdApr = dict.get('numEdApr')
	idApr = dict.get('idApr')
	tipoAux = dict.get('tipoAux')
	try:
		auxilio = Auxilio.objects().get(codEvApr = codEvApr, numEdApr = numEdApr, idApr = idApr, tipoAux = tipoAux)
	except ValueError as e:
		return e.message
	try:
		auxilio.delete()
		return sucess()
	except ValueError as e:
		return e.message


#
#
#	DESPESAS
#
#

@route('/despesas')
def despesas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		despesas = Despesa.objects().all()
		return despesas.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriardespesa')
def editarcriardespesa():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		despesa = Despesa(dict)
		despesa.save()
		return sucess(despesa)
	except ValueError as e:
		return e.message

@post('/deletardespesa')
def deletardespesa():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	#'codDesp', 'codEv', 'numEd'
	codDesp = dict.get('codDesp')
	codEv = dict.get('codEv')
	numEd = dict.get('numEd')
	try:
		despesa = Despesa.objects().get(codDesp = codDesp, codEv = codEv, numEd = numEd)
	except ValueError as e:
		return e.message
	try:
		despesa.delete()
		return sucess()
	except ValueError as e:
		return e.message




#
#
#	EDIÇÃO
#
#


@route('/edicoes')
def edicoes():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		edicoes = Edicao.objects().all()
		return edicoes.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriaredicao')
def editarcriaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		edicao = Edicao(dict)
		edicao.save()
		return sucess(edicao)
	except ValueError as e:
		return e.message

@post('/deletaredicao')
def deletaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	codEv = dict.get('codEv')
	numEd = dict.get('numEd')
	try:
		edicao = Edicao.objects().get(codEv = codEv, numEd = numEd)
	except ValueError as e:
		return e.message
	try:
		edicao.delete()
		return sucess()
	except ValueError as e:
		return e.message

#
#
#	ESCREVE
#
#


#TODO : ESCREVE

#
#	EVENTO
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
	data, = request.body.readlines()
	dict = parse(data)
	try:
		evento = Evento(dict)
		evento.save()
		return sucess(evento)
	except ValueError as e:
		return e.message

@post('/deletarevento')
def deletarevento():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	codEv = dict.get('codEv')
	try:
		evento = Evento.objects().get(codEv = codEv)
	except ValueError as e:
		return e.message
	try:
		evento.delete()
		return sucess()
	except ValueError as e:
		return e.message

#
#
#	INSCRITO
#
#

@route('/inscritos')
def inscritos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		inscritos = Inscrito.objects().all()
		print type(inscritos.getJson())
		return inscritos.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarinscrito')
def editarcriarinscrito():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		inscrito = Inscrito(dict)
		inscrito.save()
		return sucess(inscrito)
	except ValueError as e:
		return e.message

@post('/deletarinscrito')
def deletarinscrito():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	codEv = dict.get('codEv')
	numEd = dict.get('numEd')
	idPart = dict.get('idPart')
	try:
		inscrito = Inscrito.objects().get(codEv = codEv, numEd = numEd, idPart = idPart)
	except ValueError as e:
		return e.message
	try:
		inscrito.delete()
		return sucess()
	except ValueError as e:
		return e.message


#
#
#	ORGANIZA
#
#

@route('/organizadores')
def organizas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		organizadores = Organiza.objects().all()
		print type(organizadores.getJson())
		return organizadores.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarorganiza')
def editarcriarorganiza():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		organiza = Organiza(dict)
		organiza.save()
		return sucess(organiza)
	except ValueError as e:
		return e.message

@post('/deletarorganiza')
def deletarorganiza():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	codEv = dict.get('codEv')
	numEd = dict.get('numEd')
	idOrg = dict.get('idOrg')
	try:
		organiza = Organiza.objects().get(codEv = codEv, numEd = numEd, idOrg = idOrg)
	except ValueError as e:
		return e.message
	try:
		organiza.delete()
		return sucess()
	except ValueError as e:
		return e.message


#
#
#	PATROCINADOR
#
#

@route('/patrocinadores')
def patrocinadors():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		patrocinadores = Patrocinador.objects().all()
		return patrocinadores.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarpatrocinador')
def editarcriarpatrocinador():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		patrocinador = Patrocinador(dict)
		patrocinador.save()
		return sucess(patrocinador)
	except ValueError as e:
		return e.message

@post('/deletarpatrocinador')
def deletarpatrocinador():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	cnpjPat = dict.get('cnpjPat')
	try:
		patrocinador = Patrocinador.objects().get(cnpjPat = cnpjPat)
	except ValueError as e:
		return e.message
	try:
		patrocinador.delete()
		return sucess()
	except ValueError as e:
		return e.message


#
#
#	PESSOA
#
#

@route('/patrocinios')
def patrocinios():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		patrocinios = Patrocinio.objects().all()
		return patrocinios.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarpatrocinio')
def editarcriarpatrocinio():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		patrocinio = Patrocinio(dict)
		patrocinio.save()
		return sucess(patrocinio)
	except ValueError as e:
		return e.message

@post('/deletarpatrocinio')
def deletarpatrocinio():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	#'cnpjPat', 'codEv', 'numEd'
	cnpjPat = dict.get('cnpjPat')
	codEv = dict.get('codEv')
	numEd = dict.get('numEd')
	try:
		patrocinio = Patrocinio.objects().get(cnpjPat = cnpjPat, codEv = codEv, numEd = numEd )
	except ValueError as e:
		return e.message
	try:
		patrocinio.delete()
		return sucess()
	except ValueError as e:
		return e.message


#
#
#	PESSOA
#
#

@route('/pessoas')
def pessoas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		pessoas = Pessoa.objects().all()
		return pessoas.getJson()
	except ValueError as e:
		return e.message

@post('/editarcriarpessoa')
def editarcriarpessoa():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	try:
		pessoa = Pessoa(dict)
		pessoa.save()
		return sucess(pessoa)
	except ValueError as e:
		return e.message

@post('/deletarpessoa')
def deletarpessoa():
	response.content_type = 'application/json; charset=charset=UTF8'
	data, = request.body.readlines()
	dict = parse(data)
	idPe = dict.get('idPe')
	try:
		pessoa = Pessoa.objects().get(idPe = idPe)
	except ValueError as e:
		return e.message
	try:
		pessoa.delete()
		return sucess()
	except ValueError as e:
		return e.message


