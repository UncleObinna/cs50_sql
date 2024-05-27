SELECT "first_name", "last_name", ("salary"/"H") AS 'dollars per hit' FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
WHERE "H" > 0 AND "performances"."year" = 2001
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;