SELECT acc.account_id, acc.account_number, acc.balance,acc.balance-
(SELECT SUM(c.balance) FROM cards c
WHERE acc.account_id = c.account_id ) AS 'difference'
FROM accounts acc

WHERE (acc.balance- 
(SELECT SUM(c.balance) FROM cards c
WHERE acc.account_id = c.account_id )) != 0