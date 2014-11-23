from base import BaseModel 
class Evento(BaseModel):
	fields = ( 'codEv', 'nomeEv', 'descricaoEv', 'websiteEv', 'totalArtigosApresentadosEv' )
	pk = ('codEv',)

	def create(self):
		self.codEv = self.getSequenceId()
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
		nextval, =  db.query("SELECT SEQ_codEv.nextval FROM dual",tpl)
		return nextval[0]