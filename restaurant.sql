
-- table create restaurant
CREATE TABLE restaurant(
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(20),
    distance_from_headquarters_in_miles float(1),
    stars integer NOT NULL CHECK (stars >= 0 AND stars < 6),
    category_by_type_of_food varchar,
    favorite_dish varchar DEFAULT 'none',
    does_takeout varchar(1) NOT NULL DEFAULT 'N',
    last_visit date
);

INSERT INTO restaurant VALUES
--  id        name        D   S   category    fav      takeout?      date 
(
    DEFAULT, 'mcdonalds', 10, 1, 'fast food', DEFAULT, DEFAULT, '01-12-2000'
),
(
    DEFAULT, 'whataburger', 1, 4, 'fast food', 'patty melt', DEFAULT, '01-3-2019'
),
(
    DEFAULT, 'dominoes', 4, 2, 'fast food', 'peperoni', 'Y', '01-10-2018'
),
(
    DEFAULT, 'popeyes', 12, 5, 'fast food', 'chicken tenders', DEFAULT, '01-10-2019'
),
(
    DEFAULT, 'olive garden', 10, 3, 'restaurant', 'chicken alfredo', 'Y', '01-12-2018'
),
(
    DEFAULT, 'ninfas', 4, 4, 'restaurant', 'enchiladas', 'Y', '08-12-2018'
),
(
    DEFAULT, 'rice box', 8, 5, 'take-out', 'general/s tso chicken', 'Y', '09-28-2018'
),
(
    DEFAULT, 'moon tower', .5, 5, 'take-out', 'burger', 'Y', '12-16-2010'
);


-- postgresql exercises

SELECT name FROM restaurant WHERE stars = 5;

SELECT favorite_dish FROM restaurant WHERE stars = 5;

SELECT id FROM restaurant WHERE name = 'moon tower';

SELECT name FROM restaurant WHERE category_by_type_of_food = 'fast food';

SELECT name FROM restaurant WHERE does_takeout = 'Y';

SELECT name FROM restaurant WHERE does_takeout = 'Y' AND category_by_type_of_food = 'fast food';

SELECT name FROM restaurant WHERE distance_from_headquarters_in_miles < 2;

SELECT name FROM restaurant WHERE last_visit < now() - interval '7 days';

SELECT name from restaurant WHERE last_visit < now() - interval '7 days' AND stars = 5;



-- postgresql aggregation and sorting queries exercises

SELECT * FROM restaurant ORDER BY distance_from_headquarters_in_miles ASC;

SELECT * FROM restaurant ORDER BY distance_from_headquarters_in_miles ASC limit 2;

SELECT * FROM restaurant WHERE distance_from_headquarters_in_miles < 2 ORDER BY stars DESC;

SELECT count(*) FROM restaurant;

SELECT category_by_type_of_food, count(*) FROM restaurant GROUP BY category_by_type_of_food;

SELECT category_by_type_of_food, AVG(stars) FROM restaurant GROUP BY category_by_type_of_food;

SELECT category_by_type_of_food, MAX(stars) FROM restaurant GROUP BY category_by_type_of_food;