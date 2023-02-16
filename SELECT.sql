--1) количество исполнителей в каждом жанре;
SELECT genre_id, count(artist_id) FROM artistgenre
GROUP BY genre_id
ORDER BY count(artist_id) DESC;

--2) количество треков, вошедших в альбомы 2019-2020 годов;
SELECT t.name, count(tracks_id) FROM tracks t
WHERE album_id IN(
	SELECT album_id FROM albums 
	WHERE release_date BETWEEN '2019-01-01' AND '2020-12-31'
)
GROUP BY t.name;

--3) средняя продолжительность треков по каждому альбому;
SELECT album_id, AVG(lenght) FROM tracks
GROUP BY album_id 
ORDER BY AVG(lenght) DESC;

--4) все исполнители, которые не выпустили альбомы в 2020 году;
SELECT a.name FROM artist a
JOIN albumsartists al ON a.artist_id = al.id
JOIN albums alb ON al.id = alb.album_id
WHERE release_date NOT BETWEEN '2020-01-01' AND '2020-12-31';

--5) названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
--Почему то не находит все альбомы... Например "Muse" вбиваешь, не находит второй альбом и собственно сборник....
SELECT DISTINCT m.name, t.name, a.name FROM mixtapes m 
JOIN mixtapestracks mix ON m.mix_tapes_id = mix.mix_tapes_id
JOIN tracks t ON mix.tracks_id = t.tracks_id
JOIN albums alb ON t.album_id = alb.album_id
JOIN albumsartists al ON alb.album_id = al.artist_id 
JOIN artist a ON al.artist_id = a.artist_id 
WHERE a.name = 'Madonna';

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
SELECT DISTINCT al.name FROM albums al
JOIN tracks t ON al.album_id = t.album_id
WHERE t.album_id IN(
	SELECT COUNT(album_id) FROM tracks
	GROUP BY album_id
	ORDER BY album_id 
);


















