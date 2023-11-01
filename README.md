# Ejercicio de Consultas SQL 

Este repositorio contiene una serie de consultas SQL diseñadas para iniciarse en los conceptos esenciales de SQL. Las consultas se basan en una base de datos de una plataforma musical y abordan diferentes tipos de consultas, desde filtrar datos hasta realizar cálculos y combinaciones de tablas. A continuación, se presenta una breve explicación de cada consulta y el procedimiento seguido para llevarla a cabo:

- **Consulta 1:** Listar las pistas con un precio mayor o igual a 1€. Esta consulta selecciona las pistas de la tabla Track con un precio unitario (UnitPrice) igual o superior a 1.

- **Consulta 2:** Listar las pistas de más de 4 minutos de duración. Se declaró una variable para los milisegundos por minuto y luego se seleccionaron las pistas con una duración (en milisegundos) mayor o igual a 4 minutos.

- **Consulta 3:** Listar las pistas que tienen entre 2 y 3 minutos de duración. Aquí se seleccionan las pistas con una duración entre 2 y 3 minutos utilizando un rango en la cláusula WHERE.

- **Consulta 4:** Listar las pistas en las que uno de sus compositores sea "Mercury". Esta consulta filtra las pistas cuyo campo Composer contiene la palabra "Mercury" de forma parcial.

- **Consulta 5:** Calcular la duración media de las pistas en la plataforma. Se utiliza la función AVG para calcular la duración promedio de todas las pistas en la tabla Track.

- **Consulta 6:** Listar los clientes de USA, Canada y Brazil. Aquí se filtran los clientes de la tabla Customer que son de los países mencionados utilizando la cláusula WHERE con operadores OR.

- **Consulta 7:** Listar todas las pistas del artista 'Queen'. Se realiza una unión entre las tablas Track, Album y Artist para obtener las pistas del artista 'Queen' junto con el nombre del álbum al que pertenecen.

- **Consulta 8:** Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie. Similar a la consulta anterior, pero se filtra por pistas donde 'Queen' sea el artista y 'Bowie' esté en el campo Composer.

- **Consulta 9:** Listar las pistas de la playlist 'Heavy Metal Classic'. Se combinan las tablas Playlist, PlaylistTrack y Track para obtener las pistas de la playlist 'Heavy Metal Classic'.

- **Consulta 10:** Listar las playlists junto con el número de pistas que contienen. Se realiza una agregación para contar las pistas en cada playlist utilizando GROUP BY.

- **Consulta 11:** Listar las playlists que tienen alguna canción de AC/DC. Se busca en la tabla PlaylistTrack y Track si existe alguna pista con el compositor 'AC/DC'.

- **Consulta 12:** Listar las playlists que tienen alguna canción del artista 'Queen', junto con la cantidad que tienen. Similar a la consulta anterior, pero se filtra por el nombre del artista 'Queen'.

- **Consulta 13:** Listar las pistas que no están en ninguna playlist. Se utiliza una LEFT JOIN entre Track y PlaylistTrack para identificar las pistas que no están en ninguna playlist.

- **Consulta 14:** Listar los artistas que no tienen álbum. Se realiza una LEFT JOIN entre Artist y Album para identificar los artistas sin álbumes.

- **Consulta 15:** Listar los artistas con el número de álbumes que tienen. Se utiliza una LEFT JOIN entre Artist y Album para contar los álbumes de cada artista y se agrupa por el nombre del artista.

# Ejercicio de Consultas SQL (EXTRA)

1. **Listar las pistas más compradas:** En esta consulta, se seleccionan las pistas que han sido compradas más de una vez. Se hace una unión entre las tablas `InvoiceLine` y `Track` para obtener los datos de las pistas compradas y se agrupan por nombre de pista. Luego, se filtran las pistas con más de una compra y se ordenan en orden descendente por la cantidad de compras.

2. **Listar las pistas ordenadas por el número de veces que aparecen en playlists:** Esta consulta muestra las pistas ordenadas por la cantidad de veces que aparecen en playlists, en orden descendente. Se hace una unión entre las tablas `Track` y `PlaylistTrack`, se agrupan por el ID de la pista y su nombre, y luego se ordenan en orden descendente según la cuenta de veces que aparecen en playlists.

3. **Listar los artistas más comprados:** En esta consulta, se obtienen los artistas que han tenido más de 5 compras de sus pistas. Se hace una serie de uniones entre las tablas `InvoiceLine`, `Track`, `Album`, y `Artist` para obtener los datos de los artistas y las compras. Luego, se agrupan por el ID del artista y su nombre, y se filtran los artistas con más de 5 compras, ordenándolos en orden descendente por la cantidad de compras.

4. **Listar las pistas que aún no han sido compradas por nadie:** En esta consulta, se obtienen las pistas que no han sido compradas por nadie. Se realiza una unión izquierda (LEFT JOIN) entre las tablas `Track` e `InvoiceLine`, y se filtran las pistas que no tienen una entrada en la tabla `InvoiceLine` (donde `InvoiceLineId` es nulo).

5. **Listar los artistas que aún no han vendido ninguna pista:** En esta consulta, se obtienen los artistas que no han vendido ninguna pista. Se utiliza una subconsulta para encontrar los artistas que han vendido pistas a través de las tablas `Artist`, `Album`, `Track`, y `InvoiceLine`, y luego se filtran los artistas que no están en esa lista de artistas que han vendido pistas.


