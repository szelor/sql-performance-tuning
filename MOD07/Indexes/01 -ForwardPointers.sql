USE master
GO

IF DB_ID('DataStructures') IS NOT NULL DROP DATABASE DataStructures;
GO
CREATE DATABASE DataStructures
GO
USE DataStructures
GO 
CREATE TABLE dbo.DemoTableHeap(
col1	INT	 		IDENTITY(100,10),
col2	DATETIME 	CONSTRAINT DemoTableHeapCol2Default DEFAULT current_timestamp,
col3	DATETIME 	CONSTRAINT DemoTableHeapCol3Default DEFAULT getdate(),
col4	CHAR(30) 	CONSTRAINT DemoTableHeapCol4Default DEFAULT suser_name(),
col5	CHAR(30) 	CONSTRAINT DemoTableHeapCol5Default DEFAULT user_name(),
col6	CHAR(100) 	CONSTRAINT DemoTableHeapCol6Default DEFAULT 'A heap is a table without a clustered index. Heaps have one row in sys.partitions, with index_id = 0',
col7	VARCHAR(200)CONSTRAINT DemoTableHeapCol7Default DEFAULT 'M.Szeliga')
GO
DECLARE @EndTime DATETIME
SELECT @EndTime = DATEADD(ss, 60, GETDATE())
WHILE GETDATE() <= @EndTime
BEGIN
	INSERT dbo.DemoTableHeap 
	DEFAULT VALUES
END
GO 

EXEC sp_spaceused 'dbo.DemoTableHeap', true

SET STATISTICS IO ON
GO
SELECT * 
FROM dbo.DemoTableHeap 
WHERE col1=3520
GO

SET STATISTICS IO OFF
GO

UPDATE dbo.DemotableHeap
SET col7 = 'Depending on the data types in the heap, each heap structure will have one or more allocation units to store and manage the data for a specific partition.'
WHERE col1 % 7 = 0
GO
SELECT @@ROWCOUNT

EXEC sp_spaceused 'dbo.DemoTableHeap', true

SET STATISTICS IO ON
GO
SELECT * 
FROM dbo.DemoTableHeap 
WHERE col1=3520

SET STATISTICS IO OFF
GO