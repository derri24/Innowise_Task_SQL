CREATE TRIGGER Accounts_UPDATE
ON accounts
INSTEAD OF UPDATE
AS
  UPDATE accounts
  SET accounts.balance = (SELECT balance FROM inserted)
     WHERE ((SELECT balance FROM inserted) >= (SELECT SUM(cards.balance) FROM cards 
     JOIN accounts ON accounts.account_id = cards.account_id
     WHERE cards.account_id = (SELECT account_id FROM inserted))) 
     AND accounts.account_id=(SELECT account_id FROM inserted)
GO
