CREATE DATABASE HSO;
USE HSO;

CREATE TABLE tbHospital(
	idHospital INT PRIMARY KEY,
	nomeHospital VARCHAR(45),
	nomeDiretor VARCHAR(45)
);

CREATE TABLE tbFilialHospital(
	idFilial INT PRIMARY KEY,
    fkHospital INT,
    FOREIGN KEY (fkHospital) REFERENCES tbHospital (idHospital),
    cepFilial INT,
    numeroEndFilial VARCHAR(45)
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
	nome VARCHAR(45),
	cpf VARCHAR(45),
	email VARCHAR(45),
    senha VARCHAR(45),
	cargo VARCHAR(45)
);

CREATE TABLE tbMaquina(
	idMaquina INT PRIMARY KEY,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
	marcaMaquina VARCHAR(45),
	alaMaquina VARCHAR(45),
    andarMaquina INT,
	numeroSerie VARCHAR(45),
	sistemaOperacional VARCHAR(45)
);

CREATE TABLE tbComponente(
	idComponente INT PRIMARY KEY,
	nomeComponente VARCHAR(45)
);

CREATE TABLE tbPacote(
	fkMaquinaPacote INT,
	FOREIGN KEY (fkMaquinaPacote) REFERENCES tbMaquina (idMaquina),
	fkComponentePacote INT,
    FOREIGN KEY (fkComponentePacote) REFERENCES tbComponente (idComponente),
	precoPacote VARCHAR(45),
	PRIMARY KEY (fkMaquinaPacote, fkComponentePacote)
);

CREATE TABLE tbRegistros(
	idRegistros INT PRIMARY KEY,
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES tbMaquina (idMaquina),
    valorCPU VARCHAR(45),
    valorMemoria VARCHAR(45),
    valorDisco VARCHAR(45),
	momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);