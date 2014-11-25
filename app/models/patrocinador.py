#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
patrocinador.py
Modela a Tabela Patrocinador
"""
from base import BaseModel 
class Patrocinador(BaseModel):
	fields =  ('cnpjPat', 'razaoSocialPat', 'telefonePat', 'enderecoPat')
	pk = ('cnpjPat',)