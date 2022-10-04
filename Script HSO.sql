CREATE DATABASE HSO;
USE HSO;

CREATE TABLE tbRedeHospitalar(
	idRede INT PRIMARY KEY AUTO_INCREMENT,
	nomeRede VARCHAR(45)
);

insert into tbRedeHospitalar 
values (null, 'plena');


CREATE TABLE tbFilialHospital(
	idFilial INT PRIMARY KEY AUTO_INCREMENT,
    fkRede INT,
    FOREIGN KEY (fkRede) REFERENCES tbRedeHospitalar (idRede),
    cepFilial INT,
    numeroEndFilial VARCHAR(45),
    complementoEnd VARCHAR(45),
    cnpjFilial VARCHAR(45),
    senhaFilial VARCHAR(45)
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
	cpf VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE tbInfoMaquina(
	idInfoMaquina INT PRIMARY KEY AUTO_INCREMENT,
	fkFilial INT,
    FOREIGN KEY (fkFilial) REFERENCES tbFilialHospital (idFilial),
    hostName VARCHAR(45),
	marcaMaquina VARCHAR(45),
    sistemaOperacional VARCHAR(45),
	alaMaquina VARCHAR(45),
    andarMaquina INT
);

CREATE TABLE tbComponente(
	idComponente INT PRIMARY KEY AUTO_INCREMENT,
	nomeComponente VARCHAR(45)
);

CREATE TABLE tbMaquina(
	idMaquina INT PRIMARY KEY AUTO_INCREMENT,
	fkInfoMaquina INT,
	FOREIGN KEY (fkInfoMaquina) REFERENCES tbInfoMaquina (idInfoMaquina),
	fkComponente INT,
    FOREIGN KEY (fkComponente) REFERENCES tbComponente (idComponente),
	valorTotal VARCHAR(45)
);

CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY AUTO_INCREMENT,
    fkMaquina INT,
    FOREIGN KEY (fkMaquina) REFERENCES tbMaquina (idMaquina),
    valorRegistro VARCHAR(45),
	momentoRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

select idRede, nomeRede, idFilial, cnpjFilial
from tbFilialHospital
join tbRedeHospitalar
on idRede = fkRede
WHERE cnpjFilial = '12345678901234' AND senhaFilial = '1';

select fkFilial, nomeUsuario from tbUsuario where  senha = '12' and cpf = '11111111111';

select idRede, nomeRede, idFilial
    from tbFilialHospital
    join tbRedeHospitalar
    on idRede = fkRede
    WHERE cnpjFilial = '11111111111' AND senhaFilial = '12';

SELECT * FROM tbRedeHospitalar;
SELECT * FROM tbFilialHospital;
SELECT * FROM tbTelefoneHospital;
SELECT * FROM tbUsuario;
SELECT * FROM tbInfoMaquina;
SELECT * FROM tbComponente;
SELECT * FROM tbMaquina;
SELECT * FROM tbHistorico;