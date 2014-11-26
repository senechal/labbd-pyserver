def indexDictTpl(dict, tpl):
	tpl2 = ()
	for index, value in dict.iteritems():
		tpl2 = tpl2 + (index,)
	
	return True

da = {'A':1}
db = {'A':1,'B':2}
dc = {'A':1,'B':2, 'C':3}
tpl = ('A','B')
r1 = indexDictTpl(da, tpl)
r2 = indexDictTpl(db, tpl)
r3 = indexDictTpl(dc, tpl)

print r1
print r2
print r3