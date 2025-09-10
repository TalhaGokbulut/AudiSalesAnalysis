create table Brands(
BrandId int primary key identity(1,1),
BrandName varchar(50) not null,
)

Create table Models(
ModelId int primary key identity(1,1),
BrandId int foreign key references Brands(BrandId),
ModelName varchar(50) not null,
SalePrice decimal (10,2) not null,
Cost decimal (10,2) not null,
StockQuantity int not null,
)

create table Customers(
CustomerId int primary key identity(1,1),
CustomerName varchar(50) not null,
LastName varchar(50) not null,
Gender char(1) check (Gender in ('M','F'),
City varchar(50) not null,
RegistrationDate date not null,
)

Create table Orders(
OrderId int primary key identity(1,1),
CustomerId int foreign key references Customers(CustomerId),
EmployeeId int foreign key references Employees(EmployeeId),
ModelId int foreign key references Models(ModelId),
StoreId int foreign key references Stores(StoreId),
OrderDate date not null,
Quantity int not null,
PaymentMethods varchar(50)
)

create table Employees(
EmployeeId int primary key identity(1,1),
EmployeeName varchar(50) not null,
EmployeeLastName varchar(50) not null,
StoreId int foreign key references Stores(StoreId),
Position varchar(50) not null)

create table Stores(
StoreId int primary key identity(1,1),
City varchar(50) not null,
Region varchar(70) not null,
StoreName varchar(70) not null)




