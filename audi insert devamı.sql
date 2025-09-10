    insert into Brands(BrandName) values('Audi')

insert into Models(BrandId,ModelName,SalePrice,Cost,StockQuantity)
            values(1,'AUDÝ A3 SEDAN',1500000.00,1200000.00,10),
			      (1,'AUDÝ A4 SEDAN',2100000.00,1700000.00,7),
			      (1,'AUDÝ A6 SEDAN',7200000.00,6200000.00,14),
				  (1,'AUDÝ A7 40 TDI',6000000.00,1000000.00,7),
				  (1,'AUDÝ A3 SPORTBACK',3000000.00,2600000.00,20),
				  (1,'AUDÝ A6 AVANT 40 TDI',7100000.00,6600000.00,11);

insert into Customers (CustomerName,LastName,Gender,City,RegistrationDate)
            values ('Ýrfancan','Kahveci','M','Çorum','2025-01-10'),
			       ('Ayþe','Demir','F','ANKARA','2025-02-05'),
				   ('Cüneyt','Türk','M','Ýstanbul','2025-02-12'),
				   ('Ferdi','Ak','M','Ýstanbul','2025-02-20'),
				   ('Canan','Aydýn','F','Bursa','2025-04-01'),
				   ('Akýn','Taþkýn','M','Antalya','2025-01-07');

insert into Employees(EmployeeName,EmployeeLastName,StoreId,Position) 
               values('Ahmet','Akýn',4,'Satýþ Danýþmaný'),
			         ('Hamza','Akçiçek',1,'Satýþ Danýþmaný'),
					 ('Akgün','Çatal',3,'Satýþ Danýþmaný'),
					 ('Gizem','Bulut',2,'Satýþ Danýþmaný'),
					 ('Yusuf','Köse' ,5,'Satýþ Danýþmaný'),
					 ('Cenk','Tosun',4,'Satýþ Danýþmaný');

insert into Stores(City,Region,StoreName)
           values ('Ýstanbul','Marmara', 'Audi Ýstanbul Merkez'),
                  ('Ankara', 'Ýç Anadolu', 'Audi Ankara Þubesi'),   
                  ('Ýzmir', 'Ege ', ' Audi Ýzmir Bayi'),     
                  ('Bursa', 'Marmara', 'Audi Bursa Plaza'),   
                  ('Antalya', 'Akdeniz', 'Audi Antalya Bayi'); 

INSERT INTO Orders (CustomerId, EmployeeId, ModelId, StoreId, OrderDate, Quantity, PaymentMethods)
VALUES
(1, 3, 2,1, '2025-02-15', 1, 'Kredi Kartý'),  
(2, 4, 3,2, '2025-02-20', 1, 'Kredi Kart'),        
(3, 5, 4,2, '2025-03-01', 1, 'Kredi Kartý'),  
(4, 6, 4,4, '2025-03-10', 1, 'Havale'),       
(5, 7, 7,3, '2025-03-15', 1, 'Kredi Kartý'),  
(6, 8, 6,5, '2025-04-01', 1, 'Havale');        


