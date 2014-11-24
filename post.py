import httplib 
import urllib 
import urllib2 
import json

params = urllib.urlencode({    
      "codEv":4,
      "descricaoEv":"VLDB e um importante forum anual e internacional de gerencimede dados e pesquisadores, fornecedores, profissionais, desenvolveores de aplicativos e usuarios",
      "nomeEv":"Very Large Data Bases",
      "totalArtigosApresentadosEv":45,
      "websiteEv":"http://www.vldb.org/"
})
headers = {"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}
conn = httplib.HTTPConnection("127.0.0.1",8080)
conn.request("POST", "/editarcriarevento ", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
print data
conn.close()















































