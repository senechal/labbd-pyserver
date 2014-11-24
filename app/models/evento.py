from base import BaseModel
from .. import db 
class Evento(BaseModel):
	fields = ( 'codEv', 'nomeEv', 'descricaoEv', 'websiteEv', 'totalArtigosApresentadosEv' )
	pk = ('codEv',)

	def create(self):
		self.codEv = self.getSequenceId()
		super(Evento, self).create()

	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_codEv.nextval FROM dual",tpl)
		return nextval[0]