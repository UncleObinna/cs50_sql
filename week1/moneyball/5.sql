-- select name from teams where id = (
--     select team_id from performances where player_id = (
--         select id from players where first_name = 'Satchel' and last_name = 'Paige'
--     )
-- )
-- group by id;

SELECT "name" FROM "teams" 
JOIN "performances" ON "performances"."team_id" = "teams"."id"
JOIN "players" ON "players"."id" = "performances"."player_id"
WHERE "players"."first_name" = 'Satchel';