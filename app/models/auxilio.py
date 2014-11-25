#!/usr/bin/python
# -*- coding: utf-8 -*-

""" 
auxilio.py
Modela a Tabela Auxilio
"""
from base import BaseModel 
class Auxilio(BaseModel):
	fields = ('cnpjPat', 'codEvPat', 'numEdPat', 'codEvApr', 'numEdApr', 'idApr', 'valorAux', 'dataAux', 'tipoAux')
	pk = ('codEvApr', 'numEdApr', 'idApr', 'tipoAux'),