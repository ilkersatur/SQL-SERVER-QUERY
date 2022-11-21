SELECT * FROM Categories
SELECT*FROM Suppliers
SELECT*FROM Products
SELECT CategoryID , SupplierID,ProductName FROM Products


--1 ürünlerin tedarikçi ve kategori
SELECT ProductID,ProductName,CompanyName,CategoryName
FROM 
Suppliers INNER JOIN Products 
ON Products.SupplierID= Suppliers.SupplierID
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID
----------- klasik yöntem
SELECT ProductID ,ProductName, s.CompanyName, c.CategoryName
FROM Products p, Categories c, Suppliers s
WHERE p.SupplierID = s.SupplierID AND p.CategoryID=c.CategoryID
-----------


-- 2-Kategorisi "Seadfood" olan ürünler
SELECT ProductID ,ProductName, c.CategoryID
FROM Products p , Categories c WHERE p.CategoryID=c.CategoryID
AND c.CategoryName='Seafood'
------
SELECT ProductID ,ProductName, c.CategoryID
FROM Products p INNER JOIN Categories c ON p.CategoryID=c.CategoryID
WHERE c.CategoryName='Seafood'
----3-Tedarikçcisi london olan ürünler
SELECT * FROM Products p, Suppliers s
WHERE p.SupplierID=s.SupplierID
AND City='Lodon'
-------
SELECT * FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE City = ' London'

--Hangi kategori adýnda kaçar tane ürün var
SELECT CategoryName, COUNT(*) AS Kategori FROM Categories c, Products p WHERE c.CategoryID=p.CategoryID
--10 dan fazla olanlarý getir
GROUP BY c.CategoryName HAVING COUNT(*) >=10
--küçükten büyük sýralama
ORDER BY Kategori DESC