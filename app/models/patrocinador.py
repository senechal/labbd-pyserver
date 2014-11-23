from base import BaseModel 
class Patrocinador(BaseModel):
	fields =  ('cnpjPat', 'razaoSocialPat', 'telefonePat', 'enderecoPat')
	pk = ('cnpjPat',)