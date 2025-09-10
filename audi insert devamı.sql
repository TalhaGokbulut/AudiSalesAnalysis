    insert into Brands(BrandName) values('Audi')

insert into Models(BrandId,ModelName,SalePrice,Cost,StockQuantity)
            values(1,'AUD� A3 SEDAN',1500000.00,1200000.00,10),
			      (1,'AUD� A4 SEDAN',2100000.00,1700000.00,7),
			      (1,'AUD� A6 SEDAN',7200000.00,6200000.00,14),
				  (1,'AUD� A7 40 TDI',6000000.00,1000000.00,7),
				  (1,'AUD� A3 SPORTBACK',3000000.00,2600000.00,20),
				  (1,'AUD� A6 AVANT 40 TDI',7100000.00,6600000.00,11);

insert into Customers (CustomerName,LastName,Gender,City,RegistrationDate)
            values ('�rfancan','Kahveci','M','�orum','2025-01-10'),
			       ('Ay�e','Demir','F','ANKARA','2025-02-05'),
				   ('C�neyt','T�rk','M','�stanbul','2025-02-12'),
				   ('Ferdi','Ak','M','�stanbul','2025-02-20'),
				   ('Canan','Ayd�n','F','Bursa','2025-04-01'),
				   ('Ak�n','Ta�k�n','M','Antalya','2025-01-07');

insert into Employees(EmployeeName,EmployeeLastName,StoreId,Position) 
               values('Ahmet','Ak�n',4,'Sat�� Dan��man�'),
			         ('Hamza','Ak�i�ek',1,'Sat�� Dan��man�'),
					 ('Akg�n','�atal',3,'Sat�� Dan��man�'),
					 ('Gizem','Bulut',2,'Sat�� Dan��man�'),
					 ('Yusuf','K�se' ,5,'Sat�� Dan��man�'),
					 ('Cenk','Tosun',4,'Sat�� Dan��man�');

insert into Stores(City,Region,StoreName)
           values ('�stanbul','Marmara', 'Audi �stanbul Merkez'),
                  ('Ankara', '�� Anadolu', 'Audi Ankara �ubesi'),   
                  ('�zmir', 'Ege ', ' Audi �zmir Bayi'),     
                  ('Bursa', 'Marmara', 'Audi Bursa Plaza'),   
                  ('Antalya', 'Akdeniz', 'Audi Antalya Bayi'); 

INSERT INTO Orders (CustomerId, EmployeeId, ModelId, StoreId, OrderDate, Quantity, PaymentMethods)
VALUES
(1, 3, 2,1, '2025-02-15', 1, 'Kredi Kart�'),  
(2, 4, 3,2, '2025-02-20', 1, 'Kredi Kart'),        
(3, 5, 4,2, '2025-03-01', 1, 'Kredi Kart�'),  
(4, 6, 4,4, '2025-03-10', 1, 'Havale'),       
(5, 7, 7,3, '2025-03-15', 1, 'Kredi Kart�'),  
(6, 8, 6,5, '2025-04-01', 1, 'Havale');        


