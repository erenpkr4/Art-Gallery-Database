DROP TABLE Artwork cascade constraints;
DROP TABLE Customer cascade constraints;
DROP TABLE Artist cascade constraints;
DROP TABLE Art_Gallery cascade constraints;
DROP TABLE Exhibition cascade constraints;
DROP TABLE Artwork_Sold cascade constraints;
DROP TABLE Artist_Organizes cascade constraints;
DROP TABLE Gallery_Exhibits cascade constraints;
DROP TABLE Artist_Owns cascade constraints;
DROP TABLE Displayed_In cascade constraints;

CREATE TABLE Artist (
   artist_id INT PRIMARY KEY,
   artist_fname VARCHAR(20),
   artist_lname VARCHAR(20),
   artist_phone INT UNIQUE,
   artist_country VARCHAR(20),
   artist_style VARCHAR(20)
);

CREATE TABLE Artwork (
   artwork_id INT PRIMARY KEY,
   artwork_style VARCHAR(20),
   artwork_price INT,
   artwork_name VARCHAR(35),
   artwork_date DATE,
   artist_id INT,
   FOREIGN KEY(artist_id) REFERENCES Artist(artist_id) ON DELETE SET NULL
);


CREATE TABLE Customer (
   customer_id INT PRIMARY KEY,
   customer_fname VARCHAR(20),
   customer_lname VARCHAR(20),
   customer_phone INT UNIQUE,
   customer_networth INT
);

CREATE TABLE Art_Gallery (
   gallery_id INT PRIMARY KEY,
   gallery_name VARCHAR(35),
   gallery_location VARCHAR(35)
);

CREATE TABLE Exhibition (
   exhib_id INT PRIMARY KEY,
   exhib_name VARCHAR(35),
   exhib_startdate DATE,
   exhib_enddate DATE
);

CREATE TABLE Artwork_Sold (
   artwork_id INT,
   customer_id INT,
   PRIMARY KEY(artwork_id,customer_id),
   FOREIGN KEY(artwork_id) REFERENCES Artwork(artwork_id) ON DELETE CASCADE,
   FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Artist_Organizes (
   exhib_id INT,
   artist_id INT,
   PRIMARY KEY(exhib_id,artist_id),
   FOREIGN KEY(exhib_id) REFERENCES Exhibition(exhib_id) ON DELETE CASCADE,
   FOREIGN KEY(artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE
);

CREATE TABLE Gallery_Exhibits (
   gallery_id INT,
   exhib_id INT,
   PRIMARY KEY(gallery_id,exhib_id),
   FOREIGN KEY(gallery_id) REFERENCES Art_Gallery(gallery_id) ON DELETE CASCADE,
   FOREIGN KEY(exhib_id) REFERENCES Exhibition(exhib_id) ON DELETE CASCADE
);

CREATE TABLE Artist_Owns (
   artist_id INT,
   gallery_id INT,
   owned_since DATE,
   PRIMARY KEY(artist_id,gallery_id),
   FOREIGN KEY(artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE,
   FOREIGN KEY(gallery_id) REFERENCES Art_Gallery(gallery_id) ON DELETE CASCADE
);

CREATE TABLE Displayed_In (
   artwork_id INT,
   gallery_id INT,
   PRIMARY KEY(artwork_id,gallery_id),
   FOREIGN KEY(artwork_id) REFERENCES Artwork(artwork_id) ON DELETE CASCADE,
   FOREIGN KEY(gallery_id) REFERENCES Art_Gallery(gallery_id) ON DELETE CASCADE
);

--INSERTING VALUES INTO ARTIST

INSERT INTO Artist VALUES(100,'Eren','Peker',05395555555,'Turkey','Painter');
INSERT INTO Artist VALUES(101,'Ege Baran','Cakan',05351701717,'Germany','Sculptor');
INSERT INTO Artist VALUES(102,'Tamer','Ucar',05349990099,'USA','Painter');
INSERT INTO Artist VALUES(103,'Cirilla','Riannon',05308880088,'Sweden','Painter');
INSERT INTO Artist VALUES(104,'Michelangelo','Simoni',NULL,'Italy','Sculptor');
INSERT INTO Artist VALUES(105,'Donatello','Bardi',NULL,'Florence','Sculptor');
INSERT INTO Artist VALUES(106,'Sevgi','Canpolat',05352001515,'Turkey','Painter');

SELECT * FROM Artist;

DELETE FROM Artwork;

--INSERTING VALUES INTO ARTWORK

INSERT INTO Artwork VALUES(400,'Painting',5000,'Kaer Morhen','20-SEP-2001',103);
INSERT INTO Artwork VALUES(401,'Sculpture',1000,'Nezih Erel','02-JUN-2000',101);
INSERT INTO Artwork VALUES(402,'Sculpture',350000,'CR7','19-JAN-1995',104);
INSERT INTO Artwork VALUES(403,'Painting',25000,'Sokrates ve Pokrates','05-FEB-2017',100);
INSERT INTO Artwork VALUES(404,'Painting',15000,'Pearl','12-SEP-2003',100);
INSERT INTO Artwork VALUES(405,'Painting',100000,'Database Management','25-APR-2010',102);
INSERT INTO Artwork VALUES(406,'Sculpture',40000,'Statue of Geralt','10-MAR-2020',101);
INSERT INTO Artwork VALUES(407,'Sculpture',120000,'King Kong','03-AUG-1990',104);
INSERT INTO Artwork VALUES(408,'Painting',8881938,'Mustafa Kemal','19-MAY-1919',106);
INSERT INTO Artwork VALUES(409,'Sculpture',17000,'Pirouette','24-DEC-2019',105);

SELECT * FROM Artwork;

DELETE FROM Artwork;

--INSERTING VALUES INTO CUSTOMER

INSERT INTO Customer VALUES(1000,'Jeff','Bezos',05151059517,202000000);
INSERT INTO Customer VALUES(1001,'Elon','Musk',05308105567,290000000);
INSERT INTO Customer VALUES(1002,'Nezih','Erel',05310151600,15);
INSERT INTO Customer VALUES(1003,'Yao','Ming',05200609172,1500000);
INSERT INTO Customer VALUES(1004,'Utku Anil','Cakmak',05395621935,53000);
INSERT INTO Customer VALUES(1005,'Baris','Bozkurt',05246629113,57000000);

SELECT * FROM Customer;

DELETE FROM Customer;

--INSERTING VALUES INTO ART_GALLERY

INSERT INTO Art_Gallery VALUES(2000,'Rijksmuseum','Amsterdam');
INSERT INTO Art_Gallery VALUES(2001,'Smithsonian','Washington D.C.');
INSERT INTO Art_Gallery VALUES(2002,'Ermitaj','St. Petersburg');

SELECT * FROM Art_Gallery;

DELETE FROM Art_Gallery;

--INSERTING VALUES INTO EXHIBITION

INSERT INTO Exhibition VALUES(2500,'Traveled Rod','01-JAN-2017','12-DEC-2017');
INSERT INTO Exhibition VALUES(2501,'Lotus in the Swamp','18-DEC-2018','15-FEB-2019');
INSERT INTO Exhibition VALUES(2502,'On the Horizon','09-JUN-2017','08-APR-2018');
INSERT INTO Exhibition VALUES(2503,'DuoX40dell','31-MAR-2020','28-APR-2020');

SELECT * FROM Exhibition;

DELETE FROM Exhibition;

--INSERTING VALUES INTO ARTWORK_SOLD

INSERT INTO Artwork_Sold VALUES(401,1000);
INSERT INTO Artwork_Sold VALUES(403,1000);
INSERT INTO Artwork_Sold VALUES(405,1001);
INSERT INTO Artwork_Sold VALUES(407,1005);
INSERT INTO Artwork_Sold VALUES(409,1003);

SELECT * FROM Artwork_Sold;

DELETE FROM Artwork_Sold;

--INSERTING VALUES INTO ARTIST_ORGANIZES

INSERT INTO Artist_Organizes VALUES(2500,101);
INSERT INTO Artist_Organizes VALUES(2501,102);
INSERT INTO Artist_Organizes VALUES(2502,105);
INSERT INTO Artist_Organizes VALUES(2503,106);

SELECT * FROM Artist_Organizes;

DELETE FROM Artist_Organizes;

--INSERTING VALUES INTO GALLERY_EXHIBITS

INSERT INTO Gallery_Exhibits VALUES(2000,2500);
INSERT INTO Gallery_Exhibits VALUES(2001,2501);
INSERT INTO Gallery_Exhibits VALUES(2001,2502);
INSERT INTO Gallery_Exhibits VALUES(2002,2503);

SELECT * FROM Gallery_Exhibits;

DELETE FROM Gallery_Exhibits;

--INSERTING VALUES INTO ARTIST_OWNS

INSERT INTO Artist_Owns VALUES(100,2001,'30-AUG-2004');
INSERT INTO Artist_Owns VALUES(101,2000,'13-OCT-2007');
INSERT INTO Artist_Owns VALUES(103,2002,'21-JAN-2002');

SELECT * FROM Artist_Owns;

DELETE FROM Artist_Owns;

--INSERTING VALUES INTO DISPLAYED_IN

INSERT INTO Displayed_In VALUES(400,2000);
INSERT INTO Displayed_In VALUES(401,2001);
INSERT INTO Displayed_In VALUES(402,2001);
INSERT INTO Displayed_In VALUES(403,2001);
INSERT INTO Displayed_In VALUES(404,2002);
INSERT INTO Displayed_In VALUES(405,2002);
INSERT INTO Displayed_In VALUES(406,2001);
INSERT INTO Displayed_In VALUES(407,2002);
INSERT INTO Displayed_In VALUES(408,2000);
INSERT INTO Displayed_In VALUES(409,2000);

SELECT * FROM Displayed_In;

DELETE FROM Displayed_In;

--QUERIES

--SELECTS AND DISPLAYS ALL ARTISTS AND THEIR ARTWORK'S NAME AND ID.
SELECT Artist.artist_id, Artist.artist_fname,Artwork.artwork_name, Artwork.artwork_id
FROM Artist,Artwork
WHERE Artist.artist_id = Artwork.artist_id
ORDER BY Artist.artist_id;

--SELECTS AND DISPLAYS GALLERY IDS, NAMES AND THEIR OWNER'S ID AND FULLNAME.
SELECT Art_Gallery.gallery_id, Art_Gallery.gallery_name, Artist_Owns.artist_id,Artist.artist_fname,Artist.artist_lname
FROM Art_Gallery,Artist_Owns,Artist
WHERE Art_Gallery.gallery_id = Artist_Owns.gallery_id AND Artist.artist_id = Artist_Owns.artist_id;

--SELECTS AND DISPLAYS NAME AND ID OF THE CUSTOMER WHO BOUGHT ARTWORK WITH ID 403
SELECT Customer.customer_fname,Customer.customer_id
FROM Customer
WHERE Customer.customer_id = (
     SELECT Artwork_Sold.customer_id
     FROM Artwork_Sold
     WHERE  Artwork_Sold.artwork_id =403);
     
--SELECTS AND DISPLAYS NAME AND ID OF EXHIBITION HELD ON ART GALLERY WITH ID 2500
SELECT Exhibition.exhib_name,Exhibition.exhib_id 
FROM Exhibition
WHERE Exhibition.exhib_id = (
    SELECT Gallery_Exhibits.exhib_id
    FROM Gallery_Exhibits
    WHERE Gallery_Exhibits.gallery_id = 2000);
    
--SET OPERATION
SELECT * FROM Gallery_Exhibits
UNION
SELECT * FROM Artist_Organizes;

--DISPLAYS THE NUMBER OF CUSTOMERS WHO BOUGHT AN ARTWORK
SELECT COUNT(Customer.customer_id)
FROM Customer
WHERE Customer.customer_id IN (
   SELECT Artwork_Sold.customer_id
   FROM Artwork_Sold);
   
--DISPLAYS THE TOTAL AMOUNT OF MONEY EARNED FROM ARTWORK SALES
SELECT SUM(Artwork.artwork_price)
FROM Artwork
WHERE Artwork.artwork_id IN (
   SELECT Artwork_Sold.artwork_id
   FROM Artwork_Sold);