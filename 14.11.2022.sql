SELECT * FROM Categories
SELECT*FROM Suppliers
SELECT*FROM Products
SELECT CategoryID , SupplierID,ProductName FROM Products


--1 �r�nlerin tedarik�i ve kategori
SELECT ProductID,ProductName,CompanyName,CategoryName
FROM 
Suppliers INNER JOIN Products 
ON Products.SupplierID= Suppliers.SupplierID
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID
----------- klasik y�ntem
SELECT ProductID ,ProductName, s.CompanyName, c.CategoryName
FROM Products p, Categories c, Suppliers s
WHERE p.SupplierID = s.SupplierID AND p.CategoryID=c.CategoryID
-----------


-- 2-Kategorisi "Seadfood" olan �r�nler
SELECT ProductID ,ProductName, c.CategoryID
FROM Products p , Categories c WHERE p.CategoryID=c.CategoryID
AND c.CategoryName='Seafood'
------
SELECT ProductID ,ProductName, c.CategoryID
FROM Products p INNER JOIN Categories c ON p.CategoryID=c.CategoryID
WHERE c.CategoryName='Seafood'
----3-Tedarik�cisi london olan �r�nler
SELECT * FROM Products p, Suppliers s
WHERE p.SupplierID=s.SupplierID
AND City='Lodon'
-------
SELECT * FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE City = ' London'

--Hangi kategori ad�nda ka�ar tane �r�n var
SELECT CategoryName, COUNT(*) AS Kategori FROM Categories c, Products p WHERE c.CategoryID=p.CategoryID
--10 dan fazla olanlar� getir
GROUP BY c.CategoryName HAVING COUNT(*) >=10
--k���kten b�y�k s�ralama
ORDER BY Kategori DESC