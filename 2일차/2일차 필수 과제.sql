-- 반려동물 호텔 예약 시스템 데이터베이스 생성
-- CREATE DATABASE pet_hotel_database;

-- 데이터베이스 사용
-- USE pet_hotel_database;














CREATE TABLE PetOwners(
ownerID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(5) NOT NULL,
contact VARCHAR(11) NOT NULL
);



CREATE TABLE pets(
petID INT PRIMARY KEY AUTO_INCREMENT,
ownerID  INT,
name VARCHAR(15) NOT NULL,
species ENUM('dog', 'cat', 'etc'),
breed VARCHAR(15),
FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);

CREATE TABLE Rooms(
roomID INT PRIMARY KEY AUTO_INCREMENT,
roomNumber INT,
roomType ENUM('standard', 'superior', 'deluxe', 'suite'),
pricePerNight INT NOT NULL
);

CREATE TABLE Reservations(
reservationID INT PRIMARY KEY AUTO_INCREMENT,
petID INT,
roomID INT,
startDate TIMESTAMP NOT NULL,
endDate TIMESTAMP NOT NULL,
FOREIGN KEY (petID) REFERENCES pets(petID ),
FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

CREATE TABLE Services(
serviceID INT PRIMARY KEY AUTO_INCREMENT,
reservationID INT,
serviceName ENUM('wash', 'walk', 'play', 'etc'),
servicePrice INT, 
FOREIGN KEY (reservationID) REFERENCES Reservations(reservationID)
);

