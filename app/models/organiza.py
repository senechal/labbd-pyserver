from base import BaseModel 
class Organiza(BaseModel):
	fields = ('idOrg', 'codEv', 'numEd', 'cargoOrg')
	pk =('idOrg', 'codEv', 'numEd')