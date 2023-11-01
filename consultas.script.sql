--Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT TrackId,Name,UnitPrice FROM TRACK T WHERE UnitPrice >=1

--Listar las pistas de más de 4 minutos de duración
DECLARE @MILISECONDS_PER_MINUTE int = 60000; 
SELECT TrackId,Name,Milliseconds FROM TRACK WHERE Milliseconds >= 4*@MILISECONDS_PER_MINUTE

--Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT TrackId,Name,Milliseconds FROM TRACK WHERE Milliseconds >= 2*@MILISECONDS_PER_MINUTE AND  Milliseconds <= 3*@MILISECONDS_PER_MINUTE

--Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
SELECT TrackId,Name,Composer FROM TRACK T WHERE T.COMPOSER LIKE '%MERCURY%'

--Calcular la media de duración de las pistas (Track) de la plataforma

SELECT AVG(Milliseconds) FROM Track
--Listar los clientes (tabla Customer) de USA, Canada y Brazil

SELECT C.CustomerId,C.FirstName,C.LastName FROM Customer C WHERE C.Country LIKE '%USA%'OR C.Country LIKE '%Canada%' OR C.Country LIKE '%BRAZIL%'

--Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')

SELECT AR.Name AS ArtistName, A.Title AS AlbumTitle, T.Name AS TrackName
FROM Track T
INNER JOIN Album A ON T.AlbumId = A.AlbumId
INNER JOIN Artist AR ON A.ArtistId = AR.ArtistId 
WHERE AR.Name = 'Queen'

--Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie

SELECT T.TrackId, T.Name AS TrackName, AR.Name, T.Composer
FROM Track T
INNER JOIN Album A ON T.AlbumId = A.AlbumId
INNER JOIN Artist AR ON A.ArtistId = AR.ArtistId 
WHERE AR.Name = 'Queen' AND T.Composer LIKE '%BOWIE%'

--Listar las pistas de la playlist 'Heavy Metal Classic'

SELECT T.TrackId,T.Name, P.Name
FROM Playlist P
INNER JOIN PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId
INNER JOIN Track T ON T.TrackId = PT.TrackId
WHERE P.Name = 'Heavy Metal Classic'

--Listar las playlist junto con el número de pistas que contienen

SELECT P.PlaylistId,P.name, COUNT(PT.TrackId) AS 'Number of tracks'
FROM Playlist P
INNER JOIN PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId
GROUP BY P.PlaylistId,P.Name


--Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT DISTINCT P.NAME, T.Composer
FROM Playlist P
INNER JOIN PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId
INNER JOIN Track T ON T.TrackId = PT.TrackId
WHERE T.Composer = 'AC/DC'

--Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT P.PlaylistId, P.Name, COUNT(T.TRACKID) AS 'Number of tracks'
FROM Playlist P
INNER JOIN PlaylistTrack PT ON PT.PlaylistId = P.PlaylistId
INNER JOIN TRACK T ON T.TrackId = PT.TrackId
INNER JOIN Album A ON A.AlbumId = T.AlbumId
INNER JOIN Artist AR ON AR.ArtistId= A.ArtistId
WHERE AR.Name = 'QUEEN' --AR.Artistid =51
GROUP BY  P.PlaylistId, P.Name

--Listar las pistas que no están en ninguna playlist
SELECT *
FROM TRACK T
LEFT JOIN PlaylistTrack PT ON PT.TrackId = T.TrackId 
WHERE PT.PlaylistId IS NULL



--Listar los artistas que no tienen album
SELECT A.NAME
FROM ARTIST A
LEFT JOIN Album AL ON AL.ArtistId= A.ArtistId
WHERE AlbumId IS NULL



--Listar los artistas con el número de albums que tienen
SELECT A.[NAME],A.ARTISTID, COUNT(AL.AlbumId) AS 'NUMBER OF ALBUMS'
FROM Artist A
LEFT JOIN Album AL ON AL.ArtistId = A.ArtistId
GROUP BY A.[NAME],A.ARTISTID



--Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums


