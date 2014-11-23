from base import BaseModel 
class Inscrito(BaseModel):
	fields =  ( 'codEv', 'numEd', 'idPart', 'dataInsc', 'tipoApresentador' )
	pk = ('codEv', 'numEd', 'idPart')