#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
inscrito.py
Modela a tabela Inscrito
"""
from base import BaseModel 
class Inscrito(BaseModel):
	fields =  ( 'codEv', 'numEd', 'idPart', 'dataInsc', 'tipoApresentador' )
	pk = ('codEv', 'numEd', 'idPart')