SELECT bank_name, cities.city_name FROM banks
INNER JOIN branches on branches.bank_id=banks.bank_id
INNER JOIN branch_city on branch_city.branch_id = branches.branch_id
INNER JOIN cities on cities.city_id = branch_city.city_id
WHERE cities.city_name = 'Минск'