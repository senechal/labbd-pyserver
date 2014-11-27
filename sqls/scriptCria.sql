/**
 * Lucas Macedo de Lemos 6920122
 * André Luiz Lé Sénéchal Paolino 5886766
 * SCC241 - LABORATÓRIO DE BASE DE DADOS
 * TRABALHO PRÁTICO 1
 * Script de criação < scriptCria.sql >
 */
/
--Indicar a língua na qual será executado o script
/
ALTER SESSION SET NLS_LANGUAGE= 'PORTUGUESE' NLS_TERRITORY= 'BRAZIL';
/
--Evitar problemas com a criação incorreta de sequências
/
ALTER SESSION SET deferred_segment_creation = FALSE;
/
--Drop em todas as tabelas, eliminando também suas restrições
/
DROP TABLE evento CASCADE CONSTRAINTS;
DROP TABLE edicao CASCADE CONSTRAINTS;
DROP TABLE pessoa CASCADE CONSTRAINTS;
DROP TABLE inscrito CASCADE CONSTRAINTS;
DROP TABLE artigo CASCADE CONSTRAINTS;
DROP TABLE escreve CASCADE CONSTRAINTS;
DROP TABLE organiza CASCADE CONSTRAINTS;
DROP TABLE patrocinador CASCADE CONSTRAINTS;
DROP TABLE patrocinio CASCADE CONSTRAINTS;
DROP TABLE despesa CASCADE CONSTRAINTS;
DROP TABLE auxilio CASCADE CONSTRAINTS;
/
/
/
/**
 * Tabela evento
 * @codEv                           chave primária
 * @nomeEv                          nome do evento
 * @descricaoEv                     descrição do evento
 * @websiteEv                       site do evento
 * @totalArtigosApresentadosEv      atributo derivado; numero de artigos apresentados em todas as edições de um evento
 * PK_EVENTO                        restrição de chave primária
 * UK_EVENTO                        restrição de chave secundária
 */
/
CREATE TABLE evento (
codEv NUMBER(10) NOT NULL,
nomeEv VARCHAR2(50) NOT NULL,
descricaoEv VARCHAR2(255),
websiteEv VARCHAR2(100),
totalArtigosApresentadosEv NUMBER(4) DEFAULT 0,
CONSTRAINT PK_EVENTO PRIMARY KEY (codEv),
CONSTRAINT UK_EVENTO UNIQUE (nomeEv)
);
/
/**
 * Tabela edicao
 * @codEv, numEd                    chave primária
 * @codEv                           código do evento a qual pertence a edição
 * @numEd                           número da edição
 * @descricaoEd                     descrição do evento
 * @dataInicioEd                    data início da edição
 * @dataFimEd                       data final da edição
 * @localEd                         localização da edição
 * @taxaEd                          taxa de inscrição da edição
 * @saldoFinanceiroEd               atributo derivado; armazena o saldo financeiro da edição
 * @qtdArtigosApresentadosEd        atributo derivado; número de artigos apresentados em uma edição do evento
 * PK_EDICAO                        restrição de chave primária
 * FK_EDICAO                        restrição de chave estrangeiro com a tabela evento
 */
/
CREATE TABLE edicao (
codEv NUMBER(10) NOT NULL,
numEd NUMBER(10) NOT NULL,
descricaoEd VARCHAR2(255),
dataInicioEd DATE,
dataFimEd DATE,
localEd VARCHAR2(255),
taxaEd NUMBER(6,2),
saldoFinanceiroEd NUMBER(7,2) DEFAULT 0,
qtdArtigosApresentadosEd NUMBER(4) DEFAULT 0,
CONSTRAINT PK_EDICAO PRIMARY KEY (codEv, numEd),
CONSTRAINT FK_EDICAO FOREIGN KEY (codEv) REFERENCES evento(codEv) ON DELETE CASCADE
);
/
/**
 * Tabela pessoa
 * @idPe                            chave primária
 * @emailPe                         chave secundária
 * @nomePe                          nome da pessoa
 * @emailPe                         email da pessoa
 * @instituicaoPe                   nome da instituição que a pessoa pertence
 * @telefonePe                      telefone da pessoa
 * @nacionalidadePe                 nacionalidade da pessoa
 * @enderecoPe                      endereço da pessoa
 * @tipoOrganizador                 tipo da pessoa
 * @tipoParticipante                tipo da pessoa
 * @tipoAutor                       tipo da pessoa
 * PK_PESSOA                        restrição de chave primária
 * UK_PESSOA                        restrição de chave secundária
 */
/
CREATE TABLE pessoa (
idPe NUMBER(10) NOT NULL,
nomePe VARCHAR2(50),
emailPe VARCHAR2(255) NOT NULL,
instituicaoPe VARCHAR2(50),
telefonePe VARCHAR2(20),
nacionalidadePe VARCHAR2(50),
enderecoPe VARCHAR2(255),
tipoOrganizador NUMBER(1) DEFAULT 0,
tipoParticipante NUMBER(1) DEFAULT 0,
tipoAutor NUMBER(1) DEFAULT 0,
CONSTRAINT PK_PESSOA PRIMARY KEY (idPe),
CONSTRAINT UK_PESSOA UNIQUE (emailPe)
);
/
/**
 * Tabela inscrito
 * @codEv, numEd, idPart            chave primária
 * @codEv                           código do evento que o usuário está inscrito
 * @numEd                           número da edição que o usuário está inscrito nesse evento
 * @idPart                          identificador do participante
 * @dataInsc                        data que o participante foi inscrito
 * @tipoApresentador                diz se o participante apresentará ou não
 * PK_INSCRITO                      restrição de chave primária
 * FK_INSCRITO_EDICAO               restrição de chave estrangeira para a tabela edicao
 * FK_INSCRITO_PESSOA               restrição de chave estrangeira para a tabela pessoa
 */ 
/
CREATE TABLE inscrito (
codEv NUMBER(10) NOT NULL,
numEd NUMBER(10) NOT NULL,
idPart NUMBER(10) NOT NULL,
dataInsc DATE,
tipoApresentador NUMBER(1) DEFAULT 0,
CONSTRAINT PK_INSCRITO PRIMARY KEY (codEv, numEd, idPart),
CONSTRAINT FK_INSCRITO_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE,
CONSTRAINT FK_INSCRITO_PESSOA FOREIGN KEY (idPart) REFERENCES pessoa(idPe) ON DELETE CASCADE
);
/
/**
 * Tabela artigo
 * @idArt                           chave primária
 * @idArt                           identificador do artigo
 * @dataApresArt                    data de apresentação do artigo
 * @horaApresArt                    horário de apresentação do artigo
 * @codEv                           código do evento que o artigo está relacionado
 * @numEd                           número da edição que o artigo está relacionado no evento
 * @idApr                           identificador do apresentador
 * PK_ARTIGO                        restrição de chave primária
 * FK_ARTIGO                        restrição de chave estrangeira para a tabela edicao
 */
/
CREATE TABLE artigo (
idArt NUMBER(10) NOT NULL,
tituloArt VARCHAR2(255),
dataApresArt DATE,
horaApresArt DATE,
codEv NUMBER(10),
numEd NUMBER(10),
idApr NUMBER(10),
CONSTRAINT PK_ARTIGO PRIMARY KEY (idArt),
CONSTRAINT FK_ARTIGO FOREIGN KEY (codEv, numEd, idApr) REFERENCES inscrito(codEv, numEd, idPart) ON DELETE SET NULL
);
/
/**
 * Tabela escreve
 * @idAut, idArt                    chave primária
 * @idAut                           identificador do autor
 * @idArt                           identificador do artigo
 * PK_ESCREVE                       restrição de chave primária
 * FK_ESCREVE_PESSOA                restrição de chave estrangeira para a tabela pessoa
 * FK_ESCREVE_ARTIGO                restrição de chave estrangeira para a tabela artigo
 */
/
CREATE TABLE escreve (
idAut NUMBER(10) NOT NULL,
idArt NUMBER(10) NOT NULL,
CONSTRAINT PK_ESCREVE PRIMARY KEY (idAut, idArt),
CONSTRAINT FK_ESCREVE_PESSOA FOREIGN KEY (idAut) REFERENCES pessoa(idPe) ON DELETE CASCADE,
CONSTRAINT FK_ESCREVE_ARTIGO FOREIGN KEY (idArt) REFERENCES artigo(idArt) ON DELETE CASCADE
);
/
/**
 * Tabela organiza
 * @idOrg, codEv, numEd             chave primária
 * @idOrg                           identificador da pessoa organizadora
 * @codEv                           código do evento que essa pessoa organiza
 * @numEd                           número da edição do evento que essa pessoa organiza
 * @ cargoOrg		Cargo do Organizador
 * PK_ORGANIZA                      restrição de chave primária
 * FK_ORGANIZA_PESSOA               restrição de chave estrangeira para a tabela pessoa
 * FK_ORGANIZA_EDICAO               restrição de chave estrangeira para a tabela edicao
 */
CREATE TABLE organiza (
idOrg NUMBER(10) NOT NULL,
codEv NUMBER(10) NOT NULL,
numEd NUMBER(10) NOT NULL,
cargoOrg VARCHAR2(50) NOT NULL,
CONSTRAINT PK_ORGANIZA PRIMARY KEY (idOrg, codEv, numEd),
CONSTRAINT FK_ORGANIZA_PESSOA FOREIGN KEY (idOrg) REFERENCES pessoa(idPe) ON DELETE CASCADE,
CONSTRAINT FK_ORGANIZA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
);
/
/**
 * Tabela patrocinador
 * @cnpjPat                         chave primária
 * @cnpjPat                         cnpj do patrocinador
 * @razaoSocialPat                  nome devidamente registrado sob o qual uma pessoa jurídica se individualiza e exerce suas atividades
 * @telefonePat                     telefone do patrocinador
 * @enderecoPat                     endereco do patrocinador
 * PK_PATROCINADOR                  restrição de chave primária
 */
/
CREATE TABLE patrocinador (
cnpjPat VARCHAR2(18) NOT NULL,
razaoSocialPat VARCHAR2(255),
telefonePat VARCHAR2(20),
enderecoPat VARCHAR2(255),
CONSTRAINT PK_PATROCINADOR PRIMARY KEY (cnpjPat)
);
/
/**
 * Tabela patrocinio
 * @cnpjPat, codEv, numEd           chave primária
 * @cnpjPat                         cnpj do patrocinador
 * @codEv                           código do evento que foi realizado o patrocínio
 * @numEd                           número da edição que foi realizado o patrocínio
 * @valorPat                        valor do patrocínio
 * @saldoPat                        atributo derivado; armazena o saldo do patrocínio
 * @dataPat                         data que foi realizado o patrocínio
 * PK_PATROCINIO                    restrição de chave primária
 * FK_PATROCINIO_PATROCINADOR       restrição de chave estrangeira para a tabela patrocinador
 * FK_PATROCINIO_EDICAO             restrição de chave estrangeira para a tabela edição
 */
/
CREATE TABLE patrocinio (
cnpjPat VARCHAR2(18) NOT NULL,
codEv NUMBER(10) NOT NULL,
numEd NUMBER(10) NOT NULL,
valorPat NUMBER(9,2),
saldoPat NUMBER(9,2),
dataPat DATE,
CONSTRAINT PK_PATROCINIO PRIMARY KEY (cnpjPat, codEv, numEd),
CONSTRAINT FK_PATROCINIO_PATROCINADOR FOREIGN KEY (cnpjPat) REFERENCES patrocinador(cnpjPat) ON DELETE CASCADE,
CONSTRAINT FK_PATROCINIO_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
);
/
/**
 * Tabela despesa
 * @codDesp, codEv, numEd           chave primária
 * @codDesp                         código da despesa
 * @codEv                           código do evento da despesa
 * @numEd                           número da edição da despesa
 * @cnpjPat                         cnpj do patrocinador
 * @codEvPat                        código do evento que foi realizado o patrocínio
 * @numEdPat                        número da edição do evento que foi realizado o patrocínio
 * @dataDesp                        data da despesa
 * @valorDesp                       valor da despesa
 * @descricaoDesp                   descrição da despesa
 * PK_DESPESA                       restrição de chave primária
 * FK_DESPESA_PATROCINIO            restrição de chave estrangeira para a tabela patrocínio
 * FK_DESPESA_EDICAO                restrição de chave estrangeira para a tabela edição
 */
/
CREATE TABLE despesa (
codDesp NUMBER(10) NOT NULL,
codEv NUMBER(10) NOT NULL,
numEd NUMBER(10) NOT NULL,
cnpjPat VARCHAR2(18),
codEvPat NUMBER(10),
numEdPat NUMBER(10),
dataDesp DATE,
valorDesp NUMBER(9,2),
descricaoDesp VARCHAR2(255),
CONSTRAINT PK_DESPESA PRIMARY KEY (codDesp, codEv, numEd),
CONSTRAINT FK_DESPESA_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEv, numEd) ON DELETE CASCADE,
CONSTRAINT FK_DESPESA_EDICAO FOREIGN KEY (codEv, numEd) REFERENCES edicao(codEv, numEd) ON DELETE CASCADE
);
/
/**
 * Tabela auxilio
 * @codEvApr, numEdApr, idApr, tipoAux    chave primária
 * @cnpjPat                               cnpj do patrocinador
 * @codEvPat                              código do evento que o patrocinador patrocina
 * @numEdPat                              número da edição que o patrocinador patrocina
 * @codEvApr                              código do evento que o apresentador apresenta
 * @numEdApr                              número da edição que o apresentador apresenta
 * @idApr                                 identificador do apresentador
 * @valorAux                              valor do auxílio
 * @dataAux                               data que foi realizado o auxílio
 * @tipoAux                               tipo do auxílio
 * PK_AUXÍLIO                             restrição de chave primária
 * FK_AUXÍLIO_PATROCINIO                  restrição de chave estrangeira para a tabela patrocínio
 * FK_AUXÍLIO_INSCRITO                    restrição de chave estrangeira para a tabela inscrito
 * CHK_TIPO_AUX                           verifica se o tipo auxílio é do tipo hospedagem, alimentação, ou transporte
 */
/
CREATE TABLE auxilio (
cnpjPat VARCHAR2(18),
codEvPat NUMBER(10),
numEdPat NUMBER(10),
codEvApr NUMBER(10) NOT NULL,
numEdApr NUMBER(10) NOT NULL,
idApr NUMBER(10) NOT NULL,
valorAux NUMBER(9,2),
dataAux DATE,
tipoAux VARCHAR2(30) NOT NULL,
CONSTRAINT PK_AUXÍLIO PRIMARY KEY (codEvApr, numEdApr, idApr, tipoAux),
CONSTRAINT FK_AUXÍLIO_PATROCINIO FOREIGN KEY (cnpjPat, codEvPat, numEdPat) REFERENCES patrocinio(cnpjPat, codEv, numEd) ON DELETE CASCADE,
CONSTRAINT FK_AUXÍLIO_INSCRITO FOREIGN KEY (codEvApr, numEdApr, idApr) REFERENCES inscrito(codEv, numEd, idPart) ON DELETE CASCADE,
CONSTRAINT CHK_TIPO_AUX CHECK (UPPER(tipoAux) IN ('HOSPEDAGEM', 'ALIMENTAÇÃO', 'TRANSPORTE'))
);
/
/
--Drop de todas as sequencias
DROP SEQUENCE SEQ_codEv;
DROP SEQUENCE SEQ_idPe;
DROP SEQUENCE SEQ_idArt;
DROP SEQUENCE SEQ_codDesp;
/
/
-- Cria sequência para codEv da tabela Evento
CREATE SEQUENCE SEQ_codEv
MINVALUE 0
START WITH 1
INCREMENT BY 1;
/
/
-- Cria sequência para idPe da tabela Pessoa
CREATE SEQUENCE SEQ_idPe
MINVALUE 0
START WITH 1
INCREMENT BY 1;
/
/
-- Cria sequência para idArt da tabela Artigo
CREATE SEQUENCE SEQ_idArt
MINVALUE 0
START WITH 1
INCREMENT BY 1;
/
/
-- Cria sequência para codDesp da tabela Despesa
CREATE SEQUENCE SEQ_codDesp
MINVALUE 0
START WITH 1
INCREMENT BY 1;



