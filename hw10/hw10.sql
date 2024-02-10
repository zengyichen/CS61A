CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT parents.child
  FROM parents, dogs
  WHERE parents.parent = dogs.name
  ORDER BY -dogs.height;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name AS name, sizes.size AS size
  FROM dogs, sizes
  WHERE sizes.min < dogs.height AND dogs.height <= sizes.max
  ORDER BY dogs.name;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT dogs1.name AS name1, dogs2.name AS name2, dogs1.size AS size
  FROM size_of_dogs as dogs1, size_of_dogs as dogs2
  WHERE dogs1.size == dogs2.size AND dogs1.name < dogs2.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || name1 || " and " || name2 || ", have the same size: " || size
  FROM siblings LIMIT 2;

-- Height range for each fur type where all of the heights differ by no more than 30% from the average height

CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - Min(height)
  FROM dogs
  GROUP BY fur
  HAVING MAX(height) / AVG(height) <= 1.3 AND MIN(height) / AVG(height) >= 0.7;
