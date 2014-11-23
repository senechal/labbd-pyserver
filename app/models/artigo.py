from base import BaseModel 
class Artigo(BaseModel):
	fields =  ('idArt', 'tituloArt', 'dataApresArt', 'horaApresArt', 'codEv', 'numEd', 'idApr')
	pk = ('idArt')