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


def sucess(content = None):
	dict = {'error':0,'message':'OK'}
	if content:
		dict.update({'content':content.getDict() })
	return dumps(dict)

def cleanNumber(number):
	try:
		return int(number)
	except ValueError:
		return number

def clearRequest(req):
	dict = {}
	for index,value in req.dict.iteritems():
			aux,  = value
			dict.update({index: cleanNumber(aux)})
	return dict
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

#Retorna Lista de Todos os Artigos
@route('/artigos')
def artigos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		artigos = Artigo.objects().all()
		return artigos.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarartigo')
def editarcriarartigo():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		artigo = Artigo(dict)
		artigo.save()
		return sucess(artigo)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarartigo')
def deletarartigo():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna Lista de Todos os Auxilios
@route('/auxilios')
def auxilios():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		auxilios = Auxilio.objects().all()
		return auxilios.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarauxilio')
def editarcriarauxilio():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		auxilio = Auxilio(dict)
		auxilio.save()
		return sucess(auxilio)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarauxilio')
def deletarauxilio():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna lista de Todas as Despesas
@route('/despesas')
def despesas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		despesas = Despesa.objects().all()
		return despesas.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriardespesa')
def editarcriardespesa():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		despesa = Despesa(dict)
		despesa.save()
		return sucess(despesa)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletardespesa')
def deletardespesa():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna lista de Rodas as Edições
@route('/edicoes')
def edicoes():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		edicoes = Edicao.objects().all()
		return edicoes.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriaredicao')
def editarcriaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		edicao = Edicao(dict)
		edicao.save()
		return sucess(edicao)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletaredicao')
def deletaredicao():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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


#Recebe idAu e idArt, e cria uma nova conexão entre artigo e autor.
@post('/adicionarautor')
def adicionarautor():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		escreve = Escreve(dict)
		escreve.save()
		return sucess()
	except ValueError as e:
		return e.message


#
#	EVENTO
#
#

#Retorna lista de Todos os Eventos
@route('/eventos')
def eventos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		eventos = Evento.objects().all()
		print type(eventos.getJson())
		return eventos.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarevento')
def editarcriarevento():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		evento = Evento(dict)
		evento.save()
		return sucess(evento)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarevento')
def deletarevento():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna lista de todos os inscritos
@route('/inscritos')
def inscritos():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		inscritos = Inscrito.objects().all()
		print type(inscritos.getJson())
		return inscritos.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarinscrito')
def editarcriarinscrito():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		inscrito = Inscrito(dict)
		inscrito.save()
		return sucess(inscrito)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarinscrito')
def deletarinscrito():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna lista de todos os Organizadores
@route('/organizadores')
def organizas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		organizadores = Organiza.objects().all()
		print type(organizadores.getJson())
		return organizadores.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarorganiza')
def editarcriarorganiza():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		organiza = Organiza(dict)
		organiza.save()
		return sucess(organiza)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarorganiza')
def deletarorganiza():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Retorna lista de Todos os Patrocinadores
@route('/patrocinadores')
def patrocinadors():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		patrocinadores = Patrocinador.objects().all()
		return patrocinadores.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarpatrocinador')
def editarcriarpatrocinador():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		patrocinador = Patrocinador(dict)
		patrocinador.save()
		return sucess(patrocinador)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarpatrocinador')
def deletarpatrocinador():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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
#	PATROCINIO
#
#

#Retorna lista de Todos os Patrocinios
@route('/patrocinios')
def patrocinios():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		patrocinios = Patrocinio.objects().all()
		return patrocinios.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarpatrocinio')
def editarcriarpatrocinio():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		patrocinio = Patrocinio(dict)
		patrocinio.save()
		return sucess(patrocinio)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarpatrocinio')
def deletarpatrocinio():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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

#Recebe lista de Todas as Pessoas
@route('/pessoas')
def pessoas():
	response.content_type = 'application/json; charset=charset=UTF8'
	try:
		pessoas = Pessoa.objects().all()
		return pessoas.getJson()
	except ValueError as e:
		return e.message

#Recebe dict com atributos para um novo atributo, cria o objeto e salva no banco, retorna o o objeto salvo em forma de json
@post('/editarcriarpessoa')
def editarcriarpessoa():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
	try:
		pessoa = Pessoa(dict)
		pessoa.save()
		return sucess(pessoa)
	except ValueError as e:
		return e.message

#Recebe id de objeto a ser deletado do banco, busca objeto no banco, e o deleta.
@post('/deletarpessoa')
def deletarpessoa():
	response.content_type = 'application/json; charset=charset=UTF8'
	dict  = clearRequest(request.forms)
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


