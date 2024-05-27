SELECT "name", SUM("H") AS 'total hits' FROM "teams"
JOIN "performances" on "teams"."id" = "performances"."team_id"
where "performances"."year" = 2001
GROUP BY "performances"."team_id"
ORDER BY "total hits" DESC
LIMIT 5;