-- Q1:Retrieve all sightings of a specific species by common name
SELECT si.*, sp.commonname 
FROM sightings si 
JOIN snakes ON snakes.snakeid = si.snakeid 
JOIN species sp ON sp.speciesid = snakes.speciesid 
WHERE sp.commonname = 'Common Krait';

-- Q2: Find the average length of snakes  by species
SELECT species.speciesid, AVG(snakes.length) AS AverageLength 
FROM snakes 
JOIN species ON species.SpeciesID = snakes.SpeciesID
GROUP BY species.speciesid;


-- Q3:  Find the top 5 longest snakes for each species.
WITH RankedLength AS (
    SELECT snakeid, speciesid, length, age, color, 
           ROW_NUMBER() OVER (PARTITION BY speciesid ORDER BY length DESC) AS rank 
    FROM snakes
)
SELECT snakeid, speciesid, length, age, color 
FROM RankedLength 
WHERE rank <= 5 
ORDER BY speciesid, rank;

-- Q4: Identify the observer who has seen the highest number of different species.
SELECT TOP 1 si.observer, COUNT(DISTINCT sn.speciesid) AS TotalDifferentSpecies 
FROM sightings si 
JOIN snakes sn ON sn.snakeid = si.snakeid 
GROUP BY si.observer 
ORDER BY TotalDifferentSpecies DESC;

-- Q5: Determine the change in conservation status for species over time.
SELECT 
    cs1.speciesid,
	cs1.status,
	cs2.status,
	cs2.lastupdated,
	sp.commonname
FROM 
    ConservationStatus cs1
JOIN
    ConservationStatus cs2 on cs1.speciesid=cs2.SpeciesID
JOIN
	Species sp on sp.speciesid=cs1.speciesid
WHERE 
    cs1.statusid <> cs2.statusid 
    AND cs1.status <> cs2.status
    AND cs1.speciesid = cs2.speciesid 
    AND cs1.lastupdated < cs2.lastupdated
ORDER BY 
	cs2.lastupdated DESC;


-- Q6: List species that are classified as "Endangered" and have been sighted more than 10 times.
SELECT sp.commonname, sp.SpeciesID 
FROM species sp 
JOIN ConservationStatus cs ON cs.SpeciesID = sp.SpeciesID 
WHERE sp.speciesid IN (
    SELECT sn.speciesid 
    FROM snakes sn 
    JOIN Sightings si ON sn.SnakeID = si.SnakeID 
    GROUP BY si.snakeid, sn.speciesid 
    HAVING COUNT(si.snakeid) > 10
) 
AND cs.Status = 'Endangered';
