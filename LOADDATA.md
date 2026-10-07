LOAD DATA LOCAL INFILE "C:/Users/ETSISI/Downloads/agbdp1-main/agbdp1-main/Datos/Clientes.csv"
INTO TABLE clientes
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(
    @ClienteID,
    DNI,
    Nombre,
    Apellidos,
    Genero,
    Direccion,
    Localidad,
    Provincia,
    CodPostal,
    Telefono,
    @Canal,
    @FechaNacimiento,
    @FechaContacto,
    @Email
)
SET
    ClienteID = CAST(REGEXP_REPLACE(@ClienteID,'[^0-9]','') AS UNSIGNED),
    Canal = NULLIF(@Canal,''),
    FechaNacimiento = IF(@FechaNacimiento='', NULL, STR_TO_DATE(@FechaNacimiento,'%d/%m/%Y')),
    FechaContacto = IF(@FechaContacto='', NULL, STR_TO_DATE(@FechaContacto,'%d/%m/%Y')),
    Email = LOWER(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                @Email, 'ñ', 'n'),
                        'á','a'),
                    'é','e'),
                'í','i'),
            'ó','o'),
        'ú','u')
    );






LOAD DATA LOCAL INFILE "C:/Users/ETSISI/Downloads/agbdp1-main/agbdp1-main/Datos/Clientes_Juegos.csv"
INTO TABLE clientes_juegos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    @ClienteID,
    @JuegoID,
    @FechaAlquiler,
    @Comentarios
)
SET
    ClienteID = NULLIF(TRIM(@ClienteID), ''),
    JuegoID = NULLIF(TRIM(@JuegoID), ''),
    FechaAlquiler = IF(@FechaNAlquiler='', NULL, STR_TO_DATE(@FechaAlquiler,'%d/%m/%Y')),
    Comentarios = LEFT(
        NULLIF(TRIM(TRAILING '\r' FROM @Comentarios), ''),
        500
    );