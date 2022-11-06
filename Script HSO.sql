CREATE DATABASE HSO;
USE HSO;

CREATE TABLE tbRedeHospitalar(
	idRede INT PRIMARY KEY AUTO_INCREMENT,
	nomeRede VARCHAR(45),
    emailRede VARCHAR(45),
    senhaRede VARCHAR(45)
);

CREATE TABLE tbFilialHospital(
	idFilial INT PRIMARY KEY AUTO_INCREMENT,
    fkRede INT,
    FOREIGN KEY (fkRede) REFERENCES tbRedeHospitalar (idRede),
    cepFilial CHAR(8),
    numeroEndFilial VARCHAR(45),
    complementoEnd VARCHAR(45),
    cnpjFilial CHAR(14),
    senhaFilial VARCHAR(45),
    emailFilial VARCHAR(45)
);
    
CREATE TABLE tbTelefoneHospital(
	idTelefone INT PRIMARY KEY AUTO_INCREMENT,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    numeroTelefone VARCHAR(45),
    tipoNum VARCHAR(9),
    CHECK (tipoNum = 'Fixo' OR tipoNum = 'Celular' OR tipoNum = 'Whatsapp' OR tipoNum = 'Comercial')
);
  
CREATE TABLE tbUsuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
	nomeUsuario VARCHAR(45),
    cargo VARCHAR(45),
    email VARCHAR(45),
	cpf CHAR(11),
    senha VARCHAR(45)
);

CREATE TABLE tbMaquina(
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    hostName VARCHAR(45),
	marcaMaquina VARCHAR(45),
    sistemaOperacional VARCHAR(45),
    andarMaquina INT,
    senhaMaquina VARCHAR(45)
);

CREATE TABLE tbComponente(
	idComponente INT PRIMARY KEY AUTO_INCREMENT,
	nomeComponente VARCHAR(45)
);

CREATE TABLE tbHardware(
	idHardware INT PRIMARY KEY AUTO_INCREMENT,
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES tbMaquina (idMaquina),
	fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES tbComponente (idComponente),
	valorTotal DECIMAL(6,2)
);

CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY AUTO_INCREMENT,
    fkHardware INT,
    FOREIGN KEY (fkHardware) REFERENCES tbHardware (idHardware),
    valorRegistro DECIMAL(5,2),
	momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tbComponente (nomeComponente)
VALUES
('Processador'),
('Memória Ram'),
('Disco');