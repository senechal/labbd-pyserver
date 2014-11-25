#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
escreve.py
Modela a tabela escreve
"""
from base import BaseModel 
class Escreve(BaseModel):
	fields =  ('idAut', 'idArt',)
	pk =  ('idAut', 'idArt',)