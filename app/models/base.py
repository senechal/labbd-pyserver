# -*- coding: utf-8 -*-
from .. import db
from ..database.database import Q
from ..bin.util import dumps
import json
#TODO EXCEPTIONS: get filter and all
class ModelList:
	def __init__(self, list):
		self.list = list
	def __iter__(self):
		return iter(self.list)
	def dict(self):
		dict = {}
		for i,item in enumerate(self.list):
			dict.update({i:item.getDict()})
		return dict
	def getJson(self):
		tpl = ()
		for item in self.list:
			tpl = tpl + (item.getDict(),)
		dict = {'error':0,'message':'OK','content':tpl}
		return dumps(dict)


class BaseManager:
	def __init__(self, cls):
		self.db = db
		self.cls = cls
		
	def getclass(self):
		print self.cls.__name__
	def get(self, **kwargs):
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
		self.db.connect()
		query = self.db.query(sql,tpl)
		self.db.disconnect()
		dict = {}
		if type(query) is type(dict):
			raise ValueError(query) 
		elif len(query) == 0:
			return None
		elif len(query) > 1:
			raise ValueError({'error':1,'message':'Too Many Rows'}) 
		else:
			query = query[0]
			dict.update({'error':0,'message':'OK'})
			for fiels,value in zip(self.cls.fields,query):
				dict.update({fiels:value})
		obj = self.cls(dict)
		return obj
		
	def filter(self, **kwargs):
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
				
				for fiels,value in zip(self.cls.fields,tupla):
					dict.update({fiels:value})
				obj = self.cls(dict)
				list.append(obj)
			return ModelList(list)
	def all(self):
		return self.filter()

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
		

class BaseModel:
	@classmethod
	def objects(cls):
		return BaseManager(cls)
	def __init__(self, *initial_data, **kwargs):
		for dictionary in initial_data:
			for key in dictionary:
				setattr(self, key, dictionary[key])
			for key in kwargs:
				setattr(self, key, kwargs[key])
	def toJson(self):
		print type(dumps(self.__dict__))
		return str(dumps(self.__dict__))
		# return json.dumps(self.__dict__)
	def getDict(self):
		return self.__dict__
	def create(self):
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
		db.connect()
		transaction = db.transaction(sql,tpl)
		db.disconnect()
		if transaction.get('error') == 1:
			raise ValueError(transaction) 
		
	
	def save(self):
		dict = {}
		for item in self.__class__.pk:
			dict.update({item:self.__dict__[item]})
		if not self.objects().get(**dict):
			print "Creating new object..."
			self.create()
			print "Done!"
		else:	
			print "Updating Object..."
			self.update()
			print "Done!"
	def update(self):
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
				where = where + item + ' = ' + str(i) + ' and ' 
			i = i+1
			tpl = tpl + (self.__dict__[item],)
		sql = 'UPDATE ' + self.__class__.__name__.lower() + ' SET '+ values + ' WHERE '+where
		db.connect()
		transaction = db.transaction(sql,tpl)
		db.disconnect()
		if transaction.get('error') == 1:
			raise ValueError(transaction) 
		
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
					where = where + item + ' = ' + str(i) + ' and ' 
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

class GenericModel(BaseModel):
	fields = None
	@classmethod
	def setFields(cls,tpl):
		GenericModel.fields = tpl
