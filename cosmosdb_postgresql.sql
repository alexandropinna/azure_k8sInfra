-- Crear la base de datos
CREATE DATABASE mi_base_de_datos;

-- Usar la base de datos creada
\c mi_base_de_datos;

-- Crear una tabla simple
CREATE TABLE personas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    ciudad VARCHAR(100)
);

-- Insertar algunos registros en la tabla
INSERT INTO personas (nombre, edad, ciudad) VALUES ('Juan Pérez', 30, 'Madrid');
INSERT INTO personas (nombre, edad, ciudad) VALUES ('Ana García', 25, 'Barcelona');
INSERT INTO personas (nombre, edad, ciudad) VALUES ('Carlos Rodríguez', 35, 'Sevilla');
