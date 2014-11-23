from base import BaseModel 
class Auxilio(BaseModel):
	fields = ('cnpjPat', 'codEvPat', 'numEdPat', 'codEvApr', 'numEdApr', 'idApr', 'valorAux', 'dataAux', 'tipoAux')
	pk = ('codEvApr', 'numEdApr', 'idApr', 'tipoAux'),