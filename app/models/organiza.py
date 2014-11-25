#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
organiza.py
Modela a tabela organiza
"""
from base import BaseModel 
class Organiza(BaseModel):
	fields = ('idOrg', 'codEv', 'numEd', 'cargoOrg')
	pk =('idOrg', 'codEv', 'numEd')