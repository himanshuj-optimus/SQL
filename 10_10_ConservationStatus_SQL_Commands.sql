Create Table ConservationStatus(
StatusID int primary key,
SpeciesID int,
Status Nvarchar(100) Not null,
LastUpdated Date Not null,
foreign key (SpeciesID) references Species(SpeciesID));

INSERT INTO ConservationStatus (StatusID, SpeciesID, Status, LastUpdated) VALUES
(1, 1, 'Endangered', '2024-01-01'),
(2, 2, 'Vulnerable', '2024-02-01'),
(3, 3, 'Least Concern', '2024-03-01'),
(4, 4, 'Endangered', '2024-04-01'),
(5, 5, 'Least Concern', '2024-05-01'),
(6, 6, 'Vulnerable', '2024-06-01'),
(7, 7, 'Least Concern', '2024-07-01'),
(8, 8, 'Endangered', '2024-08-01'),
(9, 9, 'Vulnerable', '2024-09-01'),
(10, 10, 'Least Concern', '2024-10-01');

insert into ConservationStatus values (11,7,'Endangered','2024-10-2');
insert into ConservationStatus values (13,2,'Endangered','2024-11-2');
