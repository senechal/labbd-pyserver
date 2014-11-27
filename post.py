import httplib 
import urllib 
import urllib2 
import json

params = urllib.urlencode({
    "cnpjPat" : "59.128.020/0001-95",
    "codEv" : 1,
    "codEvPat" : 1,
    "dataDesp" : "27/11/2014 19:25:52",
    "descricaoDesp" : "macbook pro retina",
    "numEd" : 2011,
    "numEdPat" : 2011,
    "valorDesp" : 10000
})
headers = {"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}
conn = httplib.HTTPConnection("127.0.0.1",8080)
conn.request("GET", "/escreve", None, headers)
response = conn.getresponse()
print response.status, response.reason
data = response.read()
print data
conn.close()















































