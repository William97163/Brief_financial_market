'Mission 1'

INSERT INTO transaction (nom, nomEquipe, date, lieu, prix)
VALUES 
('AXA SA','equipe1','2021-06-15','PARIS',26),
('TotalEnergies','equipe2','2004-09-03','PARIS',57),
('Apple Inc','equipe1','2014-09-05','USA',150),
('Dubai Ele','equipe3','2020-11-22','DUBAI',1),
('Amazon','equipe3','2010-07-12','USA',100),
('Nasper','equipe2','1997-08-16','SOUTH AFRICA',120),
('PetroChina','equipe5','2019-04-20','HONK KONG',10),
('ETF Vanguard','equipe7','2015-02-22','LA',200),
('Dassault Aviation','equipe6','2016-01-01','PARIS',140);

INSERT INTO trader (nom, classe_actif, anneeExperience, nomEquipe)
VALUES
('Yannick','fixed income', 10, 'equipe1'),
('Patrick','action', 10, 'equipe1'),
('Cedrick','commodities', 10, 'equipe1'),
('Jordan','change', 2, 'equipe2'),
('Gaelle','exotic', 4, 'equipe3'),
('Georges','CDS', 20, 'equipe6');

INSERT INTO equipe (nom, style, chef)
VALUES 
('equipe1','market making', 'leonardo'),
('equipe2','arbitrage', 'michaelgelo'),
('equipe3','trading de volatilite', 'raphael'),
('equipe4','trading haute frequence', 'donatello'),
('equipe5','arbitrage statistique', 'Smith'),
('equipe6','arbitrage statistique', 'Smith'),
('equipe7','strategie fond de fond', 'Ray');

'Mission 2'

'mf01'
SELECT nom, classe_actif FROM trader WHERE anneeExperience < 5

'mf02'
SELECT classe_actif FROM trader WHERE nomEquipe = 'equipe1'

'mf03'
SELECT * FROM trader where classe_actif = 'commodities'

'mf04'
SELECT classe_actif FROM trader where anneeExperience > 20

'mf05'
SELECT nom FROM trader WHERE anneeExperience BETWEEN 5 AND 10

'mf06'
SELECT classe_actif FROM trader WHERE classe_actif LIKE 'ch%'

'mf07'
SELECT nom FROM equipe WHERE style = 'arbitrage statistique'

'mf08'
SELECT nom FROM equipe WHERE chef = 'Smith'

'mf09'
SELECT * FROM transaction ORDER BY `nom` ASC

'mf10'
SELECT * FROM transaction WHERE date = '2019-04-20' AND lieu = 'Hong Kong'

'mf11'
SELECT lieu FROM transaction WHERE prix > 150

'mf12'
SELECT * FROM transaction WHERE lieu = 'Paris' AND prix < 50

'mf13'
SELECT lieu FROM transaction WHERE date LIKE "2014%"

'mmtj01'
SELECT trader.nom, equipe.style FROM trader
INNER JOIN equipe ON equipe.nom = trader.nomEquipe
WHERE equipe.style = 'arbitrage statistique' AND trader.anneeExperience > 3

'mmtj02'
SELECT lieu FROM transaction 
INNER JOIN equipe ON equipe.nom = transaction.nomEquipe
WHERE equipe.chef = 'Smith' AND transaction.prix < 20
ORDER BY lieu ASC

'mmtj03'
SELECT COUNT(lieu) FROM transaction
INNER JOIN equipe ON equipe.nom = transaction.nomEquipe
WHERE style ='market making' AND date LIKE '2021%'

'mmtj04'
SELECT AVG(prix) FROM transaction 
INNER JOIN equipe ON equipe.nom = transaction.nomEquipe
WHERE equipe.style = 'market making'
GROUP BY lieu

'mmtj05'
SELECT classe_actif FROM trader 
INNER JOIN transaction ON transaction.nomEquipe = trader.nomEquipe
INNER JOIN equipe ON equipe.nom = trader.nomEquipe
WHERE date = '2016-01-01' AND chef = 'Smith'

'mmtj21'
SELECT AVG(anneeExperience) FROM trader
INNER JOIN equipe ON equipe.nom = trader.nomEquipe
GROUP BY style

'mmts01'
SELECT nom,classe_actif FROM trader
WHERE anneeExperience > 3 AND nomEquipe IN (SELECT nom FROM equipe WHERE style ='arbitrage statistique')
ORDER BY nom ASC

'mmts02'
SELECT lieu FROM transaction 
WHERE prix < 20 AND nomEquipe IN (SELECT nom FROM equipe  WHERE chef ='Smith')
ORDER BY lieu ASC

'mmts03'
SELECT COUNT(lieu) FROM transaction 
WHERE date LIKE '2015%' AND nomEquipe IN 
(SELECT nom FROM equipe WHERE style ='traiding de volatilite')

'mmts04'
SELECT AVG(prix) FROM transaction 
WHERE nomEquipe IN (
    SELECT nom FROM equipe WHERE style = 'market making')
GROUP BY lieu 

'mmts05'
SELECT classe_actif FROM trader 
WHERE nomEquipe IN (
    SELECT nomEquipe FROM transaction WHERE date ='2016-01-01' AND nomEquipe IN(
    SELECT nom FROM equipe WHERE chef='Smith'))