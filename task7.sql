CREATE PROCEDURE task7
  @recipient_card_id int,
  @amount_money real
AS
 
DECLARE @account_id int
DECLARE @account_balance real
DECLARE @cards_balance int
 
BEGIN TRANSACTION
SET @account_id = (SELECT cards.account_id FROM cards WHERE cards.card_id = @recipient_card_id)
 
SET @account_balance = (SELECT accounts.balance FROM accounts WHERE accounts.account_id = @account_id)
 
SET @cards_balance= (SELECT SUM(cards.balance) FROM cards 
  JOIN accounts ON accounts.account_id = cards.account_id
  WHERE cards.account_id = @account_id)
 
IF (@account_balance-@cards_balance - @amount_money >= 0)  
BEGIN
  UPDATE cards 
  SET cards.balance = cards.balance+@amount_money
  WHERE cards.card_id = @recipient_card_id; 
END
ELSE
  PRINT 'you don`t send money'
COMMIT
GO 
 
SELECT * FROM cards
SELECT * FROM accounts
EXEC task7 12, 5;
GO
SELECT * FROM cards
SELECT * FROM accounts