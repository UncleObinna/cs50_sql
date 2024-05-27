SELECT "first_name", "last_name", "salary", "HR", "performances"."year" FROM "performances"
JOIN "players" ON "performances"."player_id" = "players"."id"
JOIN "salaries" ON "players"."id" = "salaries"."player_id" AND "performances"."year" = "salaries"."year"
ORDER BY "players"."id" ASC, "salaries"."year" DESC, "HR" DESC, "salary" DESC;