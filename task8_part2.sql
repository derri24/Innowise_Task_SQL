CREATE TRIGGER Ñards_UPDATE 
ON cards
INSTEAD OF UPDATE
AS
  UPDATE cards
  SET cards.balance = (SELECT balance FROM inserted)
  WHERE (SELECT accounts.balance FROM accounts
         WHERE accounts.account_id = (SELECT account_id FROM inserted))>=

  (SELECT SUM(cards.balance) FROM cards 
  JOIN accounts ON accounts.account_id = (SELECT account_id FROM inserted)
  WHERE cards.account_id = (SELECT account_id FROM inserted)) - (SELECT cards.balance 
  WHERE cards.card_id = (SELECT card_id FROM inserted)) + (SELECT balance FROM inserted)
   
GO
