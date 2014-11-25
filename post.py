import httplib 
import urllib 
import urllib2 
import json

params = urllib.urlencode({
   "codEv":4,
   "dataFimEd":"03/08/2011 00:00:00",
   "dataInicioEd":"29/07/2011 00:00:00",
   "descricaoEd":"Edic?o 2011 em The Westin",
   "localEd":"Seattle",
   "numEd":2011,
   "qtdArtigosApresentadosEd":15,
   "saldoFinanceiroEd":14200,
   "taxaEd":200
})
headers = {"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}
conn = httplib.HTTPConnection("127.0.0.1",8080)
conn.request("POST", "/editarcriaredicao", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
print data
conn.close()















































