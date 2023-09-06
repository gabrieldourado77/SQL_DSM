-- Atividade 07

-- Exercício 63
CREATE VIEW v_exercicio63 AS
	SELECT 
		o.orderId, o.orderDate, e.firstName, 
		d.productId, d.quantity, p.price, SUM(d.quantity * p.price) AS Total
	FROM 
		Orders o
	INNER JOIN Employees e ON (e.employeeId = o.employeeId)
	INNER JOIN OrderDetails d ON (d.orderId = o.orderId)
	INNER JOIN Products p ON (p.productId = d.productId)
	GROUP BY o.orderId, o.orderDate, e.firstName
	ORDER BY Total DESC;

-- Exercício 64
CREATE VIEW v_exercicio64 AS
	SELECT
		o.OrderID, o.OrderDate, e.FirstName,
		p.ProductName, c.CategoryName, d.Quantity , p.Price,
		d.Quantity * p.Price AS 'Total Produto'
	FROM
		Orders o
	INNER JOIN Employees e ON (e.EmployeeID = o.EmployeeID)
	INNER JOIN OrderDetails d ON (d.orderid = o.orderid)
	INNER JOIN Products p ON (p.ProductID = d.ProductID )
	INNER JOIN Categories c ON (c.CategoryID = p.CategoryID);

-- Exercício 65
CREATE VIEW v_exercicio65 AS
	SELECT
		c.customername,
		SUM(d.Quantity * p.Price) AS 'Total de Vendas',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		Orders o
	INNER JOIN OrderDetails d ON (d.OrderID = o.OrderID)
	INNER JOIN Customers c ON (c.CustomerID = o.CustomerID)
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY c.customername
	ORDER BY 3 DESC;

-- Exercício 66
CREATE VIEW v_exercicio66 AS
	SELECT
		c.categoryname,
		SUM(d.Quantity * p.Price) AS 'Total de Vendas',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		OrderDetails d
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	INNER JOIN Categories c ON (c.categoryid = p.categoryid)
	GROUP BY c.categoryname
	ORDER BY 3 DESC;

-- Exercício 67
CREATE VIEW v_exercicio67 AS
	SELECT
		e.LastName + ', ' + e.FirstName AS 'Empregado',
		SUM(d.Quantity * p.Price) AS 'Total de Vendas',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		Orders o
	INNER JOIN OrderDetails d ON (d.OrderID = o.OrderID)
	INNER JOIN Employees e ON (e.employeeid = o.employeeid)
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY e.LastName + ', ' + e.FirstName
	ORDER BY 3 DESC;

-- Exercício 68
CREATE VIEW v_exercicio68 AS
	SELECT
		s.ShipperName,
		SUM(d.Quantity * p.Price) AS 'Total de Vendas',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		Orders o
	INNER JOIN OrderDetails d ON (d.OrderID = o.OrderID)
	INNER JOIN Shippers s ON (s.ShipperID = o.ShipperID)
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY s.ShipperName
	ORDER BY 3 DESC;

-- Exercício 69
CREATE VIEW v_exercicio69 AS
	SELECT
		p.productname,
		SUM(d.Quantity * p.Price) AS 'Total de Vendas',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		OrderDetails d
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY p.productname
	ORDER BY 3 DESC;

-- Exercício 70
CREATE VIEW v_exercicio70 AS
	SELECT
		s.ShipperName,
		p.ProductName,
		SUM(d.Quantity * p.Price) AS 'Total de Vendas'
	FROM
		Orders o
	INNER JOIN OrderDetails d ON (d.OrderID = o.OrderID)
	INNER JOIN Shippers s ON (s.ShipperID = o.ShipperID)
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY s.ShipperName, p.ProductName
	ORDER BY 'Total de Vendas' DESC;

-- Exercício 71
CREATE VIEW v_exercicio71 AS
	SELECT
		YEAR(o.OrderDate) AS 'Ano',
		MONTH(o.OrderDate) AS 'Mês',
		AVG(d.Quantity * p.Price) AS 'Média de Vendas'
	FROM
		Orders o
	INNER JOIN OrderDetails d ON (d.OrderID = o.OrderID)
	INNER JOIN Products p ON (p.ProductID = d.ProductID)
	GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
	ORDER BY 'Ano' DESC, 'Mês' DESC;

-- Exercício 72
CREATE VIEW v_exercicio72 AS
	SELECT
		DATEPART(mm,OrderDate), MONTH(OrderDate) AS mes,
		DATEPART(day,OrderDate) AS 'dia do ano',
		DATEPART(day,GetDate()) AS 'dia do ano atual',
		DATEPART(day,GetDate()) AS 'dia da semana',
		DATEPART(day,GetDate()) AS 'dia'
	FROM Orders;
