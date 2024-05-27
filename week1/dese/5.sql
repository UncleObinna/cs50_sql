SELECT "city", COUNT(type) FROM "districts" WHERE type = 'Public School District' GROUP BY "city"
HAVING COUNT(city) <= 3  ORDER BY COUNT(type) DESC, "city";