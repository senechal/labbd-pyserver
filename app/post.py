import httplib, urllib
import sys

for arg in sys.argv: 
    print arg



# params = urllib.urlencode({'@number': 12524, '@type': 'issue', '@action': 'show'})
# headers = {"Content-type": "application/x-www-form-urlencoded","Accept": "text/plain"}
# conn = httplib.HTTPConnection("bugs.python.org")
# conn.request("POST", "", params, headers)
# response = conn.getresponse()
# print response.status, response.reason
# data = response.read()
# data
# conn.close()