DROP DATABASE IF EXISTS home_work_seminar6;
CREATE DATABASE home_work_seminar6;
USE home_work_seminar6;
DROP PROCEDURE IF EXISTS format_sec;
DELIMITER $$
CREATE PROCEDURE format_sec
(second_count INT, 
OUT format_string VARCHAR(100))
BEGIN

DECLARE days INT;
DECLARE hours INT;
DECLARE minutes INT;
DECLARE seconds INT;

SET days := second_count / 86400;
SET seconds := second_count % 86400;
SET hours := seconds / 3600;
SET seconds := seconds % 3600;
SET minutes := seconds / 60;
SET seconds := seconds % 60;
SET format_string := CONCAT(days, " days ", hours, " hours ",  minutes, " minutes ", seconds, " seconds");

END $$

DELIMITER ;


CALL format_sec(1, @format_time_string);
SELECT @format_time_string;