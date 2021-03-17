drop table MENUBILL;
drop table ORDERINFO;
drop table MENU;
drop table WAITER;
drop table CUSTOMER;


create table CUSTOMER(
	Customer_Id int NOT NULL,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) DEFAULT NULL,
	Email_Id varchar(50) DEFAULT NULL,	
	PRIMARY KEY (Customer_Id)
);
create table WAITER(
	Waiter_Id int NOT NULL,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Address varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Join_Date date NULL,
	PRIMARY KEY (Waiter_Id)
); 
/*create table RESIGNED(
	R_Id int NOT NULL,
	oldId int NOT NULL,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Address varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Join_Date date NOT NULL,
	Join_OUT_DATE date DEFAULT NULL,
	PRIMARY KEY (R_Id)
); */
create table MENU(
	Menu_Id int NOT NULL,
	Name varchar(100) NOT NULL,
	Price float NOT NULL,	
	Ratio varchar(10) NOT NULL,
	Category varchar(30) NOT NULL,
	PRIMARY KEY(Menu_Id)
); 
create table ORDERINFO(
	Order_Id int NOT NULL,
	Customer_Id int NOT NULL,
	Waiter_Id int NOT NULL,
	Total float default 0.0,	
	PRIMARY KEY (Order_Id),
	FOREIGN KEY (Customer_Id) REFERENCES CUSTOMER (Customer_Id) on delete cascade,
	FOREIGN KEY(Waiter_Id) REFERENCES WAITER (Waiter_Id) on delete cascade
);

create table MENUBILL(
	Order_Id int NOT NULL,
	Menu_Id int NOT NULL,
	Quantity int NOT NULL,
	PRIMARY KEY(Order_Id,Menu_Id),
	FOREIGN KEY(Order_Id) REFERENCES ORDERINFO(Order_Id) on delete cascade
);
/*
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(1,'Sadia','Mubashira','632199','sadiamubashshira@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(2,'Ahnaf','Sadman','289374','ahnafsadman@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(3,'Mahmuda','Akter','234322','aktermahmuda@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(4,'Shahabuddin','Salim','778989','salimshahab@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(5,'Haseena','Begum','364932','begum.hasina@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(6,'Nadia','Mubashira','632199','sadiamubashshira@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(7,'Akib','Sadman','289374','ahnafsadman@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(8,'Mahima','Akter','234322','aktermahmuda@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(9,'Shahin','Salim','778989','salimshahab@gmail.com');
insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
values(10,'Hamida','Begum','364932','begum.hasina@gmail.com');

insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(1,'Rakib','Sayem','123456','Chittahong','15000',date '2012-08-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(2,'Rihan','Rahman','132244','Dhaka','13000',date '2013-06-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(3,'Vinit','Anwar','213122',' Khulna','8000',date '2015-02-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(4,'Aakib','Sayem','123456','Chittahong','15000',date '2012-08-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(5,'Raihanul','Rahman','132244','Dhaka','13000',date '2013-06-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(6,'Vivek','Anwar','213122',' Khulna','8000',date '2015-02-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(7,'Rauf','Sayem','123456','Chittahong','15000',date '2012-08-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(8,'Ridwan','Rahman','132244','Dhaka','13000',date '2013-06-01');
insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_Date)
values(9,'Atwanur','Anwar','213122',' Khulna','8000',date '2015-02-01');

insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(1,'Chicken Jhal Fry','400.00','1:3','Chicken Dishes');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(2,'Keema Pilau Rice','200.00','1:3','Rice');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(3,'Mixed Fried Rice','200.00','1:3','Rice');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(4,'Gulab Jamun','30.00','1:1','Dessert');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(5,'Kheer','25.00','1:1','Dessert');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(6,'vegetable Masala','250.00','1:3','Vegetable Dishes');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(7,'Chicken Onion','400.00','1:3','Chicken Dishes');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(8,'Hydrabadi Biriyani','200.00','1:3','Rice');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(9,'Vegetable Fried Rice','200.00','1:3','Rice');
insert into MENU(Menu_Id,Name,Price,Ratio,Category)
values(10,'Custard','30.00','1:1','Dessert');


insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(1,2,3);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(2,3,1);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(3,1,2);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(4,4,1);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(5,6,3);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(6,8,1);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(7,5,2);
insert into ORDERINFO(Order_Id,Customer_Id,Waiter_Id)
values(8,7,1);


insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(2,1,1);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(3,3,2);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(4,1,1);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(5,6,1);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(6,4,1);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(7,1,2);
insert into MENUBILL(Order_Id,Menu_Id,Quantity)
values(8,1,3);
*/
select Fname, Lname, Name, Price, Quantity from customer natural join (select Name,Price, Menu_Id,Quantity,Customer_Id from menu natural join (select  m.Menu_Id,m.Quantity,o.Customer_Id from MENUBILL m natural join ORDERINFO o));

commit;
