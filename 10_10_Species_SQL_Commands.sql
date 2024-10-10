Create Table Species(
SpeciesID Int Primary Key,
CommonName Nvarchar(50) Not Null,
ScientificName Nvarchar(50) Unique Not Null,
Habitat Char(20) Not Null,
Venomous Bit);



INSERT INTO Species (SpeciesID, CommonName, ScientificName, Habitat, Venomous) VALUES
(1, 'King Cobra', 'Ophiophagus hannah', 'Forest', 1),
(2, 'Indian Python', 'Python molurus', 'Grassland', 0),
(3, 'Russell Viper', 'Daboia russelii', 'Grassland', 1),
(4, 'Indian Krait', 'Bungarus caeruleis', 'Forest', 1),
(5, 'Green Tree Python', 'Morelia viridis', 'Rainforest', 0),
(6, 'Saw-scaled Viper', 'Echis carinatus', 'Desert', 1),
(7, 'Reticulated Python', 'Malayopython reticulatus', 'Rainforest', 0),
(8, 'Common Krait', 'Bungarus caeruleus', 'Forest', 1),
(9, 'Banded Krait', 'Bungarus fasciatus', 'Forest', 1),
(10, 'Indian Rock Python', 'Python moluris', 'Forest', 0);
