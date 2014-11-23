from base import BaseModel 
class Evento(BaseModel):
	fields = ( 'codEv', 'nomeEv', 'descricaoEv', 'websiteEv', 'totalArtigosApresentadosEv' )
	pk = ('codEv',)