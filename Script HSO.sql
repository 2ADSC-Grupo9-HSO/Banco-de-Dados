CREATE DATABASE HSO;
USE HSO;

CREATE TABLE tbRedeHospitalar(
	idRede INT PRIMARY KEY,
	nomeRede VARCHAR(45)
);

CREATE TABLE tbFilialHospital(
	idFilial INT PRIMARY KEY,
    fkRede INT,
    FOREIGN KEY (fkRede) REFERENCES tbRedeHospitalar (idRede),
    cepFilial INT,
    numeroEndFilial VARCHAR(45),
    cnpjFilial VARCHAR(45),
    senhaFilial VARCHAR(45)
);
    
CREATE TABLE tbTelefoneHospital(
	idTelefone INT PRIMARY KEY,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    numeroTelefone VARCHAR(45),
    tipoNum VARCHAR(9),
    CHECK (tipoNum = 'Fixo' OR tipoNum = 'Celular' OR tipoNum = 'Whatsapp' OR tipoNum = 'Comercial')
);
  
CREATE TABLE tbUsuario(
	idUsuario INT PRIMARY KEY,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
	nomeUsuario VARCHAR(45),
	cpf VARCHAR(45),
	email VARCHAR(45),
    senha VARCHAR(45),
	cargo VARCHAR(45)
);

CREATE TABLE tbMaquina(
	idMaquina INT PRIMARY KEY,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    hostName VARCHAR(45),
	marcaMaquina VARCHAR(45),
	alaMaquina VARCHAR(45),
    andarMaquina INT,
	sistemaOperacional VARCHAR(45),
    senhaMaquina VARCHAR(45)
);

CREATE TABLE tbComponente(
	idComponente INT PRIMARY KEY,
	nomeComponente VARCHAR(45)
);

CREATE TABLE tbPacote(
	idPacote INT PRIMARY KEY,
	fkMaquina INT,
	FOREIGN KEY (fkMaquina) REFERENCES tbMaquina (idMaquina),
	fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES tbComponente (idComponente),
	valorTotal VARCHAR(45)
);

CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY,
    fkPacote INT,
    FOREIGN KEY (fkPacote) REFERENCES tbPacote (idPacote),
    valorRegistro VARCHAR(45),
	momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);