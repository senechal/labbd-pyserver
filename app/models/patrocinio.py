#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
patrocini.py
Modela a Tabela Patrocinio
"""
from base import BaseModel 
class Patrocinio(BaseModel):
	fields =  ('cnpjPat', 'codEv', 'numEd', 'valorPat', 'saldoPat', 'dataPat')
	pk = ('cnpjPat', 'codEv', 'numEd',)