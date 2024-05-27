SELECT "salary" FROM "salaries" WHERE player_id = (
    SELECT "player_id" FROM "performances"
    WHERE "performances"."year" = 2001
    ORDER BY "HR" DESC
    LIMIT 1)
ORDER BY "year" DESC
LIMIT 1;