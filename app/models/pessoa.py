from base import BaseModel
from .. import db 
class Pessoa(BaseModel):
	fields =('idPe', 'nomePe','emailPe','instituicaoPe', 'telefonePe', 'nacionalidadePe', 'enderecoPe', 'tipoOrganizador','tipoParticipante', 'tipoAutor')
	pk = ('idPe',)
	
	# def create(self):
	# 	print 'AQUI'
	# 	fields = self.__class__.fields 
	# 	last = fields[-1]
	# 	values = ''
	# 	tpl = ()
	# 	i =1
	# 	for item in fields:
	# 		value = self.__dict__[item]
	# 		if item != 'idPe':	
	# 			print value
	# 			tpl = tpl + (value,)
	# 			if item == last:
	# 					values = values +' :'+str(i)
	# 			else:
	# 				values = values +' :'+str(i)+', '
	# 			i = i+1
	# 	sql = 'INSERT INTO ' + self.__class__.__name__.lower() + ' VALUES ( SEQ_idPe.nextval, ' + values + ' )'
	# 	print sql
	# 	db.connect()
	# 	transaction = db.transaction(sql,tpl)
	# 	db.disconnect()
	# 	if transaction.get('error') == 1:
	# 		raise ValueError(transaction) 