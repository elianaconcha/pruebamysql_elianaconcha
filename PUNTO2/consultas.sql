SELECT * FROM `pruebamysql`.`members` WHERE gender = 'male' ORDER BY full_names DESC;

SELECT * FROM `pruebamysql`.`movies` WHERE title LIKE '%a%' ORDER BY year_released;

SELECT * FROM `pruebamysql`.`categories` ORDER BY length(category_name);

DELETE FROM `pruebamysql`.`members` WHERE full_names LIKE '%ca%';

SELECT DISTINCT m.* FROM `pruebamysql`.`members` m JOIN `pruebamysql`.`movierentals` mr ON (m.membership_number = mr.membership_number);

SELECT count(*) as moviesNumber, year_released FROM `pruebamysql`.`movies` GROUP BY year_released;

INSERT INTO `pruebamysql`.`movies` (`movie_id`, `title`, `director`, `year_released`, `category_id`) VALUES (4, 'The Conjuring 2', 'James Wan', '2016', '4')
ON DUPLICATE KEY UPDATE
  `title` = 'The Conjuring 2', `director` = 'James Wan', `year_released` = '2015', `category_id` = '4';
  
  