.mode	columns
.headers	on
.nullvalue	NULL

PRAGMA foreign_keys = ON;


-- 8.2
/*SELECT name
FROM User
WHERE name NOT IN (
    SELECT name
    FROM Photo, User
    WHERE Photo.user = User.id
)*/


-----------------------------------------------------------------

-- 8.3
/*
SELECT avg(numeroUsers)
FROM
(
    SELECT photo, count(*) AS numeroUsers
    FROM AppearsIn
    WHERE AppearsIn.photo IN
    (
        SELECT photo
        FROM Likes
        GROUP BY photo
        HAVING count(user) > 3    
    )
    GROUP BY photo
);
*/

-----------------------------------------------------------------

-- 8.4

SELECT caption FROM Photo
WHERE id IN
(
    SELECT photo
    FROM AppearsIn
    WHERE user IN
    (
        SELECT id FROM User WHERE name LIKE "Daniel Ramos"
        UNION
        SELECT user2 AS id FROM Friend WHERE user1 IN (
            SELECT id FROM User WHERE name LIKE "Daniel Ramos"
        )
        UNION
        SELECT user2 AS id FROM Friend WHERE user1 IN (
            SELECT user2 AS id FROM Friend WHERE user1 IN (
                SELECT id FROM User WHERE name LIKE "Daniel Ramos"
            )        
        )
    )
)
