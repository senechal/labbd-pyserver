from base import BaseModel
from .. import db 
class Pessoa(BaseModel):
	fields =('idPe', 'nomePe','emailPe','instituicaoPe', 'telefonePe', 'nacionalidadePe', 'enderecoPe', 'tipoOrganizador','tipoParticipante', 'tipoAutor')
	pk = ('idPe',)
	
	def create(self):
		self.idPe = self.getSequenceId()
		fields = self.__class__.fields 
		last = fields[-1]
		values = ''
		tpl = ()
		i =1
		for item in fields:
			value = self.__dict__[item]
			tpl = tpl + (value,)
			if item == last:
					values = values +' :'+str(i)
			else:
				values = values +' :'+str(i)+', '
			i = i+1
		sql = 'INSERT INTO ' + self.__class__.__name__.lower() + ' VALUES ( ' + values + ' )'
		print sql
		db.connect()
		transaction = db.transaction(sql,tpl)
		db.disconnect()
		if transaction.get('error') == 1:
			raise ValueError(transaction) 

	def getSequenceId(self):
		db.connect()
		tpl = ()
		nextval, =  db.query("SELECT SEQ_idPe.nextval FROM dual",tpl)
		return nextval[0]