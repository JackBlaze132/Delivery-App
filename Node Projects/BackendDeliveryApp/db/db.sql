DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(180) NOT NULL,
    image VARCHAR(255) NULL,
	route VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

INSERT INTO roles(
	name,
	route,
	created_at,
	updated_at
)
Values(
	'CLIENTE',
	'client/products/list',
	'2021-05-22',
	'2021-05-22'
);

INSERT INTO roles(
	name,
	route,
	created_at,
	updated_at
)
Values(
	'RESTAURANTE',
	'restaurant/orders/list',
	'2021-05-22',
	'2021-05-22'
);

INSERT INTO roles(
	name,
	route,
	created_at,
	updated_at
)
Values(
	'REPARTIDOR',
	'delivery/orders/list',
	'2021-05-22',
	'2021-05-22'
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS users_has_roles CASCADE;
CREATE TABLE users_has_roles(
	id_user BIGSERIAL NOT NULL,
	id_rol BIGSERIAL NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_rol) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(id_user,id_rol)
);