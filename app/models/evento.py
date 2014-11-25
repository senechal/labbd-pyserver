#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
evento.py
Modela a Tabela evento
"""
from base import BaseModel
from .. import db 
class Evento(BaseModel):
	fields = ( 'codEv', 'nomeEv', 'descricaoEv', 'websiteEv', 'totalArtigosApresentadosEv' )
	pk = ('codEv',)
	#Metodo sobreescreve o create do BaseModel, para que a utilização das Sequencias.
	def create(self):
		self.codEv = self.getSequenceId()
		super(Evento, self).create()
	#Busca o proximo numero da sequencia do Evento
	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_codEv.nextval FROM dual",tpl)
		return nextval[0]