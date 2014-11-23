from base import BaseModel 
class Edicao(BaseModel):
	fields = ( 'codEv', 'numEd', 'descricaoEd', 'dataInicioEd', 'dataFimEd', 'localEd', 'taxaEd', 'saldoFinanceiroEd', 'qtdArtigosApresentadosEd' )
	pk = ('codEv', 'numEv')