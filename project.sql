BEGIN
  FOR c IN ( SELECT table_name FROM user_tables)
  LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || c.table_name || ' CASCADE CONSTRAINTS' ;
  END LOOP;
END;
 
/

BEGIN
  FOR c IN ( SELECT sequence_name FROM user_sequences WHERE sequence_name NOT LIKE '%$%')
  LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || c.sequence_name;
  END LOOP;
END;

/

-- tables
-- Table: Album
CREATE TABLE Album (
    idAlbum integer  NOT NULL,
    nameAlbum varchar2(100)  NOT NULL,
    productionDate date  NOT NULL,
    priceAlbum integer  NOT NULL,
    idEdition integer  NOT NULL,
    idMusician integer  NOT NULL,
    CONSTRAINT Album_pk PRIMARY KEY (idAlbum)
) ;

-- Table: Availability
CREATE TABLE Availability (
    idAvailability integer  NOT NULL,
    discount integer  NOT NULL,
    idShop integer  NOT NULL,
    idAlbum integer  NOT NULL,
    CONSTRAINT Availability_pk PRIMARY KEY (idAvailability)
) ;

-- Table: Buying
CREATE TABLE Buying (
    idBuying integer  NOT NULL,
    buyingDate date  NOT NULL,
    idAvailability integer  NOT NULL,
    idCustomer integer  NOT NULL,
    CONSTRAINT Buying_pk PRIMARY KEY (idBuying)
) ;

-- Table: Customer
CREATE TABLE Customer (
    idCustomer integer  NOT NULL,
    customerName varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    phoneNumber float(10)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (idCustomer)
) ;

-- Table: Edition
CREATE TABLE Edition (
    idEdition integer  NOT NULL,
    nameEdition varchar2(20)  NOT NULL,
    CONSTRAINT Edition_pk PRIMARY KEY (idEdition)
) ;

-- Table: Musician
CREATE TABLE Musician (
    idMusician integer  NOT NULL,
    nameMusician varchar2(50)  NOT NULL,
    CONSTRAINT Musician_pk PRIMARY KEY (idMusician)
) ;

-- Table: Production
CREATE TABLE Production (
    idFactory integer  NOT NULL,
    factoryName varchar2(30)  NOT NULL,
    idAlbum integer  NOT NULL,
    CONSTRAINT Production_pk PRIMARY KEY (idFactory)
) ;

-- Table: Shop
CREATE TABLE Shop (
    idShop integer  NOT NULL,
    address varchar2(100)  NOT NULL,
    CONSTRAINT Shop_pk PRIMARY KEY (idShop)
) ;

-- foreign keys
-- Reference: Album_Edition (table: Album)
ALTER TABLE Album ADD CONSTRAINT Album_Edition
    FOREIGN KEY (idEdition)
    REFERENCES Edition (idEdition);

-- Reference: Album_Musician (table: Album)
ALTER TABLE Album ADD CONSTRAINT Album_Musician
    FOREIGN KEY (idMusician)
    REFERENCES Musician (idMusician);

-- Reference: Buying_Availability (table: Buying)
ALTER TABLE Buying ADD CONSTRAINT Buying_Availability
    FOREIGN KEY (idAvailability)
    REFERENCES Availability (idAvailability);

-- Reference: Buying_Customer (table: Buying)
ALTER TABLE Buying ADD CONSTRAINT Buying_Customer
    FOREIGN KEY (idCustomer)
    REFERENCES Customer (idCustomer);

-- Reference: ProductionCountry_Album (table: Production)
ALTER TABLE Production ADD CONSTRAINT ProductionCountry_Album
    FOREIGN KEY (idAlbum)
    REFERENCES Album (idAlbum);

-- Reference: Table_15_Album (table: Availability)
ALTER TABLE Availability ADD CONSTRAINT Table_15_Album
    FOREIGN KEY (idAlbum)
    REFERENCES Album (idAlbum);

-- Reference: Table_15_Shop (table: Availability)
ALTER TABLE Availability ADD CONSTRAINT Table_15_Shop
    FOREIGN KEY (idShop)
    REFERENCES Shop (idShop);

-- End of file.

--creating sequence about shops
CREATE SEQUENCE shop_seq
START WITH 1
INCREMENT BY 1;

--execute the line below a few times to see how sequence works
--SELECT shop_seq.nextval FROM dual;

INSERT INTO Shop(idShop, address)
VALUES (shop_seq.nextval, 'Warsaw, ArcadiaMall');
INSERT INTO Shop(idShop, address)
VALUES (shop_seq.nextval, 'Krakow, Galeria Krakowska');
INSERT INTO Shop(idShop, address)
VALUES (shop_seq.nextval, 'Kiev, OceanPlaza');

--creating sequence about costumers
CREATE SEQUENCE customer_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'John', 'Smith', '1234567890');
INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'Jack', 'Yalom', '1357990863');
INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'Michael', 'London', '2468095735');
INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'Philip', 'Martin', '5395820164');
INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'Loue', 'Scott', '0482956172');
INSERT INTO Customer(idcustomer, customerName, surname, phoneNumber)
VALUES (customer_seq.nextval, 'Jack', 'Miller', '4720483716');

--creating sequenceuence about musicians
CREATE SEQUENCE musician_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'Bastille');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'Onuka');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'OneRepublic');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'PinkFloyd');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'DepecheMode');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (musician_seq.nextval, 'Maroon5');

--creating sequence about edition information
CREATE SEQUENCE edition_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Edition(idEdition, nameEdition)
VALUES (edition_seq.nextval, 'Standard');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (edition_seq.nextval, 'Deluxe');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (edition_seq.nextval, 'Gold Edition');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (edition_seq.nextval, 'EP');

--creating sequence about album information
CREATE SEQUENCE album_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval,'Songs About Jane', TO_DATE('2015-01-30', 'YYYY-MM-DD'), 30, 1, 6);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval, 'MOZAIKA', TO_DATE('2018-02-19', 'YYYY-MM-DD'), 22, 1, 2);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval,'All This Bad Blood', TO_DATE('2013-03-23', 'YYYY-MM-DD'), 25, 1, 1);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval,'Ultra', TO_DATE('1998-04-14', 'YYYY-MM-DD'), 60, 2, 5);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval,'V', TO_DATE('2014-05-15', 'YYYY-MM-DD'), 45, 2, 6);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval,'Native', TO_DATE('2014-06-16', 'YYYY-MM-DD'), 77, 3, 3);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval, 'Doom Days', TO_DATE('2019-07-17', 'YYYY-MM-DD'), 43, 2, 1);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval, 'Wild World', TO_DATE('2016-08-18', 'YYYY-MM-DD'), 15, 4, 1);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval, 'Violator', TO_DATE('1990-09-10', 'YYYY-MM-DD'), 65, 2, 5);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (album_seq.nextval, 'The Wall', TO_DATE('1970-11-11', 'YYYY-MM-DD'), 80, 1, 4);

--creating sequence about production
CREATE SEQUENCE production_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Interscope records', 1);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Vidlik', 2);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Virgin records', 3);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Sony Music', 4);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Interscope records', 5);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Interscope records', 6);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Virgin records', 7);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Virgin records', 8);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Sony Music', 9);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (production_seq.nextval, 'Sony Music', 10);

--creating sequence about availability of the album
CREATE SEQUENCE avail_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 15, 1, 1);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 21, 3, 2);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 17, 2, 3);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 5, 1, 4);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 9, 3, 5);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 21, 2, 6);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 10, 1, 7);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 15, 2, 8);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 17, 2, 9);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 19, 3, 10);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (avail_seq.nextval, 21, 1, 2);

--creating sequence about buying 
CREATE SEQUENCE buying_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2020-02-21', 'YYYY-MM-DD'), 1, 2);
INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2019-04-04', 'YYYY-MM-DD'), 3, 4);
INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 5, 6);
INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2019-09-15', 'YYYY-MM-DD'), 7, 1);
INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2019-11-08', 'YYYY-MM-DD'), 2, 3);
INSERT INTO Buying(idBuying, buyingDate, idAvailability, idCustomer)
VALUES (buying_seq.nextval, TO_DATE('2002-10-28', 'YYYY-MM-DD'), 4, 5);

Set serveroutput on;

-- PROCEDURE WITH OUTPUT

CREATE OR REPLACE PROCEDURE AddMusician
    (idMus INTEGER,
    nameAlb VARCHAR2)
    
AS
    musician_exists NUMBER;
    maxPrice NUMBER;
    maxAlb NUMBER;
BEGIN
    SELECT COUNT(*) INTO musician_exists
    FROM musician
    WHERE idmusician = idMus;
    
    IF musician_exists <= 0 THEN
        raise_application_error(-20111,'There is no such musician in our database');
    END IF;
    
    SELECT MAX(a.priceAlbum) INTO maxPrice
    FROM album a
    WHERE a.idMusician = 4;
    
    SELECT MAX(a.idAlbum) INTO maxAlb
    FROM album a;
    
    maxAlb := maxAlb + 1;
    
    INSERT INTO EMP VALUES
        (maxAlb, nameAlb, SYSDATE, 70, NULL, idMus); 
    END;


--TRIGGERS

CREATE OR REPLACE TRIGGER InAlb
    BEFORE DELETE OR UPDATE OR INSERT
    ON Album
    FOR EACH ROW
    DECLARE 
    counter INTEGER;
BEGIN
    IF DELETING AND :OLD.priceAlbum > 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Price is higher than 0');
    END IF;
    IF UPDATING AND :OLD.nameAlbum != :NEW.nameAlbum THEN
        RAISE_APPLICATION_ERROR(-20000, 'Cannot change the album name');
    END IF;
    IF INSERTING THEN
    SELECT COUNT(nameAlbum) INTO COUNTER FROM Album WHERE nameAlbum = :NEW.nameAlbum;
        IF COUNTER > 0 THEN
            RAISE_APPLICATION_ERROR(-20000, 'Album already exists');
        END IF;
    END IF;
END;

/
UPDATE Album
SET namealbum = 'V'
WHERE idAlbum = 5;
SELECT * FROM Album;
/

--OBJECT WITH CURSOR

CREATE OR REPLACE FUNCTION Prices
RETURN INTEGER
AS
pr INTEGER;
alId INTEGER;
alName VARCHAR2(60);
alPrice INTEGER;
CURSOR cur IS SELECT idAlbum, nameAlbum, priceAlbum
FROM Album a
WHERE 3 > (SELECT COUNT(*) FROM Album WHERE priceAlbum > a.priceAlbum);
BEGIN
    SELECT AVG(priceAlbum) into pr FROM Album;
        OPEN cur;
        LOOP
        FETCH cur INTO alId, alName, alPrice;
        EXIT WHEN cur%NOTFOUND;
                UPDATE Album
                SET priceAlbum = FLOOR(alPrice*0.75)
                WHERE idAlbum = alId;
                dbms_output.put_line('price of the album ' || alId ||',' || alName || ' was decreased to ' || alPrice*0.75);
        END LOOP;
        return cur%ROWCOUNT;
        CLOSE cur;
END Prices;
/

DECLARE
    al INTEGER;
BEGIN
    al:= Prices;
    dbms_output.put_line(al || ' updated');
END;
/





























