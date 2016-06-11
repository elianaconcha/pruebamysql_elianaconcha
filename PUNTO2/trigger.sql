DELIMITER $$

CREATE TRIGGER before_insert_allow_year_valid
  BEFORE INSERT ON movies FOR EACH ROW
  BEGIN
    IF (NEW.year_released NOT REGEXP '^([0-9]{4})?$')
THEN
  SET NEW.year_released = '2000';
END IF;
END;
$$
