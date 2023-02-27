--1) количество исполнителей в каждом жанре;
SELECT genre_id, count(artist_id) FROM artistgenre
GROUP BY genre_id
ORDER BY count(artist_id) DESC;

--2) количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(t.tracks_id) FROM tracks t
INNER JOIN albums alb ON t.album_id = alb.album_id
WHERE alb.release_date BETWEEN '2019-01-01' AND '2020-12-31';

--3) средняя продолжительность треков по каждому альбому;
SELECT album_id, AVG(lenght) FROM tracks
GROUP BY album_id 
ORDER BY AVG(lenght) DESC;

--4) все исполнители, которые не выпустили альбомы в 2020 году;
SELECT a.name FROM artist a
WHERE a.artist_id NOT IN (
    SELECT DISTINCT albumsartists.artist_id FROM albums alb
    INNER JOIN albumsartists ON alb.album_id = albumsartists.album_id
    WHERE alb.release_date >= '2020-01-01' AND alb.release_date <= '2020-12-31'
);

--5) названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT mixtapes.name FROM mixtapes
INNER JOIN mixtapestracks ON mixtapes.mix_tapes_id = mixtapestracks.mix_tapes_id
INNER JOIN tracks ON mixtapestracks.tracks_id = tracks.tracks_id
INNER JOIN albums ON tracks.album_id = albums.album_id
INNER JOIN albumsartists ON albums.album_id = albumsartists.album_id
INNER JOIN artist ON albumsartists.artist_id = artist.artist_id
WHERE Artist.name = 'Muse';

--6) название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT al.name, COUNT(ar.artist_id) FROM albums al
JOIN albumsartists alb ON al.album_id = alb.album_id
JOIN artistgenre ar ON alb.artist_id = ar.artist_id
GROUP BY al.name
HAVING COUNT(ar.artist_id) > 1;

--7) наименование треков, которые не входят в сборники;
SELECT t.name FROM tracks t 
LEFT JOIN mixtapestracks mix ON t.tracks_id = mix.tracks_id
WHERE mix.tracks_id IS NULL;

--8) исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT a.name, t.name, t.lenght FROM tracks t
JOIN albums al ON t.album_id = al.album_id 
JOIN albumsartists alb ON al.album_id = alb.album_id 
JOIN artist a ON alb.artist_id = a.artist_id 
ORDER BY t.lenght;

--или

SELECT a.name, t.name, t.lenght FROM artist a
JOIN albumsartists alb ON a.artist_id  = alb.artist_id 
JOIN albums al ON alb.album_id = al.album_id 
JOIN tracks t ON al.album_id = t.album_id
WHERE t.lenght = (SELECT MIN(lenght) FROM tracks);

--9) название альбомов, содержащих наименьшее количество треков.
SELECT alb.name FROM albums alb
INNER JOIN (
    SELECT album_id, COUNT(*) AS tracks_count
    FROM tracks
    GROUP BY album_id
) AS track_counts ON alb.album_id = track_counts.album_id
WHERE track_counts.tracks_count = (
    SELECT MIN(tracks_count)
    FROM (
        SELECT album_id, COUNT(*) AS tracks_count
        FROM tracks
        GROUP BY album_id
    ) AS album_track_counts
);

















