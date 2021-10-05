/* Моя база данных - схема работы спортивного клуба */

DROP DATABASE if EXISTS sk;
CREATE DATABASE sk;
USE sk;

/* Таблица всех посетителей клуба, включая работников */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	signed_up_at TIMESTAMP DEFAULT now(),
	first_name VARCHAR(100) DEFAULT ' ',
	last_name VARCHAR(100) DEFAULT ' ',
	gender ENUM ('m', 'f', 'nb', 'ud') DEFAULT 'ud',
	date_of_birth DATE,
	phone_number BIGINT UNSIGNED UNIQUE,
	email VARCHAR(100) unique,
	id_sport_section INT NULL
);

/* Таблица персонала: тренеры, масажисты, администраторы */
DROP TABLE IF EXISTS personal;
CREATE TABLE personal (
	user_id SERIAL PRIMARY KEY,
	education VARCHAR(100) DEFAULT ' ',
	sporting_merit VARCHAR(100) DEFAULT ' ',
	date_of_begin_work DATE,
	salary FLOAT NOT null
);

ALTER TABLE `personal` ADD CONSTRAINT sk_user_id
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;

/* Таблица спортивных залов(помещений) */
DROP TABLE IF EXISTS gym;
CREATE TABLE gym (
	id SERIAL PRIMARY KEY,
	title_gym VARCHAR(100) DEFAULT ' ',
	id_respons_per BIGINT UNSIGNED NOT NULL
);
ALTER TABLE `gym` ADD CONSTRAINT pers_user_id
FOREIGN KEY (id_respons_per) REFERENCES personal(user_id) ON UPDATE CASCADE ON DELETE cascade;

/* Таблица спортивного инвентаря */
DROP TABLE IF EXISTS sports_equipment;
CREATE TABLE sports_equipment (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) DEFAULT ' ',
	amount INT NOT null,
	id_gym BIGINT UNSIGNED,
	
	FOREIGN KEY (id_gym) REFERENCES gym(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Таблица услуг помимо спортивных секций*/
DROP TABLE IF EXISTS services;
CREATE TABLE services (
	id SERIAL PRIMARY KEY,
	title_servic VARCHAR(100) DEFAULT ' ',
	id_gym BIGINT UNSIGNED,
	id_personal BIGINT UNSIGNED,
	
	FOREIGN KEY (id_gym) REFERENCES gym(id) ON UPDATE CASCADE ON DELETE cascade,
	FOREIGN KEY (id_personal) REFERENCES personal(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Таблица спортивных секций */
DROP TABLE IF EXISTS sport_section;
CREATE TABLE sport_section (
	id SERIAL PRIMARY KEY,
	title_sport_section VARCHAR(100) DEFAULT ' ',
	price FLOAT NOT null,
	id_gym BIGINT UNSIGNED,
	id_personal BIGINT UNSIGNED,
	
	FOREIGN KEY (id_gym) REFERENCES gym(id) ON UPDATE CASCADE ON DELETE cascade,
	FOREIGN KEY (id_personal) REFERENCES personal(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);
/*ALTER TABLE `users` ADD CONSTRAINT sk_section_id
    FOREIGN KEY (id_sport_section) REFERENCES sport_section(id) ON UPDATE CASCADE ON DELETE CASCADE;*/

/* Таблица спортивного магазина внутри клуба */
DROP TABLE IF EXISTS sport_shop;
CREATE TABLE sport_shop (
	id SERIAL PRIMARY KEY,
	sport_product VARCHAR(100) DEFAULT ' ',
	price FLOAT NOT null,
	id_personal BIGINT UNSIGNED,
	
	FOREIGN KEY (id_personal) REFERENCES personal(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Таблица подготовки спортсменов к соревнованиям */
DROP TABLE IF EXISTS part_in_competitions;
CREATE TABLE part_in_competitions (
	id SERIAL PRIMARY KEY,
	member_user_one_id BIGINT UNSIGNED NOT NULL,
    member_user_two_id BIGINT UNSIGNED NOT NULL,
    member_user_three_id BIGINT UNSIGNED NOT NULL,
	title VARCHAR(100) DEFAULT ' ',
	date_of_competitions DATE,
	id_personal BIGINT UNSIGNED,
	id_gym BIGINT UNSIGNED,
	

	FOREIGN KEY (id_gym) REFERENCES gym(id) ON UPDATE CASCADE ON DELETE cascade,
	FOREIGN KEY (id_personal) REFERENCES personal(user_id) ON UPDATE CASCADE ON DELETE cascade,
	FOREIGN KEY (member_user_one_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (member_user_two_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (member_user_three_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);
