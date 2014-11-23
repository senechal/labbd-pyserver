from base import BaseModel 
class Escreve(BaseModel):
	fields =  ('idAut', 'idArt',)
	pk =  ('idAut', 'idArt',)