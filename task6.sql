SELECT acc.account_id,acc.balance,
CASE WHEN (acc.balance<(SELECT SUM(c.balance) FROM cards c
WHERE acc.account_id = c.account_id)) 
	THEN '0'
ELSE
	(acc.balance-(SELECT SUM(c.balance) FROM cards c
	WHERE acc.account_id = c.account_id))
	END AS 'available' FROM accounts acc