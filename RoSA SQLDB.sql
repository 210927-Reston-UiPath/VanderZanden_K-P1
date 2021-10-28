create table Client (
    ClientID serial primary key,
    Name varchar(100) not null,
    Email varchar(100) not null

);

create table ShoppingListPega (
    ClientID int references Client(ClientID),
    ItemID serial primary key,
    ProductName varchar(100) not null,
    Quantity int not null
);

create table ShoppingListDeli (
    ClientID int references Client(ClientID),
    ItemId serial primary key, 
    ProductName varchar(100) not null,
    Quantity int not null
);

create table ClientOrderPega(
    ClientID int references Client(ClientID),
    OrderID serial primary key,
    OrderDate date not null default current_date,
    Total int not null
);

create table ClientOrderDeli(
    ClientID int references Client(ClientID),
    OrderID serial primary key,
    OrderDate date not null default current_date,
    Total int not null
);

create table ShoppingExpensePega(
    LineItemID serial primary key,
    OrderID int references ClientOrderPega(OrderID),
    ItemID int references ShoppingListPega(ItemID),
    Subtotal int not null,
    Price int not null
);

create table ShoppingExpenseDeli(
    LineItemID serial primary key,
    OrderID int references ClientOrderDeli(OrderID),
    ItemID int references ShoppingListDeli(ItemID),
    Subtotal int not null,
    Price int not null
);

insert into Client (Name, Email) values
('Borko G', 'BorkoG@yahoo.com'), ('Andy P', 'AndyP@aol.com'), ('Jules T', 'JulesT@gmail.com'), ('Todd F', 'ToddF@gmail.com'), ('Francis Q', 'FrancisQ@gmail.com'), ('Sammy R', 'SammyR@gmail.com');
insert into ShoppingListPega (ClientID, ProductName, Quantity) values
(1, 'Sasquatch Ale', 2), (1, 'Steeleye Stout', 3), (1, 'Ipoh Coffee', 4), (2, 'Chai', 2), (2, 'Gula Malacca', 5), (2, 'Outback Lager', 7), (3, 'Louisiana Hot Spiced Okra', 2), (3, 'Rhonbrau Klosterbier', 3), (3, 'Cote de Blaye', 6);
insert into ShoppingListDeli (ClientID, ProductName, Quantity) values
(4, 'Pastrami', 3), (4, 'Roast Beef', 3), (4, 'Ham', 2), (5, 'Salami', 2), (5, 'Pepperoni', 2), (5, 'Ham', 4), (6, 'Pastrami', 3), (6, 'Salami', 3), (6, 'Pepperoni', 6);  



select * from Client
select * from ShoppingListPega
select * from ShoppingListDeli
Select * from ClientOrderPega
Select * from ClientOrderDeli
select * from ShoppingExpensePega
select * from ShoppingExpenseDeli

drop table ShoppingExpenseDeli
drop table ShoppingExpensePega
drop table ClientOrderDeli
drop table ClientOrderPega
drop table ShoppingListDeli
drop table ShoppingListPega
drop table Client

delete from ShoppingListPega where ClientID=4

delete from Client where ClientID=4

