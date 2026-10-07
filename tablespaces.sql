USE pracabd1;

CREATE TABLESPACE TBSP_Clientes
	ADD datafile  'DF_Clientes.ibd'
    ENGINE = InnoDB;

CREATE TABLESPACE TBSP_Juegos
	ADD datafile  'DF_Juegos.ibd'
    ENGINE = InnoDB;

CREATE TABLESPACE TBSP_ClientesJuegos
	ADD datafile  'DF_ClientesJuegos.ibd'
    ENGINE = InnoDB;