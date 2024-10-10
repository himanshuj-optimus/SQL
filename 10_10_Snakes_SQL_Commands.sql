--Create Table Snakes(
--SnakeID Int Primary Key,
--SpeciesID int,
--Length Decimal(3,2) not null,
--Age int not null,
--Color Char(15) not null,
--Foreign Key(SpeciesID) References Species(SpeciesID));

--INSERT INTO Snakes (SnakeID, SpeciesID, Length, Age, Color) VALUES
--(1, 1, 3.5, 5, 'Black'),
--(2, 2, 4.2, 8, 'Brown'),
--(3, 3, 1.2, 3, 'Brown'),
--(4, 4, 1.5, 4, 'Black'),
--(5, 5, 2.0, 6, 'Green'),
--(6, 6, 0.8, 2, 'Brown'),
--(7, 7, 5.0, 10, 'Yellow'),
--(8, 8, 1.3, 4, 'Black'),
--(9, 9, 2.1, 5, 'Yellow'),
--(10, 10, 4.5, 9, 'Brown');

insert into snakes (SnakeID, SpeciesID, Length, Age, Color) VALUES
(11,6,5.1,6,'Blue'),
(12,6,3.2,4,'Green'),
(13,6,4.1,2,'Red'),
(14,3,3.2,4,'Green'),
(15,3,2.1,5,'Brown'),
(16,3,2.7,2,'Black'),
(17,4,1.9,5,'Black');
