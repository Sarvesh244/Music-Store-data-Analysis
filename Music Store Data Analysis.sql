create database MusicStore;
use MusicStore;
-- 1. Genres and MediaTypes 
CREATE TABLE Genres ( 
genre_id INT PRIMARY KEY not null unique, 
name VARCHAR(50) 
);
CREATE TABLE MediaTypes ( 
mediatype_id INT PRIMARY KEY not null unique, 
file_type VARCHAR(50) 
); 

-- 2. Employees 
CREATE TABLE Employees ( 
 employee_id INT PRIMARY KEY not null unique, 
 last_name VARCHAR(120), 
 first_name VARCHAR(120), 
 title VARCHAR(50), 
 reports_to INT, 
 levels VARCHAR(10), 
 birthdate DATE, 
 hire_date DATE, 
 address VARCHAR(255), 
 city VARCHAR(50), 
 state VARCHAR(50), 
 country VARCHAR(50), 
 postal_code VARCHAR(20), 
 phone VARCHAR(50), 
 fax VARCHAR(50), 
 email VARCHAR(100) 
); 

 -- 3. Customers 
CREATE TABLE Customers ( 
 customer_id INT PRIMARY KEY not null unique, 
 first_name VARCHAR(120), 
 last_name VARCHAR(120), 
 company VARCHAR(120), 
 address VARCHAR(255), 
 city VARCHAR(50), 
 state VARCHAR(50), 
 country VARCHAR(50), 
 postal_code VARCHAR(20), 
 phone VARCHAR(50), 
 fax VARCHAR(50), 
 email VARCHAR(100), 
 support_rep_id INT, 
 FOREIGN KEY (support_rep_id) REFERENCES Employees(employee_id) 
); 

 -- 4. Artists 
CREATE TABLE Artists ( 
 artist_id INT PRIMARY KEY unique not null, 
 name VARCHAR(120) 
); 
 -- 5. Albums 
CREATE TABLE Albums ( 
 album_id INT PRIMARY KEY unique not null, 
 title VARCHAR(160), 
 artist_id INT, 
 FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) 
); 

 -- 6. Tracks 
CREATE TABLE Tracks ( 
 track_id INT PRIMARY KEY unique not null, 
 name VARCHAR(200), 
 album_id INT, 
 media_type_id INT, 
 genre_id INT, 
 composer VARCHAR(220), 
 milliseconds INT, 
 bytes INT, 
 unit_price DECIMAL(10,2), 
 FOREIGN KEY (album_id) REFERENCES Albums(album_id), 
 FOREIGN KEY (media_type_id) REFERENCES MediaTypes(mediatype_id), 
 FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) 
); 

SHOW VARIABLES LIKE 'secure_file_priv'; 
LOAD DATA INFILE  'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\track.csv'
INTO TABLE  tracks 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(track_id, name, album_id, media_type_id, genre_id, composer, 
milliseconds, bytes, unit_price); 

 -- 7. Invoices 
CREATE TABLE Invoices ( 
 invoice_id INT PRIMARY KEY unique not null, 
 customer_id INT, 
 invoice_date DATE, 
 billing_address VARCHAR(255), 
 billing_city VARCHAR(100), 
 billing_state VARCHAR(100), 
 billing_country VARCHAR(100), 
 billing_postal_code VARCHAR(20), 
 total DECIMAL(10,2), 
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
); 

 -- 8. InvoiceLines 
CREATE TABLE InvoiceLines ( 
 invoice_line_id INT PRIMARY KEY unique not null, 
 invoice_id INT, 
 track_id INT, 
 unit_price DECIMAL(10,2), 
 quantity INT, 
 FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id), 
 FOREIGN KEY (track_id) REFERENCES Tracks(track_id) 
); 

 -- 9. Playlists 
CREATE TABLE Playlists ( 
playlist_id INT PRIMARY KEY unique not null, 
name VARCHAR(255) 
); 

 -- 10. PlaylistTracks 
CREATE TABLE PlaylistTracks ( 
 playlist_id INT not null, 
 track_id INT not null, 
 PRIMARY KEY (playlist_id, track_id), 
 FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id), 
 FOREIGN KEY (track_id) REFERENCES Tracks(track_id) 
); 
