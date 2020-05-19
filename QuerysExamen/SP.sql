CREATE PROCEDURE example.SP_LLENAR_DATOS
      @CustomerID int, 
	  @CustomerName NVARCHAR (200),
	  @SupplierID int,
	  @SupplierName NVARCHAR(200),
	  @mes DATE,
	  @anio DATE,
	  @Total INT,
	  @superoPromedio INT,
	  @porcentajeVentaMensual NUMERIC
AS
DECLARE @existe INT =(select count(*) as N from example.Customers WHERE CustomerID=@CustomerID)
DECLARE @existe2 INT =(select count(*) as X from example.Suppliers WHERE SupplierID=@SupplierID)
if @existe > 0 Begin
       select 0 as succesed, 'Id ya existe' as MSG
end else begin
       INSERT INTO example.Customers
	   VALUES (@CustomerID, @CustomerName)

	  INSERT INTO example.Suppliers
	  VALUES(
	  @SupplierID,
	  @SupplierName,
	  @mes,
	  @anio,
	  @Total,
	  @superoPromedio,
	  @porcentajeVentaMensual)
     select 1 as succesed, 'registro almacenado' as MSG
END




INSERT INTO example.fact_summary (CustomerID)SELECT CustomerID FROM example.Customers

INSERT INTO example.fact_summary (SupplierID)SELECT SupplierID FROM example.Suppliers

