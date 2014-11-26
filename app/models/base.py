#!/usr/bin/python
# -*- coding: utf-8 -*-

""" 
base.py
Script contem Os objetos Bases utilizados para busca (BaseManager) e para os modelos (BaseModel)
"""


from .. import db
from ..database.database import Q
from ..bin.util import dumps
import json
#TODO EXCEPTIONS: get filter and all

#Controla lista retornada pelo banco
class ModelList:
	def __init__(self, list):
		self.list = list
	def __iter__(self):
		return iter(self.list)
	#Retona lista em formato de dicionario
	def getDict(self):
		list = ()
		for i,item in enumerate(self.list):
			list = list + (item.getDict(),)
		return list
	#retorna lista como json, pronto pra se enviado para o cliente
	def getJson(self):
		tpl = ()
		for item in self.list:
			tpl = tpl + (item.getDict(),)
		dict = {'error':0,'message':'OK','content':tpl}
		return dumps(dict)

#Responsavel por buscas no banco
class BaseManager:
	def __init__(self, cls):
		self.db = db
		self.cls = cls
	#retona a clase do Objeto para qual o manager fui instanciado
	def getclass(self):
		print self.cls.__name__
	#faz busca no banco baseados em seus aributos , **kwargs contem um dicionario dos atributos a serem utilizados na busca, somente um objeto é esperado como retorno
	def get(self, **kwargs):
		#Criando a string SQL
		where = ''
		i = 1
		tpl = ()
		last = kwargs.keys()[-1]
		for item,value in kwargs.iteritems():
			if item == last:
				where = where + item +' = :'+str(i)
			else:
				where = where + item +' = :'+str(i) + ' and '
			i = i+1;
			tpl = tpl+(value,)
		sql = "SELECT * FROM "+self.cls.__name__.lower()+" WHERE " + where
		#Com a String criada conectamos no banco e fazemos a consulta
		self.db.connect()
		query = self.db.query(sql,tpl)
		self.db.disconnect()
		dict = {}
		#Verificamos se algum erro ocorreu, se sim repassamos o erro 
		if type(query) is type(dict):
			raise ValueError(query) 
		elif len(query) == 0: #Verificamos se a busca veio vazia, se sim retornamos vazio
			return None
		elif len(query) > 1: #verificamos de a busca veio com mais do que um elemento, se sim é levantado um erro
			raise ValueError({'error':1,'message':'Too Many Rows'}) 
		else:
			query, = query #Como tudo ocorreu como esperado, criamos o objeto do elemento buscado e retornamos o objeto 
			for fiels,value in zip(self.cls.fields,query):
				dict.update({fiels:value})
		obj = self.cls(dict)
		return obj
	#Bussca como um filtro, esperado uma ModelList como retorno 
	def filter(self, **kwargs):
		#Criando a string SQL
		where = ''
		i = 1
		tpl = ()
		if kwargs:
			last = kwargs.keys()[-1]
			for item,value in kwargs.iteritems():
				if item == last:
					where = where + item +' = :'+str(i)
				else:
					where = where + item +' = :'+str(i) + ' and '
				i = i+1;
				tpl = tpl+(value,)
			sql = "SELECT * FROM "+self.cls.__name__.lower()+" WHERE " + where
		else:
			sql = "SELECT * FROM "+self.cls.__name__.lower()
		#Conectando ao banco e fazendo a consulta
		self.db.connect()
		query = self.db.query(sql,tpl)
		self.db.disconnect()
		dict = {}
		#Verificando se algum erro ocorreu, se sim repassamos o erro 
		if type(query) is type(dict):
			raise ValueError(query) 
		elif len(query) == 0:
			return None
		else:
			#COmo tudo ocorreu como esperado, criamos uma lista de objetos, retornamos a modelList com os objetos
			list = []
			for tupla in query:
				
				for fiels,value in zip(self.cls.fields,tupla):
					dict.update({fiels:value})
				obj = self.cls(dict)
				list.append(obj)
			return ModelList(list)
	#Retorna todos os elementos do modelo
	def all(self):
		return self.filter()
	#Metodo retorna uma model lista de um consulta generica,É necessario utilizar o 
	#Modelo Generico caso os atributos retornados não equivalem com os atributos dos modelos
	def genericQuery(self,sql,tpl = ()):
		if isinstance(sql, Q):
			sql = sql.getSQL()
		self.db.connect()
		query = self.db.query(sql,tpl)
		self.db.disconnect()
		dict = {}
		if type(query) is type(dict):
			raise ValueError(query) 
		elif len(query) == 0:
			return None
		else:
			list = []
			for tupla in query:
				try:
					for fiels,value in zip(self.cls.fields,tupla):
						dict.update({fiels:value})
					obj = self.cls(dict)
					list.append(obj)
				except TypeError as e:
					print "Você deve setar os campos"
			return ModelList(list)
		
#Base dos modelos, contem todos os metodos restantes do CRUD, Create, Update e Delete
class BaseModel(object):
	@classmethod
	#Metodo que Cria uma instancia do base manager para realização de buscas
	def objects(cls):
		return BaseManager(cls)
	def __init__(self, *initial_data, **kwargs):
		for dictionary in initial_data:
			for key in dictionary:
				setattr(self, key, dictionary[key])
		for key in kwargs:
			setattr(self, key, kwargs[key])
	#Retorna atributos do Objeto em forma de Json
	def toJson(self):
		return str(dumps(self.__dict__))
		# return json.dumps(self.__dict__)
	#Retorna atributos do Objeto em forma de Dicionario
	def getDict(self):
		return self.__dict__
	#INCERE o objeto do modelo no banco de dados
	def create(self):
		#Criando a String SQL para incerção
		fields = self.__class__.fields 
		last = fields[-1]
		values = ''
		tpl = ()
		i =1
		for item in fields:
			value = self.__dict__[item]
			tpl = tpl + (value,)
			if item == last:
					values = values +' :'+str(i)
			else:
				values = values +' :'+str(i)+', '
			i = i+1
		sql = 'INSERT INTO ' + self.__class__.__name__.lower() + ' VALUES ( ' + values + ' )'
		#Conecta no banco,  faz a transação
		db.connect()
		transaction = db.transaction(sql,tpl)
		db.disconnect()
		#Caso algum erro acontece, repassamos
		if transaction.get('error') == 1:
			raise ValueError(transaction) 
		
	#Metodo para salvar o objeto, verifica se o objeto ja existe no banco, se sim faz o update se não faz o Create
	def save(self):
		dict = {}
		for item in self.__class__.pk:
			if self.__dict__.get(item):
				dict.update({item:self.__dict__.get(item)})
		if dict and len(dict) == len(self.__class__.pk):
			obj = self.objects().get(**dict)
		else:
			obj = None
		if not obj:
			print "Creating new object..."
			self.create()
			print "Done!"
		else:	
			print "Updating Object..."
			self.update()
			print "Done!"
	#Realiza o Update do Modelo no banco
	def update(self):
		#Cria a sring sql para o Update
		fields = self.__class__.fields
		pk = self.__class__.pk
		last = fields[-1]
		values = ''
		where = ''
		tpl = ()
		i = 1
		for item in fields:
			if item == last:
				values = values + item + ' = :'+str(i)
			else:
				values = values + item + ' = :'+str(i)+', '
			tpl = tpl + (self.__dict__[item],)
			i= i+1
		last = pk[-1]
		for item in pk:
			if item == last:
				where = where + item + ' = :' +str(i) 
			else:
				where = where + item + ' = :' + str(i) + ' and ' 
			i = i+1
			tpl = tpl + (self.__dict__[item],)
		sql = 'UPDATE ' + self.__class__.__name__.lower() + ' SET '+ values + ' WHERE '+where
		#Conecta no banco e faz a transação
		db.connect()
		transaction = db.transaction(sql,tpl)
		db.disconnect()
		#Caso algum erro acontece, repassamos
		if transaction.get('error') == 1:
			raise ValueError(transaction) 
	#Deleta o objeto do modelo do banco de dados	
	def delete(self):
		dict = {}
		for item in self.__class__.pk:
			dict.update({item:self.__dict__[item]})
		if self.objects().get(**dict):
			print "Erasing from database..."
			pk = self.__class__.pk
			where = ''
			tpl = ()
			i = 1
			last = pk[-1]
			for item in pk:
				if item == last:
					where = where + item + ' = :' +str(i) 
				else:
					where = where + item + ' = :' + str(i) + ' and ' 
				i = i+1
				tpl = tpl + (self.__dict__[item],)
			sql = 'DELETE FROM '+ self.__class__.__name__.lower() + ' WHERE ' + where
			db.connect()
			transaction = db.transaction(sql,tpl)
			db.disconnect()
			if transaction.get('error') == 1:
				raise ValueError(transaction) 
			print 'Done!'
		else:
			print u"Object does not exist"
			raise ValueError({'error':1,'message':u"Object does not exist"}) 
#Modelo Generico para fazer consultas Genericas
class GenericModel(BaseModel):
	fields = None
	@classmethod
	def setFields(cls,tpl):
		if not GenericModel.fields:
			GenericModel.fields = tpl
		else:
			raise ValueError('Fields já estão setados, libere antes de usar')
	@classmethod
	def emptyFilds(cls):
		GenericModel.fields = None
