from base import BaseModel
from .. import db 
class Pessoa(BaseModel):
	fields =('idPe', 'nomePe','emailPe','instituicaoPe', 'telefonePe', 'nacionalidadePe', 'enderecoPe', 'tipoOrganizador','tipoParticipante', 'tipoAutor')
	pk = ('idPe',)
	
	def create(self):
		self.idPe = self.getSequenceId()
		super(Pessoa, self).create()

	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_idPe.nextval FROM dual",tpl)
		return nextval[0]