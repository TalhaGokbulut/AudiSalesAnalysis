--1-ürün bazlı ortalama sipariş tutarı  
Select M.ModelName,
format(avg(O.Quantity*M.SalePrice),'N2','tr-TR') as AvgOrderAmount
from Orders O
join Models M on M.ModelId=O.ModelId
group by M.ModelName
order by AvgOrderAmount desc
--2- mağaza bazlı satış dağılımı  
Select S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Stores S on S.StoreId=O.StoreId
join Models M on M.ModelId=O.ModelId
group by S.StoreName
order by TotalAmount desc
--3- en çok satılan ürün  
Select M.ModelName,
sum(O.Quantity) as TotalQuantity
from Orders O
join Models M on M.ModelId=O.ModelId
group by M.ModelName
order by TotalQuantity desc
--4-Müşteri bazlı toplam satış adedi  
select C.CustomerName,C.LastName,
sum(O.Quantity) as TotalSpending
from Orders O
join Customers C on C.CustomerId=O.CustomerId
group by C.CustomerName,C.LastName
order by TotalSpending desc
--5-ürün bazlı toplam tutar  
Select M.ModelName,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Models M on M.ModelId=O.ModelId
group by M.ModelName
order by TotalAmount desc
-- 6-hangi şehirde ne kadar satış yapılmış  
SELECT S.City,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Stores S on S.StoreId=O.StoreId
join Models M on M.ModelId=O.ModelId
group by S.City
ORDER BY TotalAmount DESC
--7-hangi mağazada ne kadar satış yapılmış  
Select S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Stores S on S.StoreId=O.StoreId
join Models M on M.ModelId=O.ModelId
group by S.StoreName
ORDER BY TotalAmount DESC
--8-hangi ödeme yöntemi ne kadar kullanılmış  
select O.PaymentMethods,
count(*) as PaymentCount
from Orders O
group by O.PaymentMethods
order by PaymentCount desc
--9-Bursa'daki satışların toplam tutarı  
Select S.City,
sum(O.Quantity*M.SalePrice) as TotalRevenue
from Orders O
join Stores S on S.StoreId=O.StoreId
join Models M on M.ModelId=O.ModelId
where City='Bursa'
group by S.City
order by TotalRevenue desc
--10-Bursa'daki mağazada görevli personeller 
Select E.EmployeeName,E.EmployeeLastName,S.StoreName
from Employees E
join Stores S on S.StoreId=E.StoreId
where City='Bursa'
group by E.EmployeeName,E.EmployeeLastName,S.StoreName
--11-en çok sipariş veren müşteriler  
Select C.CustomerName,C.LastName,
count(O.OrderId) as OrderCount
from Orders O 
join Customers C on C.CustomerId=O.CustomerId
group by C.CustomerName,C.LastName
order by OrderCount desc
--12-en yüksek toplam harcama yapan müşteriler (Toplam Tutar) 
Select C.CustomerName,C.LastName,
sum(O.Quantity*M.SalePrice) as TotalSpending
from Orders O
join Customers C on C.CustomerId=O.CustomerId
join Models M on M.ModelId=O.ModelId
group by C.CustomerName,C.LastName
ORDER BY TotalSpending DESC
 --13-aylık satış performansı (ToplamTutar)  
 Select
 Format(O.OrderDate,'yyyy-MM') as Month,
 sum(O.Quantity*M.SalePrice) as TotalAmount
 from Orders O
 join Models M on M.ModelId=O.ModelId
 group by FORMAT(O.OrderDate,'yyyy-MM')
 order by Month
--14-aylık sipariş sayısı adet  
Select 
Format(O.OrderDate,'yyyy-MM') as Month,
sum(O.Quantity) as SalesQuantity
from Orders O
group by Format(O.OrderDate,'yyyy-MM')
order by Month
--15-Tüm ürünlerin stok durumunu görebileceğimiz liste  
Select M.ModelName,M.StockQuantity,
case
    when StockQuantity=0 then 'Out of Stock'
	when StockQuantity <10 then 'Low Stock'
	else 'Suffi Cient Stock'
	end as StockStatus
	from Models M
	order by StockStatus asc
--16-Ödeme Yöntemine açıklama getir 
Select O.PaymentMethods,O.OrderId,
case
   when PaymentMethods='Kredi Kartı' then 'Kredi Kartı'
   when PaymentMethods='Havale' then 'Havale'
   else 'Bilinmiyor'
   end as PaymentCount
   from Orders O
--17-ürün fiyatına göre kategori belirle 
Select M.ModelName,M.SalePrice,
case
    when SalePrice < 1600000 then 'Entry level'
	when SalePrice < 4000000 then 'Mid Range'
	else 'High end'
	end as PriceSegment
	from Models M
	order by PriceSegment asc
--18-Mağaza performansı etiketi 
Select S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalAmount,
case
   when Sum(O.Quantity*M.SalePrice) >6000000 THEN 'High Performance'
   when Sum(O.Quantity*M.SalePrice) >4000000 then 'Medium Performance'
   else 'Low Performance'
   end as StorePerformance
   from Orders O
   join Models M on M.ModelId=O.ModelId
   join Stores S on S.StoreId=o.StoreId
   group by S.StoreName
   ORDER BY StorePerformance DESC
--19-aylık ürün satış sayısı 
SELECT 
FORMAT(O.OrderDate,'yyyy-MM') as Month,
M.ModelName,
sum(O.Quantity) as TotalQuantity
from Orders O
join Models M on M.ModelId=O.ModelId
group by format(O.OrderDate,'yyyy-MM'),M.ModelName
order by Month
--20-Bir Mağazanın Gün bazlı satış rakamı 
Select 
Format(O.OrderDate,'yyyy-MM-dd') as Day,
S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalPrice
from Orders O
join Stores S on S.StoreId=o.StoreId
join Models M on M.ModelId=O.ModelId
group by FORMAT(O.OrderDate,'yyyy-MM-dd'),S.StoreName
order by Day
--21- Yıllık Ürün Bazlı Satış Sayısı 
SELECT
YEAR(O.OrderDate) as Year,
M.ModelName,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Models  M on M.ModelId=O.ModelId
group by YEAR(O.OrderDate),M.ModelName
order by YEAR
--22. Müşteri ilk siparişinden bugüne kaç gün geçmiş? 
Select C.CustomerName,C.LastName,
min(O.OrderDate) as FirstOrder,
datediff(day,min(O.OrderDate),getdate()) as DaysPassed
from Orders O
join Customers C on C.CustomerId=O.CustomerId
group by C.CustomerName,C.LastName
order by DaysPassed desc
--23 En çok satan 5 ürün 
Select Top 5 M.ModelName,
sum(O.Quantity) as TotalQuantity
from Orders O
join Models M on M.ModelId=O.ModelId
group by M.ModelName
order by TotalQuantity desc
--24-- Son 30 günde alışveriş yapan müşteriler 
Select distinct C.CustomerId, C.CustomerName,C.LastName
from Customers C
join Orders O on C.CustomerId=O.CustomerId
where OrderDate >=DATEADD(day,-30,getdate())
--25-- Aylar arası sipariş değişimi (karşılaştırmalı) 
Select
Format(O.OrderDate,'yyyy-MM') as Month,
count(O.OrderId) as OrderCount
from Orders O
group by format(O.OrderDate,'yyyy-MM')
order by Month
--26-- Her müşterinin ilk ve son siparişi arası geçen gün 
Select C.CustomerName,C.LastName,
min(O.OrderDate) as FirstOrder,
max(O.OrderDate) as LastOrder,
datediff(day,min(O.OrderDate),max(O.OrderDate)) as DaysPassed
from Orders O
join Customers C on C.CustomerId=O.CustomerId
group by C.CustomerName,C.LastName
order by DaysPassed desc
--27-- Her Müşterinin En Çok Aldığı Ürün 
Select C.CustomerName,C.LastName,ModelName,
max(O.Quantity) as MostPurchasedModel
from Orders O
join Customers C on C.CustomerId=O.CustomerId
join Models M on M.ModelId=O.ModelId
group by C.CustomerName,C.LastName,M.ModelName
order by MostPurchasedModel desc
--28-- Toplam 4000000 ₺’den fazla alışveriş yapan müşteriler 
Select C.CustomerName,C.LastName,
sum(O.Quantity*M.SalePrice) as TotalPrice
from Orders O
join Customers C on C.CustomerId=O.CustomerId
join Models M on M.ModelId=O.ModelId
GROUP BY C.CustomerName,C.LastName
having sum(O.Quantity*M.SalePrice) >4000000
--29-- Toplam satılan adedi 2’den fazla olan ürünler 
Select M.ModelName,
sum(O.Quantity) as TotalUnitsSold
from Orders O
join Models M ON m.ModelId=O.ModelId
group by M.ModelName
having sum(O.Quantity) >2
--30 Haftanın hangi günü daha çok sipariş var? 
Select
DATEPART(WEEKDAY,O.OrderDate) as DaysOftheWeek,
count(O.OrderId) as OrderCount
from Orders O
group by DATEPART(weekday,O.OrderDate)
ORDER BY DaysOftheWeek
--31 – Her ürünün en çok alındığı şehir 
Select M.ModelName,S.StoreName,
sum(O.Quantity) as TotalQuantity
from Orders O 
join Models M on M.ModelId=O.ModelId
join Stores S on S.StoreId=O.StoreId
group by M.ModelName,S.StoreName
ORDER BY TotalQuantity DESC
--32--A/B Testi Karşılaştırma son 30 günde bu mağazalardaki satışlar Bursa-Ankara 
Select S.City,
count(O.OrderId) as OrderCount,
sum(O.Quantity*M.SalePrice) as TotalAmount,
avg(O.Quantity*M.SalePrice) as AvgOrderAmount
from Orders O
join Stores S on S.StoreId=O.StoreId
join Models M on M.ModelId=O.ModelId
where City in ('Bursa','Ankara') and O.OrderDate >=DATEADD(day,-30,GETDATE())
group by S.City
--33 --Model Bazlı Satış Performansı (Sedan vs Sportback) 
Select M.ModelName,
sum(O.Quantity) as TotalQuantity,
sum(O.Quantity*M.SalePrice) as TotalAmount
from Orders O
join Models M on M.ModelId=O.ModelId
where M.ModelName like '%Sedan%' or M.ModelName like '%SportBack%'
group by M.ModelName
--34 Hangi Mağaza hedef ciroyu geçti 
Select S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalAmount,
case
    when SUM(O.Quantity*M.SalePrice) >6000000 then 'Target Achieved'
	else 'Target Not Achieved'
	end as StoreTarget
	from Orders O
	join Models M on M.ModelId=O.ModelId
	join Stores S on S.StoreId=O.StoreId
	group by S.StoreName
	order by StoreTarget desc
--35—Hangi Müşteri segmenti daha karlı(müşterileri toplam harcamalarına göre kategorize et) 
Select C.CustomerName,C.LastName,
sum(O.Quantity*M.SalePrice) as TotalAmount,
case
    when Sum(O.Quantity*M.SalePrice) >6000000 then 'Premium'
	when SUM(O.Quantity*M.SalePrice) >2000000 then 'Medium'
	else 'Standart'
	end as  CustomerSegment
	from Orders O
	join Customers C on C.CustomerId=O.CustomerId
	join Models M on M.ModelId=O.ModelId
	group by C.CustomerName,C.LastName
	order by CustomerSegment desc
--36- Son 3 ayda en az 2 alışveriş yapanları bulalım: 
SELECT C.CustomerName,C.LastName,
count(O.OrderId) as TotalQuantity
from Orders O
join Customers C on C.CustomerId=O.CustomerId
where O.OrderDate >=DATEADD(MONTH,-3,GETDATE())
group by C.CustomerName,C.LastName
having sum(O.OrderId) >=2
order by TotalQuantity desc
--37-Sipariş Oluşturma ve Stok Güncelleme transaction ile 
begin transaction;
begin try
         insert into Orders(CustomerId,EmployeeId,ModelId,StoreId,OrderDate,Quantity,PaymentMethods)
		             VALUES(1,4,2,4,6,GETDATE(),1,'Havale')
--Stok Düş
update Models
set StockQuantity=StockQuantity -1
where ModelId=2
--her şey başarılı ise kaydet
commit transaction
print 'Sipariş ve Stok Güncellemesi başarıyla tamamlandı'
end try

begin catch
--Hata oluşursa işlemi geri al
rollback transaction;
print 'Hata oluştu İşlem Geri alındı'
end catch;

--38-Son 3 ayda en çok satış yapılan ürünü bul 
Select Top 1 M.ModelName,
sum(O.Quantity) as TotalQuantity
from Orders O
join Models M ON M.ModelId=O.ModelId
where O.OrderDate >=DATEADD(month,-3,getdate())
group by M.ModelName
order by TotalQuantity desc