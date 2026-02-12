CREATE table newest AS
    SELECT title, year
    FROM titles
    ORDER BY year DESC
    LIMIT 10;

CREATE table dog_movies AS 
    SELECT title, character
    FROM titles JOIN principals ON principals.tconst=titles.tconst
    WHERE
    principals.character LIKE "%dog%";


CREATE table leads AS 
    SELECT name, count(*)
    FROM names JOIN principals ON principals.nconst == names.nconst
    WHERE principals.ordering == 1
    GROUP BY names.nconst HAVING count(*) > 10;



CREATE table long_movies AS 
    SELECT (FLOOR(year/10)*10) || "s" as decade, count(*) AS count
    FROM titles
    WHERE
        runtime > 180
    GROUP BY decade HAVING count;
