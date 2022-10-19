CREATE PROCEDURE task5
	@social_status_id int
AS
	IF (@social_status_id NOT IN (SELECT social_statuses.social_status_id FROM  social_statuses))
	BEGIN
		PRINT 'index not found'
		RETURN
	END
	IF (@social_status_id NOT IN (SELECT clients.social_status_id FROM  clients))
	BEGIN
		PRINT 'this social status not used by clients'
		RETURN
	END
	ELSE
	BEGIN 
		UPDATE	accounts
		SET accounts.balance = accounts.balance + 10
		FROM
			(SELECT accounts.balance FROM accounts
			JOIN clients ON clients.account_id = accounts.account_id
			JOIN social_statuses ON social_statuses.social_status_id = clients.social_status_id
			WHERE social_statuses.social_status_id = @social_status_id) AS Selected
	END
GO 
 
SELECT * from accounts
EXEC task5 7;
GO
SELECT * from accounts