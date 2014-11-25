#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
edicao.py
Modela a Tabela Edição
"""
from base import BaseModel 
class Edicao(BaseModel):
	fields = ( 'codEv', 'numEd', 'descricaoEd', 'dataInicioEd', 'dataFimEd', 'localEd', 'taxaEd', 'saldoFinanceiroEd', 'qtdArtigosApresentadosEd' )
	pk = ('codEv', 'numEd')