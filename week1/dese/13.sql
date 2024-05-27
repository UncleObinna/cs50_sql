SELECT "name", "city", AVG("dropped") AS 'Average student drop out' FROM "schools"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
GROUP BY "name";