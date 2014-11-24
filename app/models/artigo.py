from base import BaseModel
from .. import db 
class Artigo(BaseModel):
	fields =  ('idArt', 'tituloArt', 'dataApresArt', 'horaApresArt', 'codEv', 'numEd', 'idApr')
	pk = ('idArt')

	def create(self):
		self.idArt = self.getSequenceId()
		super(Artigo, self).create()

	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_idArt.nextval FROM dual",tpl)
		return nextval[0]