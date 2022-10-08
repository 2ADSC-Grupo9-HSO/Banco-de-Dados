CREATE DATABASE HSO;
USE HSO;
GO;

CREATE TABLE tbRedeHospitalar(
	idRede INT PRIMARY KEY IDENTITY(1,1),
	nomeRede VARCHAR(45)
);

INSERT INTO tbRedeHospitalar 
VALUES (NULL, 'Plena');

CREATE TABLE tbFilialHospital(
	idFilial INT PRIMARY KEY IDENTITY(1,1),
    fkRede INT,
    FOREIGN KEY (fkRede) REFERENCES tbRedeHospitalar (idRede),
    cepFilial INT,
    numeroEndFilial VARCHAR(45),
    complementoEnd VARCHAR(45),
    cnpjFilial VARCHAR(45),
    senhaFilial VARCHAR(45)
);
    
CREATE TABLE tbTelefoneHospital(
	idTelefone INT PRIMARY KEY IDENTITY(1,1),
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    numeroTelefone VARCHAR(45),
    tipoNum VARCHAR(9),
    CHECK (tipoNum = 'Fixo' OR tipoNum = 'Celular' OR tipoNum = 'Whatsapp' OR tipoNum = 'Comercial')
);
  
CREATE TABLE tbUsuario(
	idUsuario INT PRIMARY KEY IDENTITY(1,1),
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
	nomeUsuario VARCHAR(45),
    cargo VARCHAR(45),
    email VARCHAR(45),
	cpf VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE tbInfoMaquina(
	idInfoMaquina INT PRIMARY KEY IDENTITY(1,1),
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    hostName VARCHAR(45),
	marcaMaquina VARCHAR(45),
    sistemaOperacional VARCHAR(45),
	alaMaquina VARCHAR(45),
    andarMaquina INT
);

CREATE TABLE tbComponente(
	idComponente INT PRIMARY KEY IDENTITY(1,1),
	nomeComponente VARCHAR(45)
);

CREATE TABLE tbMaquina(
	idMaquina INT PRIMARY KEY IDENTITY(1,1),
	fkInfoMaquina INT,
	FOREIGN KEY (fkInfoMaquina) REFERENCES tbInfoMaquina (idInfoMaquina),
	fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES tbComponente (idComponente),
	valorTotal VARCHAR(45)
);

CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY IDENTITY(1,1),
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES tbMaquina (idMaquina),
    valorRegistro VARCHAR(45),
	momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM INFORMATION_SCHEMA.TABLES;