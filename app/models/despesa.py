#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
despesas.py
Modela a Tabela despesa
"""
from base import BaseModel
from .. import db 
class Despesa(BaseModel):
	fields = ('codDesp', 'codEv', 'numEd', 'cnpjPat', 'codEvPat', 'numEdPat', 'dataDesp', 'valorDesp', 'descricaoDesp')
	pk = ('codDesp', 'codEv', 'numEd',)
	#Metodo sobreescreve o create do BaseModel, para que a utilização das Sequencias.
	def create(self):
		self.codDesp = self.getSequenceId()
		super(Despesa, self).create()
	#Busca o proximo numero da sequencia da Despesa
	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_codDesp.nextval FROM dual",tpl)
		return nextval[0]