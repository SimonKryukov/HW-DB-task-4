INSERT INTO musicgenre(genre_id, name)
VALUES  (1, 'Rock'),
		(2, 'Hip Hop'),
		(3, 'Techno'),
		(4, 'Electronic'),
		(5, 'Pop');
			
INSERT INTO artist(artist_id, name)
VALUES  (1, 'Muse'),
		(2, 'Ivan Dorn'),
		(3, 'Solomun'),
		(4, 'Daft Punk'),
		(5, 'Madonna'),
		(6, 'U2'),
		(7, 'Moby'),
		(8, 'Monolink');

INSERT INTO artistgenre(id, artist_id, genre_id)
VALUES  (1, 1, 1),
		(2, 2, 2),
		(3, 3, 3),
		(4, 4, 4),
		(5, 5, 5),
		(6, 6, 1),
		(7, 7, 3),
		(8, 8, 3),
		(9, 5, 2),
		(10, 3, 4),
		(11, 8, 4);

INSERT INTO albums(album_id, name, release_date)
VALUES  (1, 'The Resistance', '14-09-2009'),
		(2, 'Co’n’dorn', '25-05-2012'),
		(3, 'Nobody Is Not Loved', '01-01-2021'),
		(4, 'Human After All', '14-03-2005'),
		(5, 'Rebel Heart', '06-03-2014'),
		(6, 'The Joshua Tree', '09-03-1987'),
		(7, 'Play', '17-05-1999'),
		(8, 'Under Darkening Skies', '01-01-2021'),
		(9, 'Origin of Symmetry', '17-07-2001'),
		(10, 'Home', '01-01-2020'),
		(11, 'Madame X', '14-06-2019');
	
INSERT INTO albumsartists(id, album_id, artist_id)
VALUES  (1, 1, 1),
		(2, 2, 2),
		(3, 3, 3),
		(4, 4, 4),
		(5, 5, 5),
		(6, 6, 6),
		(7, 7, 7),
		(8, 8, 8),
		(9, 9, 1),
		(10, 10, 3),
		(11, 11, 5);

INSERT INTO tracks(tracks_id, name, lenght, album_id)
VALUES  (1, 'Uprising', 5.03, 1),
		(2, 'Undisclosed Desires', 3.56, 1),
		(3, 'Bigudi', 4.52, 2),
		(4, 'Ocean', 3.37, 3),
		(5, 'Technologic', 4.44, 4),
		(6, 'Bitch I"m Madonna', 3.47, 5),
		(7, 'Living for Love', 3.38, 5),
		(8, 'With or Without You', 4.56, 6),
		(9, 'I Still Haven’t Found What I’m Looking For', 4.38, 6),
		(10, 'Porcelain', 4.05, 7),
		(11, 'Otherside', 5.58, 8),
		(12, 'Why Does My Heart Feel So Bad?', 4.29, 7),
		(13, 'Natural Blues', 4.14, 7),
		(14, 'Plug In Baby', 3.40, 9),
		(15, 'New Born', 6.01, 9),
		(16, 'Home', 3.41, 10),
		(17, 'Medellín', 4.58, 11);
	
INSERT INTO mixtapes(mix_tapes_id, name, release_date)
VALUES  (1, 'Hullabaloo Soundtrack', '01-07-2002'),
		(2, 'The Best of 1980–1990', '09-11-1998'),
		(3, 'Finally Enough Love: 50 Number Ones', '19-08-2022'),
		(4, 'The Immaculate Collection', '09-11-1990'),
		(5, 'Celebration', '18-09-2009');

INSERT INTO mixtapestracks(id, tracks_id, mix_tapes_id)
VALUES  (1, 14, 1),
		(2, 15, 1),
		(3, 8, 2),
		(4, 9, 2),
		(5, 6, 3),
		(6, 7, 3);
