-- Exercici 1
SELECT COUNT(*)
FROM flights;

-- Exercici 2
SELECT a.airport, AVG(DepDelay), AVG(ArrDelay)
FROM flights f, usairports a
WHERE f.origin = a.iata
GROUP BY f.origin;

-- Exercici 3
SELECT f.Origin, f.colYear, f.colMonth, AVG(ArrDelay) as retrasoSalida
FROM flights f
GROUP BY f.origin, f.colYear, f.colMonth
ORDER BY f.origin, f.colYear, f.colMonth;

-- Exercici 4.
SELECT a.city, f.Origin, f.colYear, f.colMonth, AVG(ArrDelay) as retrasoSalida
FROM flights f
INNER JOIN usairports a
ON f.origin = a.iata
GROUP BY f.origin, f.colYear, f.colMonth
ORDER BY f.origin, f.colYear, f.colMonth;

-- Exercici 5
SELECT c.Description, f.UniqueCarrier, COUNT(*) AS cancelaciones
FROM flights f
INNER JOIN carriers c 
ON f.UniqueCarrier = c.CarrierCode
WHERE f.cancelled IS TRUE
GROUP BY f.UniqueCarrier
ORDER BY cancelaciones DESC;

-- Exercici 6
SELECT f.TailNum, SUM(f.distance) AS distanciaTotal
FROM flights f
WHERE f.TailNum <> 'NA'
GROUP BY f.TailNum
ORDER BY distanciaTotal DESC
LIMIT 10;

-- Exercici 7
SELECT f.UniqueCarrier, AVG(f.ArrDelay) AS retrasoMedio
FROM flights f
GROUP BY f.UniqueCarrier
HAVING retrasoMedio > 10
ORDER BY retrasoMedio DESC;
