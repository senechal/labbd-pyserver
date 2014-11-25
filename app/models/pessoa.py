#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
pessoa.py
modela a Tabela pessoa
"""
from base import BaseModel
from .. import db 
class Pessoa(BaseModel):
	fields =('idPe', 'nomePe','emailPe','instituicaoPe', 'telefonePe', 'nacionalidadePe', 'enderecoPe', 'tipoOrganizador','tipoParticipante', 'tipoAutor')
	pk = ('idPe',)
	#Metodo sobreescreve o create do BaseModel, para que a utilização das Sequencias.
	def create(self):
		self.idPe = self.getSequenceId()
		super(Pessoa, self).create()
	#Busca o proximo numero da sequencia da Pessoa
	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_idPe.nextval FROM dual",tpl)
		return nextval[0]