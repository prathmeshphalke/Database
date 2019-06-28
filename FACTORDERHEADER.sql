
TRUNCATE TABLE Fact_OrderHeader
INSERT INTO Fact_OrderHeader
SELECT Customer_Dim_Key, OrderNumber , SUM(SaleAmountPrice) As TotalAmount,MAX(OrderLineNumber) As MaxOrderLine, 
SUM(SaleAmountPrice)/MAX(OrderLineNumber) AS AvgPrice,ROW_NUMBER() OVER (partition BY customer_dim_key Order BY ORDERNUMBER) AS NthOrder,
SYSDATETIME(),SYSDATETIME(),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
from Fact_OrderDetail GROUP BY Customer_Dim_Key ,OrderNumber,Date_Dim_Key



