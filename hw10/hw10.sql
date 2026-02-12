CREATE TABLE parents (parent TEXT, child TEXT);





INSERT INTO parents VALUES
  ('ace', 'bella'),
  ('ace', 'charlie'),
  ('daisy', 'hank'),
  ('finn', 'ace'),
  ('finn', 'daisy'),
  ('finn', 'ginger'),
  ('ellie', 'finn');

CREATE TABLE dogs (name TEXT, fur TEXT, height INTEGER);

INSERT INTO dogs VALUES
  ('ace',     'long',  26),
  ('bella',   'short', 52),
  ('charlie', 'long',  47),
  ('daisy',   'long',  46),
  ('ellie',   'short', 35),
  ('finn',    'curly', 32),
  ('ginger',  'short', 28),
  ('hank',    'curly', 31);

CREATE TABLE sizes (size TEXT, min INTEGER, max INTEGER);

INSERT INTO sizes VALUES
  ('toy',      24, 28),
  ('mini',     28, 35),
  ('medium',   35, 45),
  ('standard', 45, 60);


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
    SELECT
        child
    FROM
    (
    SELECT 
        child, height
    FROM
        parents, dogs
    WHERE
        parents.parent == dogs.name
    ORDER BY height DESC);;
    


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
    FROM
        dogs, sizes
    WHERE
        dogs.height > sizes.min AND dogs.height <= sizes.max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
    SELECT one.child AS child1, two.child AS child2
    FROM
    parents as one, parents as two
    WHERE
    one.parent = two.parent AND one.child<two.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
    SELECT
        "The two siblings, " || siblings.child1 || " and " || siblings.child2 || ", have the same size: " || s1.size
    FROM
        siblings,
        size_of_dogs AS s1,
        size_of_dogs AS s2
    WHERE
        siblings.child1 = s1.name AND 
        siblings.child2 = s2.name AND
        s1.size = s2.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
    SELECT
        fur, MAX(height) - MIN(height)
    FROM
        dogs
    GROUP BY
        fur
    HAVING
        MIN(height) >= 0.7 * AVG(height) AND MAX(height) <= 1.3 * AVG(height);

