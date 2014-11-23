from app.models.pessoa import Pessoa 
from app.models.artigo import Artigo


a = Pessoa.objects().get(idPe = 1)
# a.emailPe = 'pumba@icmc.usp.br'
print a.toJson()
a.delete()

