-- foreign keys
ALTER TABLE Album DROP CONSTRAINT Album_Edition;

ALTER TABLE Album DROP CONSTRAINT Album_Musician;

ALTER TABLE Buying DROP CONSTRAINT Buying_Availability;

ALTER TABLE Buying DROP CONSTRAINT Buying_Customer;

ALTER TABLE Comment DROP CONSTRAINT Comment_Buying;

ALTER TABLE Production DROP CONSTRAINT ProductionCountry_Album;

ALTER TABLE Availability DROP CONSTRAINT Table_15_Album;

ALTER TABLE Availability DROP CONSTRAINT Table_15_Shop;

-- tables
DROP TABLE Album;

DROP TABLE Availability;

DROP TABLE Buying;

DROP TABLE Comment;

DROP TABLE Customer;

DROP TABLE Edition;

DROP TABLE Musician;

DROP TABLE Production;

DROP TABLE Shop;


DROP SEQUENCE album_seq;

DROP SEQUENCE avail_seq;

DROP SEQUENCE buying_seq;

DROP SEQUENCE customer_seq;

DROP SEQUENCE edition_seq;

DROP SEQUENCE musician_seq;

DROP SEQUENCE production_seq;

DROP SEQUENCE shop_seq;


-- tables
-- Table: Album
CREATE TABLE Album (
    idAlbum int  NOT NULL,
    nameAlbum varchar(100)  NOT NULL,
    productionDate date  NOT NULL,
    priceAlbum int  NOT NULL,
    idEdition int  NOT NULL,
    idMusician int  NOT NULL,
    CONSTRAINT Album_pk PRIMARY KEY  (idAlbum)
);

-- Table: Availability
CREATE TABLE Availability (
    idAvailability int  NOT NULL,
    discount int  NOT NULL,
    idShop int  NOT NULL,
    idAlbum int  NOT NULL,
    CONSTRAINT Availability_pk PRIMARY KEY  (idAvailability)
);

-- Table: Buying
CREATE TABLE Buying (
    idBuying int  NOT NULL,
    date date  NOT NULL,
    idAvailability int  NOT NULL,
    idCustomer int  NOT NULL,
    CONSTRAINT Buying_pk PRIMARY KEY  (idBuying)
);

-- Table: Comment
CREATE TABLE Comment (
    idComment int  NOT NULL,
    comment varchar(100)  NOT NULL,
    idBuying int  NOT NULL,
    CONSTRAINT Comment_pk PRIMARY KEY  (idComment)
);

-- Table: Customer
CREATE TABLE Customer (
    idCustomer int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Surname varchar(50)  NOT NULL,
    phoneNumber varchar(50)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (idCustomer)
);

-- Table: Edition
CREATE TABLE Edition (
    idEdition int  NOT NULL,
    nameEdition varchar(20)  NOT NULL,
    CONSTRAINT Edition_pk PRIMARY KEY  (idEdition)
);

-- Table: Musician
CREATE TABLE Musician (
    idMusician int  NOT NULL,
    nameMusician varchar(50)  NOT NULL,
    CONSTRAINT Musician_pk PRIMARY KEY  (idMusician)
);

-- Table: Production
CREATE TABLE Production (
    idFactory int  NOT NULL,
    factoryName varchar(30)  NOT NULL,
    idAlbum int  NOT NULL,
    CONSTRAINT Production_pk PRIMARY KEY  (idFactory)
);

-- Table: Shop
CREATE TABLE Shop (
    idShop int  NOT NULL,
    address varchar(100)  NOT NULL,
    CONSTRAINT Shop_pk PRIMARY KEY  (idShop)
);

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

-- Reference: Comment_Buying (table: Comment)
ALTER TABLE Comment ADD CONSTRAINT Comment_Buying
    FOREIGN KEY (idBuying)
    REFERENCES Buying (idBuying);

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

-- sequences
-- Sequence: album_seq
CREATE SEQUENCE album_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: avail_seq
CREATE SEQUENCE avail_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: buying_seq
CREATE SEQUENCE buying_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: customer_seq
CREATE SEQUENCE customer_seq
    START WITH 1  
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: edition_seq
CREATE SEQUENCE edition_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: musician_seq
CREATE SEQUENCE musician_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: production_seq
CREATE SEQUENCE production_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: shop_seq
CREATE SEQUENCE shop_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

INSERT INTO Shop(idShop, address)
VALUES (0, 'Warsaw, ArcadiaMall');
INSERT INTO Shop(idShop, address)
VALUES (1, 'Krakow, Galeria Krakowska');
INSERT INTO Shop(idShop, address)
VALUES (2, 'Kiev, OceanPlaza');

INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (0, 'John', 'Smith', '1234567890');
INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (1, 'Jack', 'Yalom', '1357990863');
INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (2, 'Michael', 'London', '2468095735');
INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (3, 'Philip', 'Martin', '5395820164');
INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (4, 'Loue', 'Scott', '0482956172');
INSERT INTO Customer(idcustomer, Name, surname, phoneNumber)
VALUES (5, 'Jack', 'Miller', '4720483716');

INSERT INTO Musician(idMusician, nameMusician)
VALUES (0, 'Bastille');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (1, 'Onuka');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (2, 'OneRepublic');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (3, 'PinkFloyd');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (4, 'DepecheMode');
INSERT INTO Musician(idMusician, nameMusician)
VALUES (5, 'Maroon5');

INSERT INTO Edition(idEdition, nameEdition)
VALUES (0, 'Standard');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (1, 'Deluxe');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (2, 'Gold Edition');
INSERT INTO Edition(idEdition, nameEdition)
VALUES (3, 'EP');

INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (0,'Songs About Jane', CONVERT(VARCHAR, '2015-01-30', 104), 30, 0, 5);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (1, 'MOZAIKA', CONVERT(VARCHAR, '2018-02-19', 104), 22, 0, 1);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (2,'All This Bad Blood', CONVERT(VARCHAR, '2013-03-23', 104), 25, 0, 0);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (3,'Ultra', CONVERT(VARCHAR, '1998-04-14', 104), 60, 1, 4);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (4,'V', CONVERT(VARCHAR, '2014-05-15', 104), 45, 1, 5);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (5,'Native', CONVERT(VARCHAR, '2014-06-16', 104), 77, 2, 2);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (6, 'Doom Days', CONVERT(VARCHAR, '2019-07-17', 104), 43, 1, 0);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (7, 'Wild World', CONVERT(VARCHAR, '2016-08-18', 104), 15, 3, 0);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (8, 'Violator', CONVERT(VARCHAR, '1990-09-10', 104), 65, 1, 4);
INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES (9, 'The Wall', CONVERT(VARCHAR, '1970-11-11', 104), 80, 0, 3);

INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (0, 'Interscope records', 0);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (1, 'Vidlik', 1);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (2, 'Virgin records', 2);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (3, 'Sony Music', 3);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (4, 'Interscope records', 4);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (5, 'Interscope records', 5);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (6, 'Virgin records', 6);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (7, 'Virgin records', 7);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (8, 'Sony Music', 8);
INSERT INTO Production(idFactory, factoryName, idAlbum)
VALUES (9, 'Sony Music', 9);

INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (0, 15, 0, 0);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (1, 21, 2, 1);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (2, 17, 1, 2);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (3, 5, 0, 3);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (4, 9, 2, 4);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (5, 21, 1, 5);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (6, 10, 0, 6);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (7, 15, 1, 7);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (8, 17, 1, 8);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (9, 19, 2, 9);
INSERT INTO Availability(idAvailability, discount, idShop, idAlbum)
VALUES (10, 21, 0, 1);

INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (0, CONVERT(VARCHAR, '2020-02-21', 104), 0, 1);
INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (1, CONVERT(VARCHAR, '2019-04-04', 104), 2, 3);
INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (2, CONVERT(VARCHAR, '2020-01-01', 104), 4, 5);
INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (3, CONVERT(VARCHAR, '2019-09-15', 104), 6, 0);
INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (4, CONVERT(VARCHAR, '2019-11-08', 104), 1, 2);
INSERT INTO Buying(idBuying, date, idAvailability, idCustomer)
VALUES (5, CONVERT(VARCHAR, '2002-10-28', 104), 3, 4);


--SCALAR FUNCTION AND OUTPUT PARAMETER
ALTER FUNCTION newPrice(
	@priceAlbum INT,
	@discount INT
)
RETURNS INT 
AS
BEGIN
	RETURN @priceAlbum - @discount
END;
GO

PRINT 'New price is ' + CAST(s20946.newPrice(60, 12) AS VARCHAR);

ALTER PROCEDURE assignNewPrice(
	@albumID INT,
	@discount INT
) AS
BEGIN
	DECLARE @price INT
	DECLARE @newPrice INT
	SELECT @price = priceAlbum FROM Album WHERE idAlbum = @albumID;
	SET @newPrice = s20946.newPrice(@price, @discount)

	IF @newPrice < 0
		RAISERROR(-20000, 1, 1, 'price cannot be smaller than zero')
	ELSE
		UPDATE Album
		SET priceAlbum = @newPrice
		WHERE idAlbum = @albumID
END;
GO

DECLARE @price INT
SELECT @price = priceAlbum FROM Album WHERE idAlbum = 4;
PRINT 'Old price is ' + CAST(@price AS VARCHAR);

EXEC assignNewPrice 4, 10;
SELECT @price = priceAlbum FROM Album WHERE idAlbum = 4;
PRINT 'New price is ' + CAST(@price AS VARCHAR);

--TRIGGER

CREATE TRIGGER newAl ON Album INSTEAD OF INSERT AS
BEGIN
	DECLARE @mus INT,
			@count INT;
	SELECT @mus = idMusician
	FROM inserted;

	IF NOT EXISTS (SELECT 1 FROM Musician m WHERE idMusician = @mus)
		BEGIN 
			INSERT INTO Musician(idMusician, nameMusician)
			VALUES (@mus, 'a-ha');
		END;
	ELSE
		BEGIN
			INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
			SELECT * FROM INSERTED i WHERE i.nameAlbum NOT IN (SELECT nameAlbum FROM Album)
			SELECT @count = COUNT(1) FROM Album WHERE idMusician=@mus;
			PRINT 'Musician ' + CAST(@mus as VARCHAR) + ' have ' + CAST(@count as VARCHAR) + ' albums.';
		END;
END;
GO

INSERT INTO Album(idAlbum, nameAlbum, productionDate, priceAlbum, idEdition, idMusician)
VALUES(14, 'blablabla', CONVERT(VARCHAR, '2002-02-21', 104), 98, 1, 0);
SELECT * FROM Album;