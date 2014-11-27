/**
 * Lucas Macedo de Lemos 6920122
 * André Luiz Lé Sénéchal Paolino 5886766
 * SCC241 - LABORATÓRIO DE BASE DE DADOS
 * TRABALHO PRÁTICO 1
 * Script de inserção < scriptInsere.sql >
 */
 --Numero de Tuplas A serem Inseridas: 450
 --Ignora caracter de substição &
SET SCAN OFF
/
/
/
--Inserção de Evento
--evento ( codEv, nomeEv, descricaoEv, websiteEv, totalArtigosApresentadosEv )
INSERT INTO evento VALUES(SEQ_codEv.nextval, 'Very Large Data Bases', 'VLDB é um importante forum anual e internacional de gerencimento de dados e pesquisadores, fornecedores, profissionais, desenvolveores de aplicativos e usuários', 'http://www.vldb.org/', 45);
/
/
--Inserções de Edição
--edicao ( codEv, numEd, descricaoEd, dataInicioEd, dataFimEd, localEd, taxaEd, saldoFinanceiroEd, qtdArtigosApresentadosEd )
INSERT INTO edicao VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 'Edição 2011 em The Westin,Seattle', TO_DATE('29/08/2011','dd/mm/yyyy'), TO_DATE('03/09/2011','dd/mm/yyyy'),'Seattle', 200.00, 14200.00, 15);
INSERT INTO edicao VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'Edição 2013 em Riva del Garda, Trento', TO_DATE('26/08/2013','dd/mm/yyyy'), TO_DATE('30/08/2013','dd/mm/yyyy'),'Trento', 200.00, 14500.00, 15);
INSERT INTO edicao VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'Edição 2014 em Hangzhou, China', TO_DATE('01/09/2014','dd/mm/yyyy'), TO_DATE('05/09/2014','dd/mm/yyyy'),'Hangzhou', 200.00, 16500.00, 15);
/
/
--Inserções de Pessoas
--pessoa( idPe, nomePe, emailPe, instituicaoPe, telefonePe, nacionalidadePe, enderecoPe, tipoOrganizador, tipoParticipante, tipoAutor )
INSERT INTO pessoa VALUES (SEQ_idPe.nextval, 'Paul Larson', 'palarson@microsoft.com', 'Microsoft', '(425)703-6260', 'Americana',' One Microsoft Way Redmond, WA 98052-6399' ,1, 0, 0 );
INSERT INTO pessoa VALUES (SEQ_idPe.nextval, 'Joseph M. Hellerstein', 'hellerstein@cs.berkeley.edu', 'University of California - Berkeley','(425) 604-1833' , 'Americana',' UC Berkley' ,1,0,0 );
INSERT INTO pessoa VALUES (SEQ_idPe.nextval, 'Christian Konig', 'chrisko@microsoft.com', 'Microsoft',  '(425) 703-5064','Americana' ,' One Microsoft Way Redmond, WA 98052-6399' ,1, 0, 0 ) ;
INSERT INTO pessoa VALUES (SEQ_idPe.nextval, 'Magdalena Balazinska', 'magda@cs.com', 'University of Washington', ' (206) 616-1069', 'Americana',' University of Washington Computer Science & Engineering Box 352350 Seattle, WA 98195-2350', 1,0,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Themis Palpanas', 'palpanas@trento.it', 'University of Trento', '0357 6108432' ,'Italiana','Via del Mascherone, 102, 72013-Ceglie Messapica BR',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Yannis Velegrakis', 'velegrakis@trento.it', 'University of Trento', '0310 6889786' ,'Italiana','Via Nuova Agnano, 50, 71033-Casalnuovo Monterotaro FG',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Stefano Ceri', 'stefanoceri@poli.milano.it', 'Politecnico di Milano', '0334 5509466' ,'Italiana','Via Capo le Case, 137, 39048-Wolkenstein in Groden BZ',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'John Mylopoulos', 'myloupolos@trento.it', 'University of Trento', '0323 6737552' ,'Italiana','Via Tasso, 96, 06020-Padule PG',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Chun Chen', 'chunchen@zhejiang.ch', 'Zhejiang University', '035 -756 -8122' ,'Chinesa','zhejiang, China',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sharad Mehrotra', 'mehrotra@unical.com', 'University of California', '(406)722-9887' ,'Americana','4496 Tibbs Avenue , Alberton, MT 59820',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'H.V. Jagadish', 'jagadish@michiganstate.us', 'University of Michigan', '(254)398-6919' ,'Americana','1082 Sussex Court, Waco, TX 76710',1,0,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Graham Cormode', 'cormode@atet.com', 'AT&T', '(949)480-6196' ,'Americana','2422 Peck Court, Los Angeles, CA 90017',1,0,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Carmen P. Varela', 'carmenpvarela@jourrapide.com', 'Jourrapide','(530) 480-1055','Americana','2620 Hill Croft Farm Road, Chico, CA 95926',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Connie R. Haddix','connierhaddix@teleworm.us', 'Teleworm','(269)320-6732'  ,'Americana','1208 Shingleton Road, Grand Rapids, MI 49503',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Tom C. Cossette', 'tomccossette@jourrapide.com', 'Jourrapide','(631)433-0746'  ,'Americana','1523 Wayback Lane, Garden City, NY 11530',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Lynnette W. Freeman','lynnettewfreeman@armyspy.com',' Army Spy', '(901)674-8599'  ,'Americana','518 Burton Avenue, Memphis, TN 38141',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Nichole F. Erickson', 'nicholeferickson@rhyta.com', 'Rhyta', '(423)716-2898 ','Americana','3351 Raver Croft Drive, Chattanooga, TN 37403',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Georgia D. Williams','georgiadwilliams@dayrep.com', 'Dayrep', '(814)207-5133' ,'Americana','2878 Collins Street, Allegheny, PA 16635',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Mathew L. Garnes' ,'mathewlgarnes@dayrep.com',' Dayrep', '(309)353-2116', 'Americana', '559 Coburn Hollow Road, Pekin, IL 61554',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sandra G. Bearden','sandragbearden@jourrapide.com', 'Jourrapide' , '(315)315-268-1455' ,'Americana','2286 Gandy Street, Potsdam, NY 13676',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Chauncey B. Shropshire', 'chaunceybshropshire@jourrapide.com', 'Jourrapide', '(925)899-4656' ,'Americana','1819 Brown Street, Concord, CA 94520',0,1,0);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Estelle A. Schleicher', 'estelleaschleicher@teleworm.us', 'Teleworm', '(423)587-4243' ,'Americana','3809 Raver Croft Drive, Morristown, TN 37814',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Charles D. Spurgeon', 'charlesdspurgeon@armyspy.com', ' Army Spy', '(325)623-9707' ,'Americana','1227 Seth Street,Locker, TX 76801',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Boyce D. Hornback', 'boycedhornback@rhyta.com','Rhyta' , '(973)274-7300' ,'Americana','2457 Drummond Street, Newark, NJ 07105',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Joe M. Avila', 'joemavila@rhyta.com', 'Rhyta', '(304)430-7314' ,'Americana','2170 Fulton Street, Charleston, WV 25301',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Paul T. Picou', 'paultpicou@jourrapide.com', 'Jourrapide', '(517)342-5856' ,'Americana','1406 Amethyst Drive, Lansing, MI 48933',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'David L. Ryles', 'davidlryles@armyspy.com', ' Army Spy', '(770)698-6628' ,'Americana','4945 Pine Garden Lane, Dunwoody, GA 30338',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Geoffrey J. Haynes', 'geoffreyjhaynes@dayrep.com', 'Dayrep', '(530)231-2229' ,'Americana','1174 Francis Mine, Sacramento, CA 95814',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Frances G. Soto', 'francesgsoto@dayrep.com', 'Dayrep', '(513)707-6174' ,'Americana','1059 Barnes Avenue, Blue Ash, OH 45242',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'James R. Nilsen', 'jamesrnilsen@teleworm.us', 'Teleworm', '(580)316-3981' ,'Americana','2285 Grove Avenue, Oklahoma City, OK 73102',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Lillian V. Hobbs', 'lillianvhobbs@jourrapide.com', 'Jourrapide', '(214)391-1576' ,'Americana','3215 Ersel Street, Dallas, TX 75217',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Steve N. Mitchell', 'stevenmitchell@rhyta.com', 'Rhyta', '(956)358-5002' ,'Americana','2852 Jerome Avenue, Harlingen, TX 78550',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Brain M. Ely', 'brainmely@rhyta.com', 'Rhyta', '(608)689-7708' ,'Americana','3647 Primrose Lane, Genoa, WI 54632',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Alexandra J. Kinard', 'alexandralkinard@dayrep.com', 'Dayrep', '(309)358-9658' ,'Americana','1575 Coburn Hollow Road, Yates City, IL 61572',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Dorothy J. Noyes', 'dorothyjnoyes@jourrapide.com', 'Jourrapide', '(202)284-1755' ,'Americana','3322 Passaic Street, Washington, DC 20020',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Pamela J. Gilreath', 'pamelajgilreath@rhyta.com', 'Rhyta', '(614)305-4070' ,'Americana','2675 Bates Brothers Road, Columbus, OH 43215',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Julio C. Lowrance', 'julioclowrance@rhyta.com', 'Rhyta', '(216)308-6150' ,'Americana','4101 Glenwood Avenue, Garfield Heights, OH 44125',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Betty R. Bedard', 'bettyrbedard@jourrapide.com', 'Jourrapide', '(320)345-2906' ,'Americana','1380 Newton Street, Saint Cloud, MN 56303',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Henrietta B. Forsyth', 'henriettabforsyth@teleworm.us', 'Teleworm', '(708)231-3598' ,'Americana','4673 Rose Street, Arlington Heights, IL 60005',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'David H. Client', 'davidhclient@rhyta.com', 'Rhyta', '(956)869-3248' ,'Americana','1609 Carolina Avenue, Cleburne, TX 76031',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Leona P. Harris', 'leonapharris@teleworm.us', 'Teleworm', '(865)428-1547' ,'Americana','2348 Wiseman Street, Sevierville, TN 37862',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Hector W. Johnson', 'hectorwjohnson@jourrapide.com', 'Jourrapide', '(601)274-7797' ,'Americana','364 Gorby Lane, Hattiesburg, MS 39402',0,1,0); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Tim O''Reilly','tim@omedia.com','O''Reilly Media','(713)256-7086','Americana','3503 Patterson Street, Houston, TX 77032',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Guy Sagy','guysagy@technin.com','Technion','(801)639-0036','Americana','3652 Tori Lane, Murray, UT 84107',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Daniel Keren','dkeren@haifa.us','Haifa University','(315)753-8607','Americano','4844 Saint Marys Avenue, Syracuse, NY 13202',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sudarshan Kadambi','sudarshan@boomberg.com','Bloomberg','(708)812-1242','Indiana','4782 Poplar Street, Westchester, IL 60154',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jianjun Chen','jianjunchen@yahoo.com','Yahoo!','(307)567-6328','Chinesa','4150 Thorn Street, Mountain View, WY 82939',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jiannan Wang','jiannanwng@tsinghua.com','Tsinghua University','505-266-1964','Chinesa','Tsinghua',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Guoliang Li','guolianfli@tsinghua.com','Tsinghua University','505-266-1972','Chinesa','Tsinghua',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Vibhor Rastogi','rastori@yahoo.com','Yahoo! Research','(309)759-4067','Russa','',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Nilesh Dalvi ','dalvi@yahoo.com','Yahoo!','(309)759-8767','Russa','2325 Simpson Street, Summum, IL 61501',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Pei Li','University of Milan - Bicocca','','','Chinesa','325 Oak Street, Summum, IL 61501',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xin Dong','xindond@tet.com','T&T Labs','(512)749-4397','Chinesa','3914 Brentwood Drive, Austin, TX 78744',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'João Rocha Junior','jjrocha@ntnu.com','NTNU','(646)761-0079','Brasileira','2530 Forest Avenue, Mineola, NY 11501',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Akrivi Vlachou','akrivi@ntnu.com','NTNU','(614)594-6046','Americana','3390 Palmer Road, Westerville, OH 43081',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Ermelinda Oro','ermelindaoro@altilia.com','DEIS-UNICAL, Altilia srl','(650)773-8462','Americana','3997 Duck Creek Road, San Francisco, CA 94107',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Massimo Ruffolo','massimoruffolo@altilia.com','DEIS-UNICAL, Altilia srl','(650)877-7780','Italiana','896 Jarvisville Road, San Francisco, CA 94107',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xiang Lian','xianglian@hkust.com','HKUST','505-266-1972','Chinesa','Hong Kong',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Lei Chen','leichen@hkust.com','HKUST','505-266-8173','Chinesa','Honk Kong',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Thomas Bernecker','bernecker@ludwig.max.com','Ludwig-Maximilians-University','602-253-8018','Alemã','Mohrenstrasse 43 7859 Ludwig, Germany',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Tobias Emrich','emrich@ludwig.max.com','Ludwig-Maximilians-University','602-826-1937','Alemã','Mohrenstrasse 43 7859 Ludwig, Germany',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sanjeev Khanna','khanna@pennsy.us','University of Pennsylvania','(703)490-9111','Americana','3684 Daffodil Lane Woodbridge, PE 22191',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sudeepa Roy','sudeepa@pennsy.us','University of Pennsylvania','(714)868-3289','Americana','433 Sunny Day Drive Woodbridge, PE 22191',0,0,1);
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Nan Wang','nawang@nusg.com','National University of Singapore','085 870 2278','Singapura','481 Cheriton Dr Umzumbe 4225',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jingbo Zhang','jingbozhang@nusg.com','National University of Singapore','085 377 2587','Singapura','1366 Kort St Groblershoop 8826',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Aditya Parameswaran','parameswaran@stanford.us','Stanford University','(818)770-9357','Indiana','2348 Koontz Lane Burbank, CA 91504',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Anish Das Sarma','anishsarma@yahoo.com','Yahoo! Research','(484)275-9847','Indiana','2976 Renwick Drive Philadelphia, PA 19103',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Chenghui Ren','chenghui@uhk.com','The University of Hong Kong','606-277-8970','Chinesa','Hong Kong',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Eric Lo','ericlo@hkpoly.com','HK Polytechnic University','908-458-7808','Chinesa','Hong Kong',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Nilesh Dalvi','nilesh@yahoo.com','Yahoo! ','(512)896-2985','Americana','854 Short Street,  Austin, TX 78723',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Ravi Kumar','kumar@yahoo.com','Yahoo!','(678)478-7792','Americana','28 Adonais Way, Norcross, GA 30071',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jiong HE','jionghe@nanyamg.ch','Nanyang Technological University','512-346-1764','Chinesa','Nanyang, China',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Mian Lu','mianlu@astar.com','A*STAR Institute of High Performance Computing','(972)378-0830','Chinesa','3160 Whispering Pines Circle, Plano, TX 75024',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Max Heimel','maxheimel@tub.ge','Technische UniversitÃ¤t Berlin','089 80 36 04','Alemã','Rhinstrasse 62, 80910 München',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Michael Saecker','saecker@parstream.ge','ParStream GmbH','07823 89 26 72','Alemã','Bleibtreustraße 38, 77978 Schuttertal',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Radu Stoica','stoica@epfl.com','EPFL','903-441-8674','Americana','1180 Florence Street, Greenville, TX 75401',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Anastasia Ailamaki','ailamaki@epfl.com','EPFL','813-279-5475','Americana','1630 Bernardo Street, Tampa, FL 33602',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xin Liu','xiuli@waterloo.com','University of Waterloo','401-921-6839','Chinesa','4041 Crummit Lane, West Warwick, RI 02893',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Kenneth Salem','ksalem@waterloo.com','University of Waterloo','925-465-8535','Americana','1596 Park Street, San Francisco, CA 94103',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Yuan Yuan','yuanyuan@ohiostate.us','The Ohio State University','773-641-9791','Chinesa','2429 Virginia Street, Elmhurst, IL 60126',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Rubao Lee','rubaolee@ohiostate.us','The Ohio State University','281-919-2034','Chinesa','1244 Gambler Lane, Houston, TX 77060',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Guimei Liu','guimeiliu@nusg.com','National University of Singapore','084 725 3563','Singapura','1970 Schoeman St, Pretoria, 0084',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Andre Suchitra','suchitra@nusg.com','National University of Singapore','085 695 5671','Singapura','1585 Doreen St, Mogwase, 0388',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Kyriakos Mouratidis','mouratidis@sgmu.com','Singapore Management University','085 948 1622','Singapura','1424 Wattle St, Molteno, 5500',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'HweeHwa Pang','hwpang@sgmu.com','Singapore Management University','084 659 0781','Singapura','1388 Burger St, Bronkhorstspruit, 1022',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Yang Wang','yangwamg@gmail.com','Fudan University','309-422-1584','Chinesa','234 Coburn Hollow Road, Peoria, IL 61602',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Peng Wang','pengwang@gmail.com','Fudan University','73 213 707','Chinesa','149 Rue Abdelkader, 5079 MONASTIR GARE',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Lu Li','luli@google.com','National University of Singapore','77 754 843','Chinesa','66 Rue de fes, 3112 GRAGAYA',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Chee-Yong Chan','chancy@comp.nus.edu.sg','National University of Singapore','76 388 265','Singapura','116 Av Sidi Lakhmi, 9121 OULED AMOR',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Justin Levandoski','levandoski@microsoft.com','Microsoft Research','419-382-5018','Americana','153 Olive Street, Toledo, OH 43614',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'David Lomet','lomet@microsoft.com','Microsoft Research','541-277-7195','Americana','4033 New Street, Juntura, OR 97911',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Rui Liu','ruiliu@gmail.com','University of Waterloo','662-993-8140','Chinesa','999 Tanglewood Road, Ripley, MS 38663',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Ashraf Aboulnaga','aboulnaga@gmail.com','University of Waterloo','304-786-6972','Americana','498 Augusta Park, Charleston, WV 2530',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Hatem Mahmoud','mahmoud@gmail.com','University of California','360-675-1482','Americana','23 Mutton Town Road, Oak Harbor, WA 98277',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Faisal Nawab','nawab@gmail.com','University of California','330-297-3620','Americana','2804 Briarhill Lane, Ravenna, OH 44266',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Essam Mansour','mansour@gmail.com','King Abdullah University of Science and Technology','979-490-5495','Americana','4878 Adams Drive, Sweeny, TX 77480',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Panos Kalnis','kalnis@gmail.com','King Abdullah University of Science and Technology','641-398-2166','Americana','4059 Southern Avenue, Floyd, IA 50435',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Maheswaran Sathiamoorthy','sathiamoorthy@gmail.com','University of Southern California','804-261-0282','Americana','2183 Coulter Lane, Richmond, VA 23228',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Megasthenis Asteris','asteris@gmail.com','University of Southern California','303-639-0653','Americana','867 Sampson Street, Denver, CO 80222',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Yun Chi','yunchi@gmail.com','NEC Laboratories America','814-417-1652','Chinesa','4617 Stutler Lane, Erie, PA 16510',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Hakan Hacigumus','hacigumus@gmail.com','NEC Laboratories America','928-261-6780','Americana','1649 Clarksburg Park Road, Phoenix, AZ 85040',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xiaoli Wang','xiaoli@comp.nus.edu.sg','National University of Singapore','9572 8027','Singapura','Paso Rivero 76, 33000 Treinta y Tres',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Anthony K.H. Tung','atung@comp.nus.edu.sg','National University of Singapore','76 887 419','singapura','47 Rue Camille des Moulins, 2110 MOULARES',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Weiren Yu','weirenyu@cse.unsw.edu.au','The University of New South Wales','(08) 8390 2820','Australiana','47 Thule Drive, AUSTRALIA PLAINS SA 5374',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xuemin Lin','lxue@cse.unsw.edu.au','The University of New South Wales','(07) 4568 3014','Australiana','68 Derry Street, TALWOOD QLD 4496',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Marc Gyssens','marc.gyssens@uhasselt.be','Hasselt University','702-693-8973','Americana','1479 Hickory Ridge Drive, Las Vegas, NV 89109',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jan Paredaens','jan.paredaens@ua.ac.be','University of Antwerp','704-440-8795','Americana','207 Kooter Lane, Charlotte, NC 28217',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Sudipto Das','sudiptod@microsoft.com','Microsoft Research','231-529-9173','Americana','Redmond, WA USA',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Vivek R. Narasayya','viveknar@microsoft.com','Microsoft Research','906-341-4180','Americana','Redmond, WA USA',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Qian Chen','qchen@comp.hkbu.edu.hk','Hong Kong Baptist University','415-327-0583','Chinesa','Kowloon Tong, Hong Kong',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Haibo Hu','haibo@comp.hkbu.edu.hk','Hong Kong Baptist University','281-913-7875','Chinesa','Kowloon Tong, Hong Kong',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Zichao Qi','qizichao@gmail.com','Tsinghua University','313-247-1928','Chinesa','Beijing, China',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Yanghua Xiao','shawyh@fudan.edu.cn','Fudan University','435-890-3818','Chinesa','Shanghai, China',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Manohar Kaul','mkaul@cs.au.dk','Aarhus University','203-386-2307','Chinesa','4335 Cheshire Road, Stratford, CT 06497',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Raymond Chi-Wing Wong','raywong@cse.ust.hk','The Hong Kong University of Science and Technology','508-756-9610','Chinesa','Hong Kong, China',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Cagri Balkesen','cagri.balkesen@inf.ethz.ch','ETH','041 630 26 81','Suiça','Zurich, Switzerland',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Gustavo Alonso','gustavo.alonso@inf.ethz.ch','ETH','026 546 22 73','Espanhola','Zurich, Switzerland',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Felix Martin Schuhknecht','schunknecht@saarland.de','Saarland University','23-52-08-12','Dinamarquesa','Faaborgvej 71574 Kobenhavn V',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Jens Dittrich','dittrich@saarland.de','Saarland University','81-85-88-04','Dinamarquesa','Strandalléen 33, 7362 Hampen',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Bahaeddin Eravci','beravci@gmail.com','Bilkent University','78 989 638','Turca','Ankara, Turkey',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Hakan Ferhatosmanoglu','hakan@cs.bilkent.edu.tr','Bilkent University','73 704 798','Turca','Ankara, Turkey',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Steven Pelley','spelley@umich.edu','University of Michigan','301-490-9385','Americana','4906 Cost Avenue, Laurel, MD 20707',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Thomas F. Wenisch','twenisch@umich.edu','University of Michigan','405-929-4931','Americana','1788 Meadow Drive, Colony, OK 73021',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Mariam Salloum','msalloum@cs.ucr.edu','UC Riverside','928-627-2026','Americana','4199 Skips Lane, Somerton, AZ 85350',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Vassilis J. Tsotras','tsotras@cs.ucr.edu','UC Riverside','310-671-0239','Americana','329 Jett Lane, Inglewood, CA 90301',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Guoping Wang','wangguoping@comp.nus.edu.sg','National University of Singapore','082 932 5820','Singapura','2308 Station Road, Colenso, 3360',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Zhenhui Li','zhenhui@pennstate.edu','Pennsylvania State University','717-397-8855','Chinesa','3864 Stout Street, Lancaster, PA 17602',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Fei Wu','feiwuu@pennstate.edu','Pennsylvania State University','626-300-8634','Chinesa','174 Middleville Road, Alhambra, CA 91801',0,0,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Xiang Zhao','xzhao@cse.unsw.edu.au','The University of New South Wales','(07) 4008 4383','Chinesa','26 Seninis Road, SWANS LAGOON QLD 4807',0,1,1); 
INSERT INTO pessoa VALUES (SEQ_idPe.nextVal,'Wenjie Zhang',' zhangw@cse.unsw.edu.au','The University of New South Wales','(03) 6215 7560','Chinesa','22 Flinstone Drive, TODS CORNER TAS 7030',0,0,1); 
/
/
--Inserções de Inscrito
--inscrito ( codEv, numEd, idPart, dataInsc, tipoApresentador )
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Carmen P. Varela'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Connie R. Haddix'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Tom C. Cossette'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Lynnette W. Freeman'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Nichole F. Erickson'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Georgia D. Williams'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Mathew L. Garnes'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Sandra G. Bearden'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Chauncey B. Shropshire'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Estelle A. Schleicher'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Charles D. Spurgeon'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Boyce D. Hornback'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Joe M. Avila'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Paul T. Picou'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'David L. Ryles'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Tim O''Reilly'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Guy Sagy'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Sudarshan Kadambi'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Jiannan Wang'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Vibhor Rastogi'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Nilesh Dalvi'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Pei Li'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'João Rocha Junior'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Ermelinda Oro'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Lian'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Thomas Bernecker'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Sanjeev Khanna'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Nan Wang'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Aditya Parameswaran'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT idPe FROM pessoa WHERE nomePe = 'Chenghui Ren'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Sandra G. Bearden'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Chauncey B. Shropshire'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Estelle A. Schleicher'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Charles D. Spurgeon'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Boyce D. Hornback'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Joe M. Avila'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Paul T. Picou'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'David L. Ryles'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Geoffrey J. Haynes'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Frances G. Soto'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'James R. Nilsen'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Lillian V. Hobbs'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Steve N. Mitchell'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Brain M. Ely'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Alexandra J. Kinard'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Jiong HE'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Max Heimel'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Radu Stoica'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Xin Liu'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1);
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Yuan Yuan'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Guimei Liu'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Kyriakos Mouratidis'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Yang Wang'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Lu Li'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Justin Levandoski'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Rui Liu'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Hatem Mahmoud'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Essam Mansour'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Maheswaran Sathiamoorthy'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT idPe FROM pessoa WHERE nomePe = 'Yun Chi'),TO_DATE('30/08/2013','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Geoffrey J. Haynes'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Frances G. Soto'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'James R. Nilsen'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Lillian V. Hobbs'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Steve N. Mitchell'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Brain M. Ely'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Alexandra J. Kinard'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Dorothy J. Noyes'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Pamela J. Gilreath'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Julio C. Lowrance'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Betty R. Bedard'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Henrietta B. Forsyth'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'David H. Client'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Leona P. Harris'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Hector W. Johnson'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),0 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Xiaoli Wang'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Weiren Yu'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Marc Gyssens'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Sudipto Das'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Qian Chen'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Zichao Qi'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Cagri Balkesen'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Felix Martin Schuhknecht'),TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Bahaeddin Eravci'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Steven Pelley'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Mariam Salloum'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Guoping Wang'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Zhenhui Li'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Zhao'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
INSERT INTO inscrito VALUES((SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT idPe FROM pessoa WHERE nomePe = 'Manohar Kaul'),TO_DATE('30/08/2014','dd/mm/yyyy hh24:mi:ss'),1 );
/
/
--Inserções de Artigo
--artigo (idArt, tituloArt, dataApresArt, horaApresArt, codEv, numEd, idApr)
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Towards a Global Brain', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 08:45:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Tim O''Reilly'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Guy Sagy'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Where in the World is My Data?', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Sudarshan Kadambi'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Entity Matching: How Similar Is Similar', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Jiannan Wang'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Large-Scale Collective Entity Matching', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Vibhor Rastogi'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Automatic Wrappers for Large Scale Web Extraction', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Nilesh Dalvi'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Linking Temporal Records', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 10:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Pei Li'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Efficient Processing of Top-k Spatial Preference Queries', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 13:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'João Rocha Junior'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'SXPath - Extending XPath towards Spatial Querying on Web Documents', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 13:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Ermelinda Oro'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'A Generic Framework for Handling Uncertain Data with Local Correlations', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 13:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Lian'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 13:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Thomas Bernecker'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Queries with Difference on Probabilistic Databases', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 13:30:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Sanjeev Khanna'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'On Triangulation-based Dense Neighborhood Graph Discovery', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 16:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Nan Wang'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Human-Assisted Graph Search: It''s Okay to Ask Questions', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 16:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Aditya Parameswaran'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'On Querying Historical Evolving Graph Sequences', TO_DATE('30/08/2011','dd/mm/yyyy hh24:mi:ss'), TO_DATE('30/08/2011 16:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Chenghui Ren'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Jiong HE'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Hardware-Oblivious Parallelism for In-Memory Column-Stores', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Max Heimel'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Improving Flash Write Performance by Using Update Frequency', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Radu Stoica'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Hybrid Storage Management for Database Systems', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Xin Liu'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'The Yin and Yang of Processing Data Warehousing Queries on GPU Devices', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Yuan Yuan'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Itemsets', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Guimei Liu'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Computing Immutable Regions for Subspace Top-k Queries', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Kyriakos Mouratidis'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Yang Wang'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Efficient Indexing for Diverse Query Results', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Lu Li'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'LLAMA: A Cache/Storage Subsystem for Modern Hardware', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Justin Levandoski'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'DAX: A Widely Distributed Multi-tenant Storage Service for DBMS Hosting', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Rui Liu'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Low-latency multi-datacenter databases using replicated commit', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Hatem Mahmoud'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequences', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Essam Mansour'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'XORing Elephants: Novel Erasure Codes for Big Data', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Maheswaran Sathiamoorthy'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Distribution-Based Query Scheduling', TO_DATE('27/08/2013','dd/mm/yyyy hh24:mi:ss'), TO_DATE('27/08/2013 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Yun Chi'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Efficient and Effective KNN Sequence Search with Approximate n-grams', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Xiaoli Wang'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'More is Simpler: Effectively and Efficiently Assessing Node-Pair Similarities Based on Hyperlinks', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Weiren Yu'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'An Approach towards the Study of Symmetric Queries', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Marc Gyssens'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'CPU Sharing Techniques for Performance Isolation in Multi-tenant Relational Database-as-a-Service', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Sudipto Das'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Authenticating Top-k Queries in Location-based Services with Confidentiality', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Qian Chen'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Toward a Distance Oracle for Billion-Node Graphs', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Zichao Qi'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Finding Shortest Paths on Terrains by Killing Two Birds with One Stone', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Manohar Kaul'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Multi-Core, Main-Memory Joins: Sort vs. Hash Revisited', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Cagri Balkesen'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'The Uncracked Pieces in Database Cracking', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Felix Martin Schuhknecht'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Diversity based Relevance Feedback for Time Series Search', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Bahaeddin Eravci'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Storage Management in the NVRAM Era', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Steven Pelley'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Online Ordering of Overlapping Data Sources', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Mariam Salloum'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Multi-Query Optimization in MapReduce Framework', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Guoping Wang'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'Attraction and Avoidance Detection from Movements', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Zhenhui Li'));
INSERT INTO artigo VALUES(SEQ_idArt.nextval,'A Partition-Based Approach to Structure Similarity Search', TO_DATE('02/09/2014','dd/mm/yyyy hh24:mi:ss'), TO_DATE('02/09/2014 11:00:00','dd/mm/yyyy hh24:mi:ss'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Zhao'));
/
/
--Inserções de Escreve
--escreve (idAut, idArt)
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Tim O''Reilly'), (SELECT idArt FROM artigo WHERE tituloArt = 'Towards a Global Brain'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Guy Sagy'), (SELECT idArt FROM artigo WHERE tituloArt = 'Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Daniel Keren'), (SELECT idArt FROM artigo WHERE tituloArt = 'Distributed Threshold Querying of General Functions by a Difference of Monotonic Representation'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Sudarshan Kadambi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Where in the World is My Data?'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jianjun Chen'), (SELECT idArt FROM artigo WHERE tituloArt = 'Where in the World is My Data?'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jiannan Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'Entity Matching: How Similar Is Similar'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Guoliang Li'), (SELECT idArt FROM artigo WHERE tituloArt = 'Entity Matching: How Similar Is Similar'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Vibhor Rastogi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Large-Scale Collective Entity Matching'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Nilesh Dalvi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Large-Scale Collective Entity Matching'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Pei Li'), (SELECT idArt FROM artigo WHERE tituloArt = 'Linking Temporal Records'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xin Dong'), (SELECT idArt FROM artigo WHERE tituloArt = 'Linking Temporal Records'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'João Rocha Junior'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Processing of Top-k Spatial Preference Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Akrivi Vlachou'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Processing of Top-k Spatial Preference Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Ermelinda Oro'), (SELECT idArt FROM artigo WHERE tituloArt = 'SXPath - Extending XPath towards Spatial Querying on Web Documents'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Massimo Ruffolo'), (SELECT idArt FROM artigo WHERE tituloArt = 'SXPath - Extending XPath towards Spatial Querying on Web Documents'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Lian'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Generic Framework for Handling Uncertain Data with Local Correlations'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Lei Chen'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Generic Framework for Handling Uncertain Data with Local Correlations'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Thomas Bernecker'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Tobias Emrich'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Sanjeev Khanna'), (SELECT idArt FROM artigo WHERE tituloArt = 'Queries with Difference on Probabilistic Databases'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Sudeepa Roy'), (SELECT idArt FROM artigo WHERE tituloArt = 'Queries with Difference on Probabilistic Databases'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Nan Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'On Triangulation-based Dense Neighborhood Graph Discovery'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jingbo Zhang'), (SELECT idArt FROM artigo WHERE tituloArt = 'On Triangulation-based Dense Neighborhood Graph Discovery'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Aditya Parameswaran'), (SELECT idArt FROM artigo WHERE tituloArt = 'Human-Assisted Graph Search: It''s Okay to Ask Questions'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Anish Das Sarma'), (SELECT idArt FROM artigo WHERE tituloArt = 'Human-Assisted Graph Search: It''s Okay to Ask Questions'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Chenghui Ren'), (SELECT idArt FROM artigo WHERE tituloArt = 'On Querying Historical Evolving Graph Sequences'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Eric Lo'), (SELECT idArt FROM artigo WHERE tituloArt = 'On Querying Historical Evolving Graph Sequences'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Nilesh Dalvi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Automatic Wrappers for Large Scale Web Extraction'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Ravi Kumar'), (SELECT idArt FROM artigo WHERE tituloArt = 'Automatic Wrappers for Large Scale Web Extraction'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jiong HE'), (SELECT idArt FROM artigo WHERE tituloArt = 'Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Mian Lu'), (SELECT idArt FROM artigo WHERE tituloArt = 'Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Max Heimel'), (SELECT idArt FROM artigo WHERE tituloArt = 'Hardware-Oblivious Parallelism for In-Memory Column-Stores'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Michael Saecker'), (SELECT idArt FROM artigo WHERE tituloArt = 'Hardware-Oblivious Parallelism for In-Memory Column-Stores'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Radu Stoica'), (SELECT idArt FROM artigo WHERE tituloArt = 'Improving Flash Write Performance by Using Update Frequency'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Anastasia Ailamaki'), (SELECT idArt FROM artigo WHERE tituloArt = 'Improving Flash Write Performance by Using Update Frequency'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xin Liu'), (SELECT idArt FROM artigo WHERE tituloArt = 'Hybrid Storage Management for Database Systems'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Kenneth Salem'), (SELECT idArt FROM artigo WHERE tituloArt = 'Hybrid Storage Management for Database Systems'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Yuan Yuan'), (SELECT idArt FROM artigo WHERE tituloArt = 'The Yin and Yang of Processing Data Warehousing Queries on GPU Devices'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Rubao Lee'), (SELECT idArt FROM artigo WHERE tituloArt = 'The Yin and Yang of Processing Data Warehousing Queries on GPU Devices'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Guimei Liu'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Itemsets'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Andre Suchitra'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Itemsets'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Kyriakos Mouratidis'), (SELECT idArt FROM artigo WHERE tituloArt = 'Computing Immutable Regions for Subspace Top-k Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'HweeHwa Pang'), (SELECT idArt FROM artigo WHERE tituloArt = 'Computing Immutable Regions for Subspace Top-k Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Yang Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Peng Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Lu Li'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Indexing for Diverse Query Results'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Chee-Yong Chan'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient Indexing for Diverse Query Results'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Justin Levandoski'), (SELECT idArt FROM artigo WHERE tituloArt = 'LLAMA: A Cache/Storage Subsystem for Modern Hardware'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'David Lomet'), (SELECT idArt FROM artigo WHERE tituloArt = 'LLAMA: A Cache/Storage Subsystem for Modern Hardware'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Rui Liu'), (SELECT idArt FROM artigo WHERE tituloArt = 'DAX: A Widely Distributed Multi-tenant Storage Service for DBMS Hosting'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Ashraf Aboulnaga'), (SELECT idArt FROM artigo WHERE tituloArt = 'DAX: A Widely Distributed Multi-tenant Storage Service for DBMS Hosting'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Hatem Mahmoud'), (SELECT idArt FROM artigo WHERE tituloArt = 'Low-latency multi-datacenter databases using replicated commit'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Faisal Nawab'), (SELECT idArt FROM artigo WHERE tituloArt = 'Low-latency multi-datacenter databases using replicated commit'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Essam Mansour'), (SELECT idArt FROM artigo WHERE tituloArt = 'RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequences'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Panos Kalnis'), (SELECT idArt FROM artigo WHERE tituloArt = 'RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequences'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Maheswaran Sathiamoorthy'), (SELECT idArt FROM artigo WHERE tituloArt = 'XORing Elephants: Novel Erasure Codes for Big Data'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Megasthenis Asteris'), (SELECT idArt FROM artigo WHERE tituloArt = 'XORing Elephants: Novel Erasure Codes for Big Data'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Yun Chi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Distribution-Based Query Scheduling'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Hakan Hacigumus'), (SELECT idArt FROM artigo WHERE tituloArt = 'Distribution-Based Query Scheduling'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xiaoli Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient and Effective KNN Sequence Search with Approximate n-grams'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Anthony K.H. Tung'), (SELECT idArt FROM artigo WHERE tituloArt = 'Efficient and Effective KNN Sequence Search with Approximate n-grams'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Weiren Yu'), (SELECT idArt FROM artigo WHERE tituloArt = 'More is Simpler: Effectively and Efficiently Assessing Node-Pair Similarities Based on Hyperlinks'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xuemin Lin'), (SELECT idArt FROM artigo WHERE tituloArt = 'More is Simpler: Effectively and Efficiently Assessing Node-Pair Similarities Based on Hyperlinks'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Marc Gyssens'), (SELECT idArt FROM artigo WHERE tituloArt = 'An Approach towards the Study of Symmetric Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jan Paredaens'), (SELECT idArt FROM artigo WHERE tituloArt = 'An Approach towards the Study of Symmetric Queries'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Sudipto Das'), (SELECT idArt FROM artigo WHERE tituloArt = 'CPU Sharing Techniques for Performance Isolation in Multi-tenant Relational Database-as-a-Service'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Vivek R. Narasayya'), (SELECT idArt FROM artigo WHERE tituloArt = 'CPU Sharing Techniques for Performance Isolation in Multi-tenant Relational Database-as-a-Service'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Qian Chen'), (SELECT idArt FROM artigo WHERE tituloArt = 'Authenticating Top-k Queries in Location-based Services with Confidentiality'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Haibo Hu'), (SELECT idArt FROM artigo WHERE tituloArt = 'Authenticating Top-k Queries in Location-based Services with Confidentiality'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Zichao Qi'), (SELECT idArt FROM artigo WHERE tituloArt = 'Toward a Distance Oracle for Billion-Node Graphs'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Yanghua Xiao'), (SELECT idArt FROM artigo WHERE tituloArt = 'Toward a Distance Oracle for Billion-Node Graphs'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Manohar Kaul'), (SELECT idArt FROM artigo WHERE tituloArt = 'Finding Shortest Paths on Terrains by Killing Two Birds with One Stone'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Raymond Chi-Wing Wong'), (SELECT idArt FROM artigo WHERE tituloArt = 'Finding Shortest Paths on Terrains by Killing Two Birds with One Stone'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Cagri Balkesen'), (SELECT idArt FROM artigo WHERE tituloArt = 'Multi-Core, Main-Memory Joins: Sort vs. Hash Revisited'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Gustavo Alonso'), (SELECT idArt FROM artigo WHERE tituloArt = 'Multi-Core, Main-Memory Joins: Sort vs. Hash Revisited'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Felix Martin Schuhknecht'), (SELECT idArt FROM artigo WHERE tituloArt = 'The Uncracked Pieces in Database Cracking'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Jens Dittrich'), (SELECT idArt FROM artigo WHERE tituloArt = 'The Uncracked Pieces in Database Cracking'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Bahaeddin Eravci'), (SELECT idArt FROM artigo WHERE tituloArt = 'Diversity based Relevance Feedback for Time Series Search'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Hakan Ferhatosmanoglu'), (SELECT idArt FROM artigo WHERE tituloArt = 'Diversity based Relevance Feedback for Time Series Search'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Steven Pelley'), (SELECT idArt FROM artigo WHERE tituloArt = 'Storage Management in the NVRAM Era'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Thomas F. Wenisch'), (SELECT idArt FROM artigo WHERE tituloArt = 'Storage Management in the NVRAM Era'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Mariam Salloum'), (SELECT idArt FROM artigo WHERE tituloArt = 'Online Ordering of Overlapping Data Sources'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Vassilis J. Tsotras'), (SELECT idArt FROM artigo WHERE tituloArt = 'Online Ordering of Overlapping Data Sources'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Guoping Wang'), (SELECT idArt FROM artigo WHERE tituloArt = 'Multi-Query Optimization in MapReduce Framework'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Chee-Yong Chan'), (SELECT idArt FROM artigo WHERE tituloArt = 'Multi-Query Optimization in MapReduce Framework'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Zhenhui Li'), (SELECT idArt FROM artigo WHERE tituloArt = 'Attraction and Avoidance Detection from Movements'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Fei Wu'), (SELECT idArt FROM artigo WHERE tituloArt = 'Attraction and Avoidance Detection from Movements'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Zhao'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Partition-Based Approach to Structure Similarity Search'));
INSERT INTO escreve VALUES((SELECT idPe FROM pessoa WHERE nomePe = 'Wenjie Zhang'), (SELECT idArt FROM artigo WHERE tituloArt = 'A Partition-Based Approach to Structure Similarity Search'));
/
/
-- Inserções de Organiza
--organiza (idOrg, codEv, numEd, cargoOrg)
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Paul Larson'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Joseph M. Hellerstein'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 'Program Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Christian Konig'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 'Local Organization - Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Magdalena Balazinska'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 'Local Organization - Treasurer');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Paul Larson'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Joseph M. Hellerstein'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'Program Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Themis Palpanas'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Yannis Velegrakis'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Stefano Ceri'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'Advisory Board');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'John Mylopoulos'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 'Advisory Board');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Paul Larson'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Joseph M. Hellerstein'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'Program Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Chun Chen'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Sharad Mehrotra'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'General Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'H.V. Jagadish'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'Program Chair');
INSERT INTO organiza VALUES ((SELECT idPe FROM pessoa WHERE nomePe = 'Graham Cormode'), (SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 'Research Track Associate Editor');
/
/
-- Inserções de Patrocinador
--patrocinador (cnpjPat, razaoSocialPat, telefonePat, enderecoPat)
INSERT INTO patrocinador VALUES ('01.800.714/0001-47', 'Facebook', '(650)543-4800', '1601 S. California Ave , Palo Alto, CA 94304 ');
INSERT INTO patrocinador VALUES ('59.128.020/0001-95', 'Google', '(650)253-0000', '1600 Amphitheatre Parkway, Mountain View, CA 94043 ');
INSERT INTO patrocinador VALUES ('10.050.228/0001-40', 'Microsoft', '(212)245-2100', '1290 Avenue of the Americas, Sixth Floor New York, NY 10104');
INSERT INTO patrocinador VALUES ('61.531.491/0001-91', 'Oracle', '(650)506-7000', '500 Oracle Parkway, Redwood Shores, CA 94065');
/
/
--Inserções de Patrocinio
--patrocinio (cnpjPat, codEv, numEd, valorPat, saldoPat, dataPat)
INSERT INTO patrocinio VALUES('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 10000.00, 3300.00,TO_DATE('29/04/2011','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 12000.00, 3300.00,TO_DATE('28/04/2011','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 11000.00, 1300.00,TO_DATE('26/04/2011','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, 11000.00, 300.00,TO_DATE('10/04/2011','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 12000.00, 3300.00,TO_DATE('01/04/2013','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 14000.00, 4400.00,TO_DATE('01/04/2013','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 11000.00, 800.00,TO_DATE('05/04/2013','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, 11300.00, 0.00,TO_DATE('01/03/2013','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 12000.00, 4300.00,TO_DATE('10/04/2014','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 15000.00, 4800.00,TO_DATE('11/04/2014','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 11000.00, 1400.00,TO_DATE('10/04/2014','dd/mm/yyyy'));
INSERT INTO patrocinio VALUES('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, 11000.00, 0.00,TO_DATE('07/04/2014','dd/mm/yyyy'));
/
/
--Inserções de Despesas
--despesa (codDesp, codEv, numEd, cnpjPat, codEvPat, numEdPat, dataDesp, valorDesp, descricaoDesp)
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('30/05/2011','dd/mm/yyyy'), 1000.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('28/08/2011','dd/mm/yyyy'), 4000.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('30/05/2011','dd/mm/yyyy'), 3000.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('20/08/2011','dd/mm/yyyy'), 4000.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('20/08/2011','dd/mm/yyyy'), 4500.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('28/08/2011','dd/mm/yyyy'), 3500.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('30/05/2011','dd/mm/yyyy'), 5000.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,TO_DATE('21/08/2011','dd/mm/yyyy'), 4000.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('20/06/2013','dd/mm/yyyy'), 2500.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('19/08/2013','dd/mm/yyyy'), 4500.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('23/08/2013','dd/mm/yyyy'), 3200.00, 'Infrestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('20/08/2013','dd/mm/yyyy'), 4700.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('20/08/2013','dd/mm/yyyy'), 4600.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('26/08/2013','dd/mm/yyyy'), 3900.00, 'Infrestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('30/05/2013','dd/mm/yyyy'), 5600.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,TO_DATE('27/08/2013','dd/mm/yyyy'), 4000.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('30/05/2014','dd/mm/yyyy'), 1200.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('28/08/2014','dd/mm/yyyy'), 4800.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('29/05/2014','dd/mm/yyyy'), 3700.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('25/08/2014','dd/mm/yyyy'), 4800.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('31/05/2014','dd/mm/yyyy'), 4600.00, 'CoffeBreak');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('23/08/2014','dd/mm/yyyy'), 3300.00, 'infraestrutura');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('19/05/2014','dd/mm/yyyy'), 5100.00, 'Gastos com divulgação do evento');
INSERT INTO despesa VALUES(SEQ_codDesp.nextval,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, '61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,TO_DATE('24/08/2014','dd/mm/yyyy'), 4200.00, 'infraestrutura');
/
/
-- Inserções de Auxilio:
--auxilio (cnpjPat, codEvPat, numEdPat, codEvApr, numEdApr, idApr, valorAux, dataAux, tipoAux)
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Tim O''Reilly'), 1000.00, TO_DATE('27/08/2011','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Guy Sagy') , 500.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Sudarshan Kadambi') , 200.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Jiannan Wang'), 1000.00, TO_DATE('27/08/2011','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Vibhor Rastogi') , 500.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Nilesh Dalvi') ,200.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'João Rocha Junior'), 1000.00, TO_DATE('27/08/2011','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Ermelinda Oro' ), 500.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Xiang Lian') , 200.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Thomas Bernecker'), 1000.00, TO_DATE('27/08/2011','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Nan Wang'), 500.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2011, (SELECT idPe FROM pessoa WHERE nomePe = 'Aditya Parameswaran') , 200.00, TO_DATE('29/08/2011','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Jiong HE'), 1000.00, TO_DATE('27/08/2013','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Max Heimel'), 500.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Radu Stoica') , 200.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Xin Liu'), 1000.00, TO_DATE('27/08/2013','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Yuan Yuan') , 500.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Guimei Liu') ,200.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Kyriakos Mouratidis'), 1000.00, TO_DATE('27/08/2013','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Yang Wang') , 500.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Lu Li') , 200.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Justin Levandoski'), 1000.00, TO_DATE('27/08/2013','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Rui Liu') , 500.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2013, (SELECT idPe FROM pessoa WHERE nomePe = 'Hatem Mahmoud') , 200.00, TO_DATE('29/08/2013','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Xiaoli Wang'), 1000.00, TO_DATE('27/08/2014','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Weiren Yu') , 500.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('01.800.714/0001-47',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Marc Gyssens') , 200.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Sudipto Das'), 1000.00, TO_DATE('27/08/2014','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Qian Chen') , 500.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('59.128.020/0001-95',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Zichao Qi') ,200.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Manohar Kaul'), 1000.00, TO_DATE('27/08/2014','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Cagri Balkesen') , 500.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('10.050.228/0001-40',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Felix Martin Schuhknecht') , 200.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Alimentação');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Bahaeddin Eravci'), 1000.00, TO_DATE('27/08/2014','dd/mm/yyyy'), 'Transporte');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Steven Pelley') , 500.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Hospedagem');
INSERT INTO auxilio VALUES ('61.531.491/0001-91',(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014,(SELECT codEV from evento WHERE nomeEv = 'Very Large Data Bases'), 2014, (SELECT idPe FROM pessoa WHERE nomePe = 'Mariam Salloum') , 200.00, TO_DATE('29/08/2014','dd/mm/yyyy'), 'Alimentação');

