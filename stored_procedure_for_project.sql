CREATE PROCEDURE stored_procedure
AS
    DECLARE @fridgeProductsIds TABLE(
		Product_ProductId int
	)
	INSERT INTO @fridgeProductsIds
	SELECT Product_ProductId FROM FridgeProducts WHERE FridgeProducts.Quantity = 0;
 
	DECLARE @Product_ProductId int
	DECLARE @defaultQuntity int
 
	DECLARE curs CURSOR FOR
	SELECT Product_ProductId FROM @fridgeProductsIds
 
	OPEN curs
	FETCH NEXT FROM curs INTO @Product_ProductId 
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @defaultQuntity = (SELECT DefaultQuantity FROM  Products WHERE Products.ProductId = @Product_ProductId)
		UPDATE FridgeProducts  
	    SET Quantity = @defaultQuntity
		WHERE FridgeProducts.Product_ProductId = @Product_ProductId 
		FETCH NEXT FROM curs INTO @Product_ProductId
	END
	CLOSE curs
	DEALLOCATE curs
GO 
 
SELECT * FROM FridgeProducts; 
EXEC stored_procedure;
GO
SELECT * FROM FridgeProducts; 
 