import httplib 
import urllib 
import urllib2 
import json

params = json.dumps({
		"tipoAutor": 1, 
		"instituicaoPe": "Hong Kong Baptist University", 
		"enderecoPe": "Kowloon Tong, Hong Kong",  
		"nomePe": "teste test test", 
		"emailPe": "test@aaaaaa.com.br", 
		"tipoParticipante": 1, 
		"telefonePe": "415-327-0583", 
		"nacionalidadePe": "Chinesa", 
		"tipoOrganizador": 0
		})
headers = {"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}
conn = httplib.HTTPConnection("127.0.0.1",8080)
conn.request("POST", "/editarcriarpessoa", params, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
print data
conn.close()