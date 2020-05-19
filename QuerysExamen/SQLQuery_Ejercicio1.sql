WITH AgrupacionVendido AS(
SELECT 
     ord.CustomerID,
	 c.CustomerName,
     s.SupplierId,
	 s.SupplierName,
	 ord.OrderDate,
	  month(ord.OrderDate) as mesP,
	sum( o.QUantity * p.Price) as Total
   from example.Products as p
   INNER JOIN  example.Suppliers as s
   on p.SupplierID = s.SupplierID
   INNER JOIN example.OrderDetails as o
   on p.ProductID = o.ProductID
   INNER JOIN example.[Order] as ord
   on o.OrderID = ord.OrderID
   INNER JOIN example.Customers as c
   on ord.CustomerID =  c.CustomerID 
   Group by   ord.CustomerID,
	          c.CustomerName,
              s.SupplierId,
	          s.SupplierName,
			  ord.OrderDate
)
			  
select 
     CustomerID,
	 CustomerName,
     SupplierId,
	 SupplierName,
	 month(OrderDate) as mes,
     year(OrderDate) as anio,
	 Total,
	 case 
	     when month(OrderDate) = 1 and avg(total/1) < Total then '0'
		 when month(OrderDate) = 2 and avg(total/2) < Total then '0'
		 when month(OrderDate) = 7 and avg(total/7) < Total then '0'
		 when month(OrderDate) = 8 and avg(total/8) < Total then '0'
		 when month(OrderDate) = 9 and avg(total/9) < Total then '0'
		 when month(OrderDate) = 10 and avg(total/10) < Total then '0'
		 when month(OrderDate) = 11 and avg(total/11) < Total then '0'
		 when month(OrderDate) = 12 and avg(total/12) < Total then '0'
		 else '1'
	 end as superoPromedio, 
	 avg((Total/mesP)/100) as porcentajeVentaMensual
	
from AgrupacionVendido
group by 
     CustomerID,
	 CustomerName,
     SupplierId,
	 SupplierName,
	 month(OrderDate),
     year(OrderDate),
	 Total
	
         		
			

  