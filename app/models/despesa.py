from base import BaseModel 
class Despesa(BaseModel):
	fields = ('codDesp', 'codEv', 'numEd', 'cnpjPat', 'codEvPat', 'numEdPat', 'dataDesp', 'valorDesp', 'descricaoDesp')
	pk = ('codDesp', 'codEv', 'numEd',)