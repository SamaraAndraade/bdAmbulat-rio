--CREATE DATA BASE bdAmbulorio
CREATE TABLE tbPaciente(
    idPaciente INT PRIMARY KEY IDENTITY (102,1)
    ,nome VARCHAR (45)
    ,sexo CHAR (1)
    ,idade INT 
    ,doenca_inicial VARCHAR (50)
);

CREATE TABLE tbDoencas(
    idDoencas INT PRIMARY KEY IDENTITY (1,1)
    ,descricao VARCHAR (50)
);

CREATE TABLE tbAmbulatorio(
    idAmbulatorio INT PRIMARY KEY IDENTITY (1,1)
    ,num VARCHAR (45)
    ,andar INT
    ,capacidade INT 
);    

CREATE TABLE tbEspecialidade(
     idEspecialidade INT PRIMARY KEY IDENTITY (10,10)
    ,descricao VARCHAR (50)
);

CREATE TABLE tbMedico(
    idMedico INT PRIMARY KEY IDENTITY (1,1)
    ,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
    ,nome VARCHAR (45)
    ,crm VARCHAR (45)
    ,salario VARCHAR (45)
    ,idade INT 
    ,idEspecialidade INT FOREIGN KEY REFERENCES tbEspecialidade(idEspecialidade)
);

CREATE TABLE tbFuncionario(
    idFuncionario INT PRIMARY KEY IDENTITY (1,1)
    ,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
    ,nome VARCHAR (45)
    ,idade INT
    ,sexo CHAR (1)
    ,salario FLOAT 
    ,cidade VARCHAR (45)
);

CREATE TABLE tbConsulta(
    idMedico INT FOREIGN KEY REFERENCES tbMedico(idMedico)
    ,idPaciente INT FOREIGN KEY REFERENCES tbPaciente(idPaciente)
    ,dia NVARCHAR  
    ,hora VARCHAR (30)
    ,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
    ,idDoencas INT FOREIGN KEY REFERENCES tbDoencas(idDoencas)
);

--USE bdAmbulatorio
INSERT INTO tbPaciente(nome,sexo,idade,doenca_inicial)
VALUES('Demência Santos','F','20','Gripe')
      ,('Camila da Silva','M','19','Covid 19')
      ,('Bruna Ferreira','F','25','Sarampo')
      ,('Eduardo Gomes','M','32','Dengue')
SELECT * FROM tbPaciente

INSERT INTO tbDoencas(descricao)
VALUES('Acne')
      ,('Alcoolismo Agudo')
      ,('Asma')
SELECT * FROM tbDoencas

INSERT INTO tbAmbulatorio(num,andar,capacidade)
VALUES('2000','12','400')
      ,('1500A','8','300')
      ,('550','1','200')
SELECT * FROM tbAmbulatorio

INSERT INTO tbEspecialidade(descricao)
VALUES('Pediatra')
      ,('Clínico geral')
      ,('Clínico')
SELECT * FROM tbEspecialidade

INSERT INTO tbMedico(nome,crm,salario,idade,idAmbulatorio,idEspecialidade)
VALUES('Dr. Carlos Jobim','52-71557-3','12000','50','1','10')
      ,('Dr. André Firmino','50-12345-6','22000,57','63','2','20')
      ,('Dra. Ana Maria','10-20201-5','40000,61','42','3','30')
SELECT * FROM tbMedico

INSERT INTO tbFuncionario(nome,idade,sexo,salario,cidade,idAmbulatorio,idEspecialidade)
VALUES('Fernanda Fernandes','34','F','2000','São Paulo','1','10')
      ,('Bruna Souza','25','F','1700','Guarulho','2','20')
      ,('Jessica Filho','20','F','3000','Sorocaba','3','30')
      ,('Leandro Leonardo','27','M','2500','São Paulo','4','40')
SELECT * FROM tbFuncionario

INSERT INTO tbConsulta(dia,hora)
VALUES('01/02/2020','12h00')
      ,('25/03/2018','11:30')
      ,('30/04/2019','16:25')
      ,('05/05/2025','17:05')
SELECT * FROM tbConsulta