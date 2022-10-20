CREATE DATABASE BanksDB
CREATE TABLE social_statuses(
	social_status_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	type VARCHAR(25)
);

CREATE TABLE banks(
	bank_id INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	bank_name VARCHAR(25)
);

CREATE TABLE accounts(
	account_id INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	account_number VARCHAR(25),
	balance REAL
);

CREATE TABLE clients(
	client_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	bank_id INT  NOT NULL,
	account_id INT NOT NULL UNIQUE,
	social_status_id INT  NOT NULL,
	first_name  VARCHAR(25),
	last_name  VARCHAR(25),
	patronymic  VARCHAR(25),
	birth_date DATE,

	CONSTRAINT FK_Clients_To_Accounts FOREIGN KEY (account_id) REFERENCES accounts (account_id),
	CONSTRAINT FK_Clients_To_Banks FOREIGN KEY (bank_id) REFERENCES banks (bank_id),
	CONSTRAINT FK_Clients_To_Social_Statuses FOREIGN KEY (social_status_id) REFERENCES social_statuses (social_status_id)
);

CREATE TABLE cards(
	card_id INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	account_id INT NOT NULL,
	card_number INT,
	validity_period DATE,
    balance REAL
	CONSTRAINT FK_Cards_To_Accounts FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

CREATE TABLE cities(
	city_id INT IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	city_name VARCHAR(25)
);

CREATE TABLE branches(
	branch_id INT IDENTITY(1,1)   PRIMARY KEY NOT NULL,
	bank_id INT NOT NULL,
	phone_number VARCHAR(25),
	address VARCHAR(50),
	CONSTRAINT FK_Branches_To_Banks FOREIGN KEY (bank_id) REFERENCES banks (bank_id)
);

CREATE TABLE branch_city(
	branch_city_id INT IDENTITY(1,1) PRIMARY KEY ,
	branch_id INT NOT NULL,
	city_id INT NOT NULL,
	CONSTRAINT FK_Branches_Cities_To_Cities FOREIGN KEY (city_id) REFERENCES cities (city_id),
	CONSTRAINT FK_Branches_Cities_To_Branches FOREIGN KEY (branch_id) REFERENCES branches (branch_id)


);

SET IDENTITY_INSERT banks ON
INSERT banks(bank_id, bank_name) VALUES (1,'Беларусбанк')
INSERT banks(bank_id, bank_name) VALUES (2,'Сбербанк')
INSERT banks(bank_id, bank_name) VALUES (3,'Белинвестбанк')
INSERT banks(bank_id, bank_name) VALUES (4, 'Паритетбанк')
INSERT banks(bank_id, bank_name) VALUES (5, 'Альфабанк')
SET IDENTITY_INSERT banks OFF

SET IDENTITY_INSERT social_statuses ON
INSERT social_statuses(social_status_id,type) VALUES(1,'ветеран')
INSERT social_statuses(social_status_id,type) VALUES(2,'инвалид')
INSERT social_statuses(social_status_id,type) VALUES(3,'малоимущий')
INSERT social_statuses(social_status_id,type) VALUES(4,'пенсионер')
INSERT social_statuses(social_status_id,type) VALUES(5,'многодетная семья')
SET IDENTITY_INSERT social_statuses OFF

SET IDENTITY_INSERT accounts ON
INSERT accounts(account_id, account_number, balance) VALUES (1,'231428BS0293JG',653.4)
INSERT accounts(account_id, account_number,balance) VALUES (2,'90H747222098JG',87.3)
INSERT accounts(account_id, account_number,balance) VALUES (3,'2GT648294J284E',254.3)
INSERT accounts(account_id, account_number,balance) VALUES (4,'17HF593J2S3894',554.1)
INSERT accounts(account_id,account_number,balance) VALUES (5,'1L0384H22B2285',345.5)
INSERT accounts(account_id,account_number,balance) VALUES (6,'0846543JHG2285',1294.5)
SET IDENTITY_INSERT accounts OFF

SET IDENTITY_INSERT clients ON
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (1,1,1,1,'Илья','Зыков','Андреевич','1955-10-12') 
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (2,2,2,2,'Марина','Кравчукова','Олеговна', '1954-10-17')
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (3,3,3,3,'Алексей','Скворцов','Дмитриевич', '1960-03-05')
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (4,4,4,4,'Дмитрий','Зарубов','Николаевич', '1972-08-25')
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (5,5,5,5,'Анна','Алексейчук','Вадимовна', '1962-06-02')
INSERT clients(client_id,account_id, bank_id, social_status_id, first_name,last_name, patronymic, birth_date) VALUES (6,6,1,3,'Яна','Манько','Кирилловна', '1962-05-22')
SET IDENTITY_INSERT clients OFF


SET IDENTITY_INSERT cards ON
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(1,1,653.4,46291048,'2027-11-10')
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(2,2,87.3, 18374656,'2025-12-04')
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(3,3,178.3,74113972,'2026-05-12')
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(4,4,554.1,12749274,'2027-03-03')
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(5,5,950.9,11838901,'2030-05-02')

INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(6,6,120.9,11838901,'2022-05-04')
INSERT cards(card_id,account_id,balance,card_number,validity_period) VALUES(7,6,450.1,11838901,'2035-07-02')

SET IDENTITY_INSERT cards OFF

SET IDENTITY_INSERT cities ON
INSERT cities(city_id,city_name) VALUES (1,'Минск')
INSERT cities(city_id,city_name) VALUES (2,'Минск')
INSERT cities(city_id,city_name) VALUES (3,'Брест')
INSERT cities(city_id,city_name) VALUES (4,'Гомель')
INSERT cities(city_id,city_name) VALUES (5,'Могилев')
SET IDENTITY_INSERT cities OFF

SET IDENTITY_INSERT branches ON
INSERT branches(branch_id, bank_id, phone_number,address) VALUES (1,1,'+375(29)333-12-05','ул. Якуба Коласа 17')
INSERT branches(branch_id, bank_id, phone_number,address) VALUES (2,2,'+375(44)233-02-25','ул. Октябрьская 25а')
INSERT branches(branch_id, bank_id, phone_number,address) VALUES (3,3,'+375(29)139-55-66','ул. Фрунзенская 16')
INSERT branches(branch_id, bank_id, phone_number,address) VALUES (4,4,'+375(44)234-43-16','ул. Академическая 35')
INSERT branches(branch_id, bank_id, phone_number,address) VALUES (5,5,'+375(29)233-54-79','ул. Площадь Ленина 78')
SET IDENTITY_INSERT branches OFF

INSERT branch_city(branch_id,city_id) VALUES (1,1)
INSERT branch_city(branch_id,city_id) VALUES (2,2)
INSERT branch_city(branch_id,city_id) VALUES (3,3)
INSERT branch_city(branch_id,city_id) VALUES (4,4)
INSERT branch_city(branch_id,city_id) VALUES (5,5)