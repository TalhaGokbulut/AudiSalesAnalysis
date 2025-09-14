--Bir ma�azan�n ayl�k toplam sat�� tutar�
create procedure sp_AylikToplamSatisTutari
@CityName nvarchar(50)
as
begin
select
Format(O.OrderDate,'yyyy-MM') as Month,
sum(O.Quantity*M.SalePrice) as TotalMount
from Orders O
join Models M on O.ModelId=M.ModelId
join Stores S on S.StoreId=O.StoreId
where S.City=@CityName
group by Format(O.OrderDate,'yyyy-MM') 
order by month
end

exec sp_AylikToplamSatisTutari @CityName='Bursa'

--Bir m��terinin sipari� ge�mi�i
create procedure sp_M��terininSipari�Ge�mi�i
@CustomerId int
as
begin
select C.CustomerName,C.LastName,O.OrderDate,O.Quantity,M.ModelName,(O.Quantity*M.SalePrice) as TotalAMout
from Orders O
join Models M on M.ModelId=O.ModelId
join Customers C on C.CustomerId=O.CustomerId
where O.CustomerId=@CustomerId
order by OrderDate desc
end

exec sp_M��terininSipari�Ge�mi�i @CustomerId=2

--10 adedin alt�nda kalan stoklar� listeleme
create procedure sp_D���kStokModelleri
as
begin
Select ModelId,ModelName,StockQuantity,SalePrice
from Models
where StockQuantity <10
order by StockQuantity asc
end

exec sp_D���kStokModelleri 
--Ma�aza Hedefleri
Create Procedure sp_MagazaHedefDrumu
@HedefTutar decimal(18,2)
as
begin
Select S.StoreName,
sum(O.Quantity*M.SalePrice) as TotalAmount,
case
     when sum(O.Quantity*M.SalePrice) >= @HedefTutar then 'Hedef Ge�ildi'
	 else 'Hedef Ge�ilemedi'
	 end as HedefDurumu
	 from Orders O 
	 join Models M on M.ModelId=O.ModelId
	 join Stores S on S.StoreId=O.StoreId
	 GROUP BY S.StoreName
	 ORDER BY TotalAmount DESC
	 END
	 exec sp_MagazaHedefDrumu @HedefTutar=7000000







