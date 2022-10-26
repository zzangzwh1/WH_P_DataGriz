--Drop procedure   InsertOrderDetails
Create Procedure  InsertOrderDetails(
@OrderID int,
@ProductID int,
@Quantity int,
@Message varchar(80) output


)
AS
BEGIN
INSERT INTO [Order Details](OrderID,ProductID,Quantity)
VALUES (@OrderID,@ProductID,@Quantity)
IF @@ROWCOUNT >0
		BEGIN 
			SELECT @Message = 'Record Inserted'
			END
			ELSE
			BEGIN
				SELECT @Message = 'No Records Insert, possible Error'
				END
    -- check row count
	RETURN
END 
go

--DECLARE @Msg VARCHAR(80)
--EXEC InsertOrderDetails 11077,100,2,@Message = @Msg OUTPUt;
--Print @Msg
--Go