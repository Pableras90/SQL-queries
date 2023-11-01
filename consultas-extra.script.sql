--Listar las pistas más compradas (la tabla InvoiceLine tiene los registros de compras)
SELECT T.NAME, COUNT(I.TrackId)	AS 'MORE PURCHASED TRACKS'
FROM InvoiceLine I
INNER JOIN Track T ON T.TrackId=I.TrackId
GROUP BY T.NAME
HAVING COUNT(I.TrackId) > 1
ORDER BY COUNT(I.TrackId)  DESC



--Listar las pistas ordenadas por el número de veces que aparecen en playlists de forma descendente
SELECT T.TrackId, T.Name, COUNT(T.TRACKID)
FROM TRACK T
INNER JOIN PlaylistTrack PT ON PT.TrackId=T.TrackId
GROUP BY T.TrackId,T.NAME
ORDER BY COUNT(T.TRACKID) DESC

--Listar los artistas más comprados
SELECT AR.ArtistId,AR.[Name],COUNT(I.Quantity) AS 'MORE PURCHASED ARTISTS'
FROM InvoiceLine I
INNER JOIN Track T ON T.TrackId = I.TrackId
INNER JOIN Album AL  ON AL.AlbumId = T.AlbumId 
INNER JOIN Artist AR ON AR.ArtistId= AL.ArtistId
GROUP BY AR.ArtistId,AR.[Name]
HAVING COUNT(I.Quantity) > 5
ORDER BY COUNT(I.Quantity) DESC

--Listar las pistas que aún no han sido compradas por nadie
SELECT T.TrackId, T.Name --, I.Quantity
FROM Track T
LEFT JOIN InvoiceLine I ON I.TrackId = T.TrackId
WHERE I.InvoiceLineId IS NULL

--Listar los artistas que aún no han vendido ninguna pista

SELECT A.ArtistId, A.Name
FROM Artist A
WHERE A.ArtistId NOT IN (
    SELECT DISTINCT AR.ArtistId
    FROM Artist AR
    INNER JOIN Album AL ON AR.ArtistId = AL.ArtistId
    INNER JOIN Track T ON AL.AlbumId = T.AlbumId
    INNER JOIN InvoiceLine I ON T.TrackId = I.TrackId
);
