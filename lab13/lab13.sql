.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING COUNT(smallest) = 1;


CREATE TABLE matchmaker AS
  SELECT table1.pet, table1.song, table1.color, table2.color
  FROM students AS table1, students AS table2
  WHERE table1.pet = table2.pet AND table1.song = table2.song AND table1.time < table2.time;


CREATE TABLE sevens AS
  SELECT students.seven
  FROM students, numbers
  WHERE students.smallest <= 7 AND numbers.'7' = 'True' AND students.time = numbers.time;

