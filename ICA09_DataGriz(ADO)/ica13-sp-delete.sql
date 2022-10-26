IF EXISTS (SELECT [NAME] FROM SYSOBJECTS WHERE [NAME] = 'DeleteOrderDetails')
DROP PROCEDURE DeleteOrderDetails
GO


Create Procedure DeleteOrderDetails(
	@OrderID int,
	@ProductID int,
	@Message VARCHAR(80) OUTPUT

)
As
Begin
delete 
 FROM [Order Details]
	WHERE OrderID =@OrderID AND ProductID =@ProductID
	IF @@ROWCOUNT >0
		BEGIN 
			SELECT @Message = 'Record Delete'
			END
			ELSE
			BEGIN
				SELECT @Message = 'No Records Deleted, possible Error'
				END
    -- check row count
	RETURN
END

DECLARE @Msg VARCHAR(80)
EXEC DeleteOrderDetails 11077,1,@Message = @Msg OUTPUt;
Print @Msg
Go