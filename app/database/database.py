#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

#database.py

import cx_Oracle

class Q:
	def __init__(self,dict):
		self.querydict = dict

	# { 	"tabelas" : ("A","B"), 
	# 	"atributos" : ("a.attr1","b.attr1"),
	#   "on": (
	#		((a.attr2, "=", "b.attr2"),),
	#	)
	# 	"parametro" : (
	# 					("saldo",">",200),
	# 				  ), 
	# }
	def getSQL(self):
		try:
			tabelas = self.querydict['tabelas']
			tabelas_ = tabelas
			# for tabela in tabelas:
			# 	if tabela == tabelas[-1]
			# 		tabelas_ = tabelas_ + tabela + ' JOIN '
			# 	else:
			# 		tabelas_ = tabelas_ + tabela 
			# 	tabelas_ = tabelas + '  ON '	
		except:
			return None
		try:
			atributos = self.querydict['atributos']
			atributos_ = ''
			for atributo in atributos:
				if atributo == atributos[-1]:
					atributo_ = atributo_ + atributo
				else:
					atributo_ = atributo_ + atributo + ', '
		except:
			atributos_ = "*"
		try:
			parametros = self.querydict['parametros']
			parametros_ = ''
			if len(parametros) != 0:
				parametros_ = ' WHERE '
			for parametro in parametros:
				if parametro == parametros[-1]:
					parametros_ = parametros_ + parametro[0]+' '+parametro[1] + ' ' + parametro[3]
				else:
					parametros_ = parametros_ + parametro[0]+' '+parametro[1] + ' ' + parametro[3] + ' AND '
		except:
			parametros_ = ''
		str = "SELECT "+atributos_+ " FROM " +tabelas + parametros_
		return str

class DataBaseManager:

	def __init__(self):
		self.__dsn = cx_Oracle.makedsn("grad.icmc.usp.br","15215","orcl")
		self.__user = 'a5886766'
		self.__password = 'a5886766'
		
	def __error(self,e):
		error, = e.args
		switch = {
			1017 : 'Please check your credentials.',
			1453 :'Can\'t Do a transaction write now.',
			942: 'table or view does not exist!',
			1:'Unique constraint violated',
			904:'Invalid identifier'
		}
		print switch.get(error.code,error.message)
		return {'error':1,'message':switch.get(error.code,error.message)}

	def connect(self):
		try:
			self.__db =  cx_Oracle.connect(user=self.__user, password=self.__password, dsn = self.__dsn)
			self.__cursor = self.__db.cursor()
		except cx_Oracle.DatabaseError as e:
			self.__error(e)

	
	def disconnect(self):
		try:
			self.__db.close()
		except AttributeError:
			print ('Not connected')
	 
	def query(self,sql,args=()):
		try:
			self.__cursor.execute(sql,args)
			return self.__cursor.fetchall()
		except cx_Oracle.DatabaseError as e:
			return self.__error(e)


	def transaction(self,sql,args=()):
		try:
			self.__db.begin()
			self.__cursor.execute(sql,args)
			self.__db.commit()
			return {'error':0,'message':'OK'}
		except cx_Oracle.DatabaseError as e:
			return self.__error(e)

	def var(self,type):
		ora_type = {
			"NUMBER":cx_Oracle.NUMBER,
		}
		try:
			return self.__cursor.var(ora_type.get(type,cx_Oracle.NUMBER))
		except cx_Oracle.DatabaseError as e:
			return self.__error(e)

	def procedure(self,procedure_name,var=()):
		try:
			self.__cursor.callproc(procedure_name,var) 
			return var
		except cx_Oracle.DatabaseError as e:
			return self.__error(e)
		
	def function(self, function_name, return_type, var=[]):
		try:
			return self.__cursor.callfunc(function_name,return_type, var)
		except cx_Oracle.DatabaseError as e:
			return self.__error(e)

	def get_cursor(self):
		return self.__cursor

	def get_database(self):
		return self.__db


				

