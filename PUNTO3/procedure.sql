DELIMITER //
CREATE PROCEDURE GetMoviesCountByYear(IN yearReleased VARCHAR(4))
BEGIN
  SELECT count(*) AS moviesNumber
FROM
  `pruebamysql`.`movies`
WHERE
  year_released = yearReleased;
END//
DELIMITER ;