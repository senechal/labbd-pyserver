from base import BaseModel 
class Despesa(BaseModel):
	fields = ('codDesp', 'codEv', 'numEd', 'cnpjPat', 'codEvPat', 'numEdPat', 'dataDesp', 'valorDesp', 'descricaoDesp')
	pk = ('codDesp', 'codEv', 'numEd',)

	def create(self):
		self.codDesp = self.getSequenceId()
		super(Despesa, self).create()

	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_codDesp.nextval FROM dual",tpl)
		return nextval[0]