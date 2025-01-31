-- Criação das tabelas
CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNH VARCHAR(20) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Contato VARCHAR(50)
);

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Empresa VARCHAR(100),
    Endereco VARCHAR(200),
    Contato VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    DriverID INT NOT NULL,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Inserção de dados
INSERT INTO Drivers (Nome, CNH, Endereco, Contato)
VALUES 
('Carlos Silva', '1234567890', 'Rua A, 123, São Paulo', '11999999999'),
('Fernanda Costa', '9876543210', 'Av. B, 456, Rio de Janeiro', '21988888888');

INSERT INTO Clients (Nome, Empresa, Endereco, Contato)
VALUES 
('João Pereira', 'Transportes XYZ', 'Rua X, 789, São Paulo', '11888888888'),
('Mariana Souza', 'Comércio ABC', 'Av. Y, 321, Minas Gerais', '31877777777');

INSERT INTO Orders (ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES 
(1, 1, 'Entrega de eletrônicos', '2025-02-01', 'Pendente'),
(2, 2, 'Transporte de alimentos', '2025-02-02', 'Em andamento');
