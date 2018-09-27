-- PUNTO1
-- Ceación de Data File "quiz_noche" con 10M
create tablespace quiz_noche datafile
    'quiz_nochedt1' size 10M,
    'quiz_nochedt2' size 10M;

--PUNTO 2
-- Creación de perfiles
create profile estudiante limit
    IDLE_TIME 5;
    

--PUNTO 3
-- Creación de los usuarios
CREATE user user1 
    IDENTIFIED by user1 
        default tablespace quiz_noche
            quota unlimited on quiz_noche;
            
GRANT CONNECT to user1;
ALTER USER user1 PROFILE estudiante;
GRANT CREATE TABLE TO user1;
grant select on user1.attacks to user2;

-- PUNTO 4
CREATE user user2 
    IDENTIFIED by user2 
        default tablespace quiz_noche
            quota unlimited on quiz_noche;
            
GRANT CONNECT to user2;
ALTER USER user2 PROFILE estudiante; 
-- al creear éste perfil y no darle permisos de create, el usuario no prodrá crear tablas

-- PARTE 2


-- PUNTO 1
create table attacks (
	id INT,
	url VARCHAR(2048),
	ip_address VARCHAR(20),
	number_of_attacks INT,
	time_of_last_attack TIMESTAMP
);

-- PUNTO 2 Y PUNTO 3, ya se importaron los datos


-- PARTE 3

create table attacks (
	id INT,
	url VARCHAR(2048),
	ip_address VARCHAR(20),
	number_of_attacks INT,
	time_of_last_attack TIMESTAMP
);

select * from attacks;

select * from attacks where
    number_of_attacks > 0 and url like 'http%';
    

select * from attacks
    where url like '%google.com%'
    order by desc number_of_attacks;

