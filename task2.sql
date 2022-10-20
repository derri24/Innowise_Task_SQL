SELECT balance, clients.first_name, clients.last_name, banks.bank_name FROM cards
JOIN clients ON clients.account_id = cards.account_id
JOIN banks ON banks.bank_id = clients.bank_id