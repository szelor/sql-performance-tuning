--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
UPDATE Production.ProductInventory
SET Quantity = 532
WHERE ProductID = 316
AND LocationID = 5


UPDATE Production.Product
SET ReorderPoint = 601
WHERE ProductID = 316

--ROLLBACK