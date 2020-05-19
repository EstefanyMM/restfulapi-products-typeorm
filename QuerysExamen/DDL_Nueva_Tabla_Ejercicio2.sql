CREATE TABLE example.fact_summary(
      CustomerID  INT NOT NULL,
	  CustomerName NVARCHAR (200),
	  SupplierID  INT NOT NULL,
	  SupplierName NVARCHAR (200),
	  mes DATE,
	  anio DATE,
	  Total INT,
	  superoPromedio INT,
	  porcentajeVentaMensual NUMERIC)


CREATE TABLE example.settings (
       [Key] NVARCHAR(100),
	   Value DATE)
 
 INSERT INTO example.settings([Key],Value)
 VALUES ('anio','1997')