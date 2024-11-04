ACESSAR
sqlcmd -S tcp:fernandoely.database.windows.net,1433 -d estacio_pratica4 -U fernandoely -P 'binaural@2003' -N -l 30


CREATE TABLE Drivers ( DriverID INT PRIMARY KEY, Nome VARCHAR(100), CNH VARCHAR(20), Endereco VARCHAR(200), Contato VARCHAR(50));

INSERT INTO Drivers (DriverID, Nome, CNH, Endereco, Contato) VALUES (1, 'Paulo', '08398854253', 'Rua Afonso Medina, 131', 'paulo@seumail.com');
INSERT INTO Drivers (DriverID, Nome, CNH, Endereco, Contato) VALUES (2, 'Beatriz', '59938017020', 'Rua Sebastião Neves, 11931', 'beatriz@seumail.com');
INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato) VALUES (3, 'Tiago', '36517780387', 'Rua Pedro Silva, 316', 'pedro@seuemail.com');


CREATE TABLE Clients (ClientID INT PRIMARY KEY, Nome VARCHAR(100), Empresa VARCHAR(100), Endereco VARCHAR(200), Contato VARCHAR(50));

INSERT INTO Clients (ClientID, Nome, Empresa, Endereco, Contato) VALUES (1, 'Empresa Dumaen', 'Cesar Augusto', 'Rua Flores da Cunha, 1739', 'admin@Dumaen.com');
INSERT INTO Clients (ClientID, Nome, Empresa, Endereco, Contato) VALUES (2, 'Bike Shop Ltda', 'Luis Augusto', 'Av. Dona Laura 1321 - Porto Alegre', 'luis_bike@bikeshop.com');
INSERT INTO Clients (ClientID, Nome, Empresa, Endereco, Contato) VALUES (3, 'Games 4 You', 'Carlos', 'Rua Jorge Forte', 'carlos@games4u.com');


CREATE TABLE Orders (OrderID INT PRIMARY KEY, ClientID INT, DriverID INT, DetalhesPedido TEXT, DataEntrega DATE, Status VARCHAR(50), FOREIGN KEY (ClientID) REFERENCES Clients(ClientID), FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID));

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES (700, 1, 3, '1 Controle Playstation', '2024-10-30', 'Separando');
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES (701, 3, 1, '32 Pilhas AAA', '2024-11-05', 'Em Transporte');
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES (702, 2, 2, 'Bicicleta Pinarello Dogma', '2024-11-25', 'Aguardando');


### Lista Tabela Orders
SELECT Orders.OrderID, Orders.DetalhesPedido, Orders.DataEntrega, Orders.Status, Clients.Nome AS NomeCliente, Clients.Empresa, Drivers.Nome AS NomeMotorista  FROM Orders INNER JOIN Clients ON Orders.ClientID = Clients.ClientID INNER JOIN Drivers ON Orders.DriverID = Drivers.DriverID;
