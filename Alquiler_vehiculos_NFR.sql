-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2022-02-16 23:03:15 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012

DROP DATABASE IF EXISTS Alquiler_vehiculos_NFR
GO
CREATE DATABASE Alquiler_vehiculos_NFR
GO
USE Alquiler_vehiculos_NFR
GO

CREATE TABLE Cia_Seguro 
    (
     Id_aseguradora INTEGER NOT NULL , 
     Nombre_cia VARCHAR (20) , 
     Telefono VARCHAR (20) , 
     Direccion VARCHAR (40) , 
     Precio MONEY , 
     Seguro_Vehiculo_Id_seguro INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Cia_Seguro__IDX ON Cia_Seguro 
    ( 
     Seguro_Vehiculo_Id_seguro 
    ) 
GO

ALTER TABLE Cia_Seguro ADD CONSTRAINT Cia_Seguro_PK PRIMARY KEY CLUSTERED (Id_aseguradora)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Cliente 
    (
     Id_Cliente INTEGER NOT NULL , 
     Nombre VARCHAR (25) , 
     Apellido1 VARCHAR (30) , 
     Apellido2 VARCHAR (25) , 
     Fecha_nacimiento DATETIME NOT NULL , 
     DNI INTEGER NOT NULL , 
     Fecha_carnet DATETIME NOT NULL 
    )
GO

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY CLUSTERED (Id_Cliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Empleado 
    (
     Id_Empleado INTEGER NOT NULL , 
     Nombre VARCHAR (20) , 
     Apellido1 VARCHAR (20) , 
     Apellido2 VARCHAR (20) , 
     Cod_SS VARCHAR (20) , 
     Telefono VARCHAR (20) , 
     Oficina_Id_Oficina INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Empleado__IDX ON Empleado 
    ( 
     Oficina_Id_Oficina 
    ) 
GO

ALTER TABLE Empleado ADD CONSTRAINT Empleado_PK PRIMARY KEY CLUSTERED (Id_Empleado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Equipamiento_Extra 
    (
     Id_equipamiento INTEGER NOT NULL , 
     GPS BIT , 
     Velocidad_crucero BIT , 
     Automatico BIT 
    )
GO

ALTER TABLE Equipamiento_Extra ADD CONSTRAINT Equipamiento_Extra_PK PRIMARY KEY CLUSTERED (Id_equipamiento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Fianza 
    (
     ID_Fianza INTEGER NOT NULL , 
     Cantidad MONEY NOT NULL , 
     Concepto VARCHAR (25) , 
     Forma_Pago_Id_pago INTEGER NOT NULL 
    )
GO

ALTER TABLE Fianza ADD CONSTRAINT Fianza_PK PRIMARY KEY CLUSTERED (ID_Fianza)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Forma_Pago 
    (
     Id_pago INTEGER NOT NULL , 
     Tipo VARCHAR (25) NOT NULL 
    )
GO

ALTER TABLE Forma_Pago ADD CONSTRAINT Forma_Pago_PK PRIMARY KEY CLUSTERED (Id_pago)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Marca 
    (
     Id_Marca INTEGER NOT NULL , 
     Nombre VARCHAR (20) 
    )
GO

ALTER TABLE Marca ADD CONSTRAINT Marca_PK PRIMARY KEY CLUSTERED (Id_Marca)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Modelo 
    (
     Id_Modelo INTEGER NOT NULL , 
     nombre VARCHAR (20) , 
     ano_fabricacion INTEGER , 
     Marca_Id_Marca INTEGER NOT NULL 
    )
GO

ALTER TABLE Modelo ADD CONSTRAINT Modelo_PK PRIMARY KEY CLUSTERED (Id_Modelo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Oficina 
    (
     Id_Oficina INTEGER NOT NULL , 
     Nombre_Oficina VARCHAR (25) , 
     Cliente_Id_Cliente INTEGER NOT NULL , 
     Empleado_Id_Empleado INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Oficina__IDX ON Oficina 
    ( 
     Empleado_Id_Empleado 
    ) 
GO

ALTER TABLE Oficina ADD CONSTRAINT Oficina_PK PRIMARY KEY CLUSTERED (Id_Oficina)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Paypal 
    (
     Id_paypal INTEGER NOT NULL , 
     usuario VARCHAR (20) , 
     email VARCHAR (25) NOT NULL , 
     Forma_Pago_Id_pago INTEGER NOT NULL 
    )
GO

ALTER TABLE Paypal ADD CONSTRAINT Paypal_PK PRIMARY KEY CLUSTERED (Id_paypal)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Reserva 
    (
     Id_Reserva INTEGER NOT NULL , 
     Oficina_Id_Oficina INTEGER NOT NULL , 
     Fianza_ID_Fianza INTEGER NOT NULL 
    )
GO

ALTER TABLE Reserva ADD CONSTRAINT Reserva_PK PRIMARY KEY CLUSTERED (Id_Reserva)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Seguro_Vehiculo 
    (
     Id_seguro INTEGER NOT NULL , 
     Ref_seguro INTEGER NOT NULL , 
     Cia_Seguro_Id_aseguradora INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    Seguro_Vehiculo__IDX ON Seguro_Vehiculo 
    ( 
     Cia_Seguro_Id_aseguradora 
    ) 
GO

ALTER TABLE Seguro_Vehiculo ADD CONSTRAINT Seguro_Vehiculo_PK PRIMARY KEY CLUSTERED (Id_seguro)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tarjeta 
    (
     Num_Tarjeta INTEGER NOT NULL , 
     Nombre_Tarjeta VARCHAR (25) , 
     Fecha_Caducidad DATE , 
     CVV INTEGER , 
     Forma_Pago_Id_pago INTEGER NOT NULL 
    )
GO

ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_PK PRIMARY KEY CLUSTERED (Num_Tarjeta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Transferencia 
    (
     Id_transferencia INTEGER NOT NULL , 
     Num_cta INTEGER , 
     Nombre_banco VARCHAR (25) NOT NULL , 
     Forma_Pago_Id_pago INTEGER NOT NULL 
    )
GO

ALTER TABLE Transferencia ADD CONSTRAINT Transferencia_PK PRIMARY KEY CLUSTERED (Id_transferencia)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Vehiculo 
    (
     Id_Vehiculo INTEGER NOT NULL , 
     Matricula VARCHAR (20) , 
     Marca VARCHAR (20) , 
     Modelo VARCHAR (20) , 
     Combustible VARCHAR (15) , 
     Kilometros INTEGER , 
     Num_puertas INTEGER , 
     Equipamiento_Extra_Id_equipamiento INTEGER NOT NULL , 
     Modelo_Id_Modelo INTEGER NOT NULL , 
     Reserva_Id_Reserva INTEGER NOT NULL , 
     Seguro_Vehiculo_Id_seguro INTEGER NOT NULL , 
     Reserva_Id_Reserva1 INTEGER NOT NULL 
    )
GO

ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_PK PRIMARY KEY CLUSTERED (Id_Vehiculo, Reserva_Id_Reserva)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Cia_Seguro 
    ADD CONSTRAINT Cia_Seguro_Seguro_Vehiculo_FK FOREIGN KEY 
    ( 
     Seguro_Vehiculo_Id_seguro
    ) 
    REFERENCES Seguro_Vehiculo 
    ( 
     Id_seguro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Empleado 
    ADD CONSTRAINT Empleado_Oficina_FK FOREIGN KEY 
    ( 
     Oficina_Id_Oficina
    ) 
    REFERENCES Oficina 
    ( 
     Id_Oficina 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Fianza 
    ADD CONSTRAINT Fianza_Forma_Pago_FK FOREIGN KEY 
    ( 
     Forma_Pago_Id_pago
    ) 
    REFERENCES Forma_Pago 
    ( 
     Id_pago 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Modelo 
    ADD CONSTRAINT Modelo_Marca_FK FOREIGN KEY 
    ( 
     Marca_Id_Marca
    ) 
    REFERENCES Marca 
    ( 
     Id_Marca 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Oficina 
    ADD CONSTRAINT Oficina_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_Id_Cliente
    ) 
    REFERENCES Cliente 
    ( 
     Id_Cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Oficina 
    ADD CONSTRAINT Oficina_Empleado_FK FOREIGN KEY 
    ( 
     Empleado_Id_Empleado
    ) 
    REFERENCES Empleado 
    ( 
     Id_Empleado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Paypal 
    ADD CONSTRAINT Paypal_Forma_Pago_FK FOREIGN KEY 
    ( 
     Forma_Pago_Id_pago
    ) 
    REFERENCES Forma_Pago 
    ( 
     Id_pago 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Reserva 
    ADD CONSTRAINT Reserva_Fianza_FK FOREIGN KEY 
    ( 
     Fianza_ID_Fianza
    ) 
    REFERENCES Fianza 
    ( 
     ID_Fianza 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Reserva 
    ADD CONSTRAINT Reserva_Oficina_FK FOREIGN KEY 
    ( 
     Oficina_Id_Oficina
    ) 
    REFERENCES Oficina 
    ( 
     Id_Oficina 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Seguro_Vehiculo 
    ADD CONSTRAINT Seguro_Vehiculo_Cia_Seguro_FK FOREIGN KEY 
    ( 
     Cia_Seguro_Id_aseguradora
    ) 
    REFERENCES Cia_Seguro 
    ( 
     Id_aseguradora 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Tarjeta 
    ADD CONSTRAINT Tarjeta_Forma_Pago_FK FOREIGN KEY 
    ( 
     Forma_Pago_Id_pago
    ) 
    REFERENCES Forma_Pago 
    ( 
     Id_pago 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Transferencia 
    ADD CONSTRAINT Transferencia_Forma_Pago_FK FOREIGN KEY 
    ( 
     Forma_Pago_Id_pago
    ) 
    REFERENCES Forma_Pago 
    ( 
     Id_pago 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo 
    ADD CONSTRAINT Vehiculo_Equipamiento_Extra_FK FOREIGN KEY 
    ( 
     Equipamiento_Extra_Id_equipamiento
    ) 
    REFERENCES Equipamiento_Extra 
    ( 
     Id_equipamiento 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo 
    ADD CONSTRAINT Vehiculo_Modelo_FK FOREIGN KEY 
    ( 
     Modelo_Id_Modelo
    ) 
    REFERENCES Modelo 
    ( 
     Id_Modelo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo 
    ADD CONSTRAINT Vehiculo_Reserva_FK FOREIGN KEY 
    ( 
     Reserva_Id_Reserva
    ) 
    REFERENCES Reserva 
    ( 
     Id_Reserva 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo 
    ADD CONSTRAINT Vehiculo_Reserva_FKv1 FOREIGN KEY 
    ( 
     Reserva_Id_Reserva1
    ) 
    REFERENCES Reserva 
    ( 
     Id_Reserva 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehiculo 
    ADD CONSTRAINT Vehiculo_Seguro_Vehiculo_FK FOREIGN KEY 
    ( 
     Seguro_Vehiculo_Id_seguro
    ) 
    REFERENCES Seguro_Vehiculo 
    ( 
     Id_seguro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             4
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
