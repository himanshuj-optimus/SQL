Create Table Sightings(
SightingID int primary key,
SnakeID int,
Location Nvarchar(20) not null,
SightingDate Date not null,
Observer Char(20) not null,
Foreign Key(SnakeID) references Snakes(SnakeID));

INSERT INTO Sightings (SightingID, SnakeID, Location, SightingDate, Observer) VALUES
(1, 1, 'Pune', '2024-01-15', 'Jane Smith'),
(2, 2, 'Mumbai', '2024-02-20', 'Jane Smith'),
(3, 3, 'Nagpur', '2024-03-10', 'Alice Johnson'),
(4, 4, 'Delhi', '2024-04-05', 'Bob Brown'),
(5, 5, 'Chennai', '2024-05-25', 'Jane Smith'),
(6, 6, 'Kolkata', '2024-06-30', 'Alice Johnson'),
(7, 7, 'Bangalore', '2024-07-15', 'Eve Foster'),
(8, 8, 'Hyderabad', '2024-08-20', 'Jane Smith'),
(9, 9, 'Ahmedabad', '2024-09-10', 'Grace Harris'),
(10, 10, 'Pune', '2024-10-05', 'Jane Smith');

INSERT INTO Sightings (SightingID, SnakeID, Location, SightingDate, Observer) VALUES
(11, 7, 'Mumbai', '2024-10-15', 'John Doe'),
(12, 7, 'Delhi', '2024-10-20', 'Jane Smith'),
(13, 7, 'Chennai', '2024-10-25', 'Alice Johnson'),
(14, 7, 'Kolkata', '2024-11-01', 'Bob Brown'),
(15, 7, 'Hyderabad', '2024-11-05', 'Eve Foster'),
(16, 7, 'Ahmedabad', '2024-11-10', 'Grace Harris'),
(17, 7, 'Pune', '2024-11-15', 'Jane Smith'),
(18, 7, 'Mumbai', '2024-11-20', 'John Doe'),
(19, 7, 'Delhi', '2024-11-25', 'Alice Johnson'),
(20, 7, 'Chennai', '2024-12-01', 'Bob Brown'),
(21, 7, 'Kolkata', '2024-12-05', 'Eve Foster'),
(22, 7, 'Hyderabad', '2024-12-10', 'Grace Harris'),
(23, 7, 'Ahmedabad', '2024-12-15', 'Jane Smith'),
(24, 7, 'Pune', '2024-12-20', 'John Doe'),
(25, 7, 'Mumbai', '2024-12-25', 'Alice Johnson');

INSERT INTO Sightings (SightingID, SnakeID, Location, SightingDate, Observer) VALUES
(26, 2, 'Mumbai', '2024-10-15', 'John Doe'),
(27, 2, 'Delhi', '2024-10-20', 'Jane Smith'),
(28, 2, 'Chennai', '2024-10-25', 'Alice Johnson'),
(29, 2, 'Kolkata', '2024-11-01', 'Bob Brown'),
(30, 2, 'Hyderabad', '2024-11-05', 'Eve Foster'),
(31, 2, 'Ahmedabad', '2024-11-10', 'Grace Harris'),
(32, 2, 'Pune', '2024-11-15', 'Jane Smith'),
(33, 2, 'Mumbai', '2024-11-20', 'John Doe'),
(34, 2, 'Delhi', '2024-11-25', 'Alice Johnson'),
(35, 2, 'Chennai', '2024-12-01', 'Bob Brown'),
(36, 2, 'Kolkata', '2024-12-05', 'Eve Foster'),
(37, 2, 'Hyderabad', '2024-12-10', 'Grace Harris'),
(38, 2, 'Ahmedabad', '2024-12-15', 'Jane Smith'),
(39, 2, 'Pune', '2024-12-20', 'John Doe');

select * from sightings;


