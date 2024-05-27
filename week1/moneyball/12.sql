SELECT first_name, last_name FROM players
JOIN performances ON players.id = performances.player_id 
JOIN salaries ON players.id = salaries.player_id 
WHERE performances.year = salaries.year AND salaries.year = 2001
ORDER BY salaries.salary / performances.H ORDER BY players.first_name, players.last_name
 