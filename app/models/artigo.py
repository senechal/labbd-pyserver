#!/usr/bin/python
# -*- coding: utf-8 -*-
""" 
artigo.py
Modela a Tabela Artigo
"""
from base import BaseModel
from .. import db 
class Artigo(BaseModel):
	fields =  ('idArt', 'tituloArt', 'dataApresArt', 'horaApresArt', 'codEv', 'numEd', 'idApr')
	pk = ('idArt')
	#Metodo sobreescreve o create do BaseModel, para que a utilização das Sequencias.
	def create(self):
		self.idArt = self.getSequenceId()
		super(Artigo, self).create()
	#Busca o proximo numero da sequencia do Artigo
	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_idArt.nextval FROM dual",tpl)
		return nextval[0]