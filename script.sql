CREATE DATABASE rmos;
USE rmos;


CREATE TABLE RESTAURANT
(
	Name VARCHAR(100) NOT NULL,
	Loc VARCHAR(100) NOT NULL,
	Contact VARCHAR(100) NOT NULL,
	OCTime VARCHAR(100) NOT NULL,
	Details VARCHAR(500) DEFAULT NULL,
	PRIMARY KEY (Name)
);


CREATE TABLE OWNER
(
	Fname VARCHAR(15) NOT NULL,
	Lname VARCHAR(15) NOT NULL,
	Contact CHAR(100) NOT NULL,
	RestName VARCHAR(100) NOT NULL,
	PRIMARY KEY (Fname, Lname, Contact),
	FOREIGN KEY (RestName) REFERENCES RESTAURANT(Name) ON UPDATE CASCADE
);


CREATE TABLE BILL
(
	OrderId INT NOT NULL,
	CustomerFname VARCHAR (20) NOT NULL,
	CustomerLname VARCHAR (20) NOT NULL,
	Customerid VARCHAR(9) NOT NULL,
	TotalAmount DECIMAL(9, 2) NOT NULL,	
    Type VARCHAR(10) NOT NULL,
	PRIMARY KEY (OrderId)
);


CREATE TABLE MENU_BILL
(
	OrderId INT NOT NULL,
	Type VARCHAR(25) NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Quantity INT NOT NULL,
    UnitPrice INT NOT NULL,
	Price INT NOT NULL,
	FOREIGN KEY(OrderId) REFERENCES BILL(OrderId)
);


CREATE TABLE CUSTOMER
(
	OrderId INT NOT NULL,
	Fname VARCHAR(15) NOT NULL,
	Lname VARCHAR(15) NOT NULL,
	CustomerId CHAR(9) NOT NULL,
	Contact CHAR(20) DEFAULT NULL,
	EmailId VARCHAR(50) DEFAULT NULL,
	RestName VARCHAR(100) NOT NULL,
	PRIMARY KEY (CustomerId),
	FOREIGN KEY (OrderId) REFERENCES BILL(OrderId),
    FOREIGN KEY (RestName) REFERENCES RESTAURANT(Name)
);


CREATE TABLE WAITER
(
	WaiterId INT NOT NULL,
	Name VARCHAR(15) NOT NULL,
	RestName VARCHAR(15) NOT NULL,
	Contact VARCHAR(20) NOT NULL,
 	Address VARCHAR(30) DEFAULT NULL,
  	Salary VARCHAR(30) DEFAULT NULL,
	Sex CHAR(1) DEFAULT NULL,
	JoinDate DATE NOT NULL,
	PRIMARY KEY (WaiterId),
    FOREIGN KEY(ResTName) REFERENCES RESTAURANT(Name) ON UPDATE CASCADE
);


CREATE TABLE CASHIER
(
	CashierId INT NOT NULL,
	Name VARCHAR(15) NOT NULL,
	RestName VARCHAR(15) NOT NULL,
 	City VARCHAR(30) DEFAULT NULL,
  	Salary VARCHAR(30) DEFAULT NULL,
	Sex CHAR(1) DEFAULT NULL,
	JoinDate DATE NOT NULL,
	PRIMARY KEY (CashierId),
    FOREIGN KEY(ResTName) REFERENCES RESTAURANT(Name) ON UPDATE CASCADE
);


CREATE TABLE CHEF
(
	Name VARCHAR(15) NOT NULL,
	RestName VARCHAR(15) NOT NULL,
	Contact VARCHAR(20) NOT NULL,
    ChefId INT NOT NULL,
  	Salary INT DEFAULT NULL,
	Sex CHAR(1) DEFAULT NULL,
	Specialization VARCHAR(50) DEFAULT NULL,
	JoinDate DATE NOT NULL,
	PRIMARY KEY (ChefId),
    FOREIGN KEY(RestName) REFERENCES RESTAURANT(Name) ON UPDATE CASCADE
);


CREATE TABLE HOME_DELIVERY
(
	DeliveryId VARCHAR(9) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	DateTime DATETIME NOT NULL,
	Contact VARCHAR(20) NOT NULL,
	CustId CHAR(9) NOT NULL,
	OrderId INT NOT NULL,
	PRIMARY KEY(DeliveryId),
	FOREIGN KEY (CustId) REFERENCES CUSTOMER(CustomerId),
	FOREIGN KEY (OrderId) REFERENCES BILL(OrderId)
);


CREATE TABLE DELIVERY_BOY_DETAILS
(
	Fname VARCHAR(15) NOT NULL,
	Lname VARCHAR(15) NOT NULL,
	Contact VARCHAR(20) NOT NULL,
	DeliveryBoyId INT NOT NULL,
 	Address VARCHAR(30) DEFAULT NULL,
  	Salary VARCHAR(30) DEFAULT NULL,
	Sex CHAR(1) DEFAULT NULL,
	Bdate DATE DEFAULT NULL,
	JoinDate DATE NOT NULL,
	PRIMARY KEY (DeliveryBoyId)
);


CREATE TABLE DELIVERY_BOY
(
	BoyId INT NOT NULL,
	DeliveryId VARCHAR(50) NOT NULL,
    PRIMARY KEY(BoyId, DeliveryId),
	FOREIGN KEY (BoyId) REFERENCES DELIVERY_BOY_DETAILS(DeliveryBoyId),
	FOREIGN KEY (DeliveryId) REFERENCES HOME_DELIVERY(DeliveryId)
);


CREATE TABLE MENU
(
	MenuId INT NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Price INT NOT NULL,	
	Type VARCHAR(20) DEFAULT NULL,
	Category VARCHAR(30) NOT NULL,
	PRIMARY KEY(MenuId)
);


CREATE TABLE TABLES
(
	TableNum VARCHAR(9) NOT NULL,
	Details VARCHAR(200) DEFAULT NULL,
	PRIMARY KEY (TableNum)
);


CREATE TABLE BOOKING
(
	BookingId INT NOT NULL AUTO_INCREMENT,
	TableNum VARCHAR(9) NOT NULL,
	DateTime VARCHAR(30) NOT NULL,
	CustId CHAR(9) NOT NULL,
	PRIMARY KEY (BookingId),
	FOREIGN KEY (CustId) REFERENCES CUSTOMER(CustomerId),
	FOREIGN KEY (TableNum) REFERENCES TABLES(TableNum)
)AUTO_INCREMENT = 1000;

INSERT INTO USER VALUES(101,"John","Watson");
INSERT INTO USER VALUES(102,"Sherlock","Holmes");
INSERT INTO USER VALUES(103,"Joey","Tribbiani");
INSERT INTO USER VALUES(104,"Rachel","Green");
INSERT INTO USER VALUES(105,"Monica","Geller");
INSERT INTO USER VALUES(106,"Ross","Geller");
INSERT INTO USER VALUES(107,"Phoebe","Buffay");
INSERT INTO USER VALUES(108,"Chandler","Bing");
INSERT INTO USER VALUES(109,"Mark","Smith");
INSERT INTO USER VALUES(110,"David","Beckham");
INSERT INTO USER VALUES(111,"Emily","Blunt");
INSERT INTO USER VALUES(112,"Adam","Levine");
INSERT INTO USER VALUES(113,"Joanne","Watson");
INSERT INTO USER VALUES(114,"Irene","Adler");
INSERT INTO USER VALUES(115,"Jessica","Pearson");

INSERT INTO RESTAURANT VALUES("Taco Bell","New York","932-108","8:00 am - 9:00 pm","Continental");
INSERT INTO RESTAURANT VALUES("Crispy Crunch","London","912-108","7:00 am - 10:00 pm","Snacks");
INSERT INTO RESTAURANT VALUES("Italiano Bakes","Rome","234-108","6:00 am - 9:00 pm","Italian");
INSERT INTO RESTAURANT VALUES("Swiss Cream","Bern","932-111","10:00 am - 10:00 pm","Ice creams");
INSERT INTO RESTAURANT VALUES("Bikaneriwaala","Jaipur","123-108","6:00 am - 9:00 pm","North Indian");
INSERT INTO RESTAURANT VALUES("Beijinzi"," Beijing","190-308","8:00 am - 9:00 pm","Chinese");
INSERT INTO RESTAURANT VALUES("Teppan","Tokyo","932-102","6:00 am - 8:00 pm","Japanese");
INSERT INTO RESTAURANT VALUES("KFC","California","915-208","11:00 am - 9:00 pm","Fast Food");
INSERT INTO RESTAURANT VALUES("Shree Mithai","Chennai","111-578","6:00 am - 8:00 pm","Sweets");
INSERT INTO RESTAURANT VALUES("Cream Centre","Boston","682-138","8:00 am - 9:00 pm","Continental");

INSERT INTO OWNER VALUES("Liam","Smith","123-456","Taco Bell");
INSERT INTO OWNER VALUES("Olivia","Coleman","134-426","KFC");
INSERT INTO OWNER VALUES("Sean","Connery","235-456","Cream Centre");
INSERT INTO OWNER VALUES("Eden","Joanne","523-456","Beijinzi");
INSERT INTO OWNER VALUES("Ashley","Britt","567-416","Swiss Cream");
INSERT INTO OWNER VALUES("Rohit","Agarwal","987-254","Shree Mithai");
INSERT INTO OWNER VALUES("Charlotte","Evans","412-405","Crispy Crunch");
INSERT INTO OWNER VALUES("Noah","Wood","120-234","Italiano Bakes");
INSERT INTO OWNER VALUES("Ritika","Anand","111-456","Bikaneriwaala");
INSERT INTO OWNER VALUES("Akemi","Suki","983-456","Teppan");

SELECT * FROM OWNER;

INSERT INTO DELIVERY_BOY_DETAILS VALUES("Jason","Roy","1234-2345",200,"19,NYC","1230 USD",'M',"1988-11-03","2009-03-02");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Kane","Smith","1114-2345",201,"12,London","1130 USD",'M',"1979-11-03","2003-02-12");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Steve","Warner","1555-2125",202,"34,Rome","1123 USD",'M',"1984-12-02","2007-07-08");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Frank","Hayden","2222-2345",203,"33,Bern","890 USD",'M',"1985-11-03","2002-03-02");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("John","Roy","2312-4231",204,"19,California","1600 USD",'M',"1975-09-04","2002-10-09");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("James","Corden","1002-2341",205,"34,Beijing","1222 USD",'M',"1980-11-12","2005-02-01");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Arjun","Sharma","9087-2345",206,"23,Mumbai","1200 USD",'M',"1983-12-12","2012-02-04");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Rahul","Subbramanian","1243-2345",207,"71,Chennai","1987 USD",'M',"1988-11-03","2003-03-02");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Azi","Kento","1234-9871",208,"91,Tokyo","1290 USD",'M',"1990-11-03","2020-03-02");
INSERT INTO DELIVERY_BOY_DETAILS VALUES("Tim","Smith","1983-2345",209,"19, Boston","1830 USD",'M',"1985-11-08","2008-02-27");

SELECT * FROM DELIVERY_BOY;

INSERT INTO MENU VALUES(10,"Noodles",250,"Main Course","Chinese");
INSERT INTO MENU VALUES(11,"Malai Kofta",6,"Main Course","Indian");
INSERT INTO MENU VALUES(12,"Chicken 65",20,"Starters","Indian");
INSERT INTO MENU VALUES(13,"Pizza",23,"Fast food","Italian");
INSERT INTO MENU VALUES(14,"Pasta",50,"Main Course","Italian");
INSERT INTO MENU VALUES(15,"Momos",30,"Fast food","Continental");
INSERT INTO MENU VALUES(16,"Sushi",20,"Main Course","Japanese");
INSERT INTO MENU VALUES(17,"Panneer masala",10,"Main Course","Indian");
INSERT INTO MENU VALUES(18,"Mutton Biriyani",40,"Main Course","Indian");
INSERT INTO MENU VALUES(19,"Sandwich",20,"Fast food","Continental");
INSERT INTO MENU VALUES(20,"Swiss icecream",30,"Desserts","Ice creams");
INSERT INTO MENU VALUES(21,"Kaju Katli",10,"Desserts","Sweets");
INSERT INTO MENU VALUES(22,"Butter Naan",250,"Main Course","Indian");
INSERT INTO MENU VALUES(23,"Yorkshire Pudding",30,"Main Course","Continental");
INSERT INTO MENU VALUES(24,"Sashimi",22,"Main Course","Japanese");
INSERT INTO MENU VALUES(25,"Veg Biriyani",8,"Main Course","Indian");
INSERT INTO MENU VALUES(26,"Butter Chicken",25,"Main Course","Indian");
INSERT INTO MENU VALUES(27,"Spaghetti",23,"Main Course","Italian");
INSERT INTO MENU VALUES(28,"Butter Roti",35,"Main Course","Indian");
INSERT INTO MENU VALUES(29,"Macaroni Magic",28,"Starters","Continental");
INSERT INTO MENU VALUES(30,"Cheese Balls",50,"Starters","Continental");
INSERT INTO MENU VALUES(31,"Panneer Sizzler",38,"Main Course","Indian");
INSERT INTO MENU VALUES(32,"Chocolate Mousse",40,"Desserts","Ice creams");
INSERT INTO MENU VALUES(33,"Cheesecake",35,"Desserts","Cakes");
INSERT INTO MENU VALUES(34,"Miso soup",24,"Starters","Japanese");
INSERT INTO MENU VALUES(35,"Baked Aubergines",25,"Starters","Continental");
INSERT INTO MENU VALUES(36,"Sausage Plait",14,"Starters","Continental");

SELECT * FROM MENU;

INSERT INTO CHEF VALUES("Tamjid","Taco Bell","12-34-56",501,2300,'M',"Continental","2003-12-12");
INSERT INTO CHEF VALUES("Sanjith","Shree Mithai","22-23-12",502,1200,'M',"Sweets","2004-09-12");
INSERT INTO CHEF VALUES("Anirudh","Cream Centre","12-33-22",503,1500,'M',"Continental","2007-12-12");
INSERT INTO CHEF VALUES("Rakshith","Beijinzi","12-19-13",504,1250,'M',"Chinese","2003-01-12");
INSERT INTO CHEF VALUES("RK","Italiano Bakes","12-88-99",505,3090,'M',"Italian","2003-12-04");
INSERT INTO CHEF VALUES("Mathi","Swiss Cream","11-23-12",506,2100,'M',"Ice Creams","2006-05-11");
INSERT INTO CHEF VALUES("Pranav","Teppan","19-89-45",507,1200,'M',"Japanese","2005-11-12");
INSERT INTO CHEF VALUES("Jersha","KFC","12-19-08",508,1300,'M',"Fast Food","2006-11-12");
INSERT INTO CHEF VALUES("Hema","Crispy Crunch","12-86-56",509,3300,'F',"Snacks","2007-01-12");
INSERT INTO CHEF VALUES("Maanasa","Bikaneriwaala","12-12-56",510,2300,'F',"North Indian","2006-11-11");
INSERT INTO CHEF VALUES("Swetha","KFC","13-12-09",511,1400,'F',"Fast Food","2003-06-12");
INSERT INTO CHEF VALUES("Akshaya","Crispy Crunch","19-99-66",512,2400,'F',"Snacks","2008-01-12");
INSERT INTO CHEF VALUES("Sam","Bikaneriwaala","12-44-66",513,1400,'F',"North Indian","2008-11-11");

SELECT * FROM CHEF;

INSERT INTO WAITER VALUES(701,"Shawn","Taco Bell","123-456","18,London","890 USD",'M',"2009-12-12");
INSERT INTO WAITER VALUES(702,"Gina","Cream Centre","111-666","19,Mumbai","770 USD",'F',"2006-11-11");
INSERT INTO WAITER VALUES(703,"Deepthi","KFC","999-999","20,California","790 USD",'F',"2008-01-01");
INSERT INTO WAITER VALUES(704,"Harini","Crispy Crunch","112-376","7,Rome","120 USD",'F',"2010-12-12");
INSERT INTO WAITER VALUES(705,"Britne","Beijinzi","145-236","12,Bern","890 USD",'F',"2008-12-12");
INSERT INTO WAITER VALUES(706,"Mona","Swiss Cream","100-906","11,Chennai","120 USD",'F',"2007-01-12");
INSERT INTO WAITER VALUES(707,"Shree","Teppan","111-456","45,New York","1200 USD",'F',"2008-05-12");
INSERT INTO WAITER VALUES(708,"Arnav","Italiano Bakes","122-333","20,Tokyo","1230 USD",'M',"2004-01-12");
INSERT INTO WAITER VALUES(709,"Dhivya","Bikaneriwaala","555-333","13,Jaipur","1200 USD",'F',"2007-11-11");
INSERT INTO WAITER VALUES(710,"Karthik","Shree Mithai","112-456","18,London","890 USD",'M',"2009-12-12");
INSERT INTO WAITER VALUES(711,"Dinesh","Taco Bell","113-423","12,London","900 USD",'M',"2008-11-12");
INSERT INTO WAITER VALUES(712,"Kaycee","Cream Centre","133-126","19, New York","670 USD",'F',"2008-12-12");

SELECT * FROM WAITER;

INSERT INTO CUSTOMER VALUES(900,"Jonathan","Cecil","C1","9923-2345","jc@gmail.com", "Taco Bell");
INSERT INTO CUSTOMER VALUES(901,"Tejas","Srinivas","C2","1230-0980","tejas@gmail.com", "Cream Centre");
INSERT INTO CUSTOMER VALUES(902,"Krishna","Shree","C3","1290-9876","krishna@gmail.com", "KFC");
INSERT INTO CUSTOMER VALUES(903,"Rhubanraj","Palani","C4","2390-0987","rhuban@gmail.com", "Swiss Cream");
INSERT INTO CUSTOMER VALUES(904,"Nikhilesh","Shaji","C5","1290-0909","nikhi@gmail.com", "Crispy Crunch");
INSERT INTO CUSTOMER VALUES(905,"Naveen","Kumar","C6","1209-1234","naveen@gmail.com", "Beijinzi");
INSERT INTO CUSTOMER VALUES(906,"Chandru","Sehar","C7","1235-2312","chandru@gmail.com", "Teppan");
INSERT INTO CUSTOMER VALUES(907,"Shriram","Sundar","C8","1209-1278","shriram@gmail.com", "Italiano Bakes");
INSERT INTO CUSTOMER VALUES(908,"Anantha","Raman","C9","1277-1245","anantha@gmail.com", "KFC");
INSERT INTO CUSTOMER VALUES(909,"Navin","Krishna","C10","1288-2390","navink@gmail.com", "Taco Bell");
INSERT INTO CUSTOMER VALUES(910,"Mona","Milan","C11","9089-1234","milan@gmail.com", "Shree Mithai");
INSERT INTO CUSTOMER VALUES(911,"Rahul","Gunaseelan","C12","9876-1245","rahulg@gmail.com", "KFC");
INSERT INTO CUSTOMER VALUES(912,"Sai","Deepika","C13","6785-1234","saideep@gmail.com", "KFC");
INSERT INTO CUSTOMER VALUES(913,"Ishita","Dwivedi","C14","1245-1294","ishita@gmail.com", "Teppan");
INSERT INTO CUSTOMER VALUES(914,"Ananyaa","Sanjeev","C15","1200-3400","ananyaa@gmail.com", "Bikaneriwaala");
INSERT INTO CUSTOMER VALUES(915,"Pragadeesh","Murugan","C16","7890-2105","praga@gmail.com", "Swiss Cream");
INSERT INTO CUSTOMER VALUES(916, "Trisha", "Murali", "C17", "4319-2021", "ts@gmail.com", "Cream Centre");
INSERT INTO CUSTOMER VALUES(917,"Harry","Potter","C18","1209-1270","hp@gmail.com", "Italiano Bakes");
INSERT INTO CUSTOMER VALUES(918,"Sherlock","Holmes","C19","1209-1370","sh@gmail.com", "Italiano Bakes");
INSERT INTO CUSTOMER VALUES(919,"Joey","Tribbiani","C20","1277-3450","jt@gmail.com","Teppan");
INSERT INTO CUSTOMER VALUES(920,"Chandler","Bing","C21","9999-4444","bing@gmail.com","Cream Centre");
INSERT INTO CUSTOMER VALUES(921,"Ross","Geller","C22","1200-3400","rg@gmail.com","Beijinzi");
INSERT INTO CUSTOMER VALUES(922,"Monica","Geller","C23","1000-5000","mon@gmail.com","KFC");
INSERT INTO CUSTOMER VALUES(923,"Rachel","Green","C24","2300-4500","rach@gmail.com","Taco Bell");
INSERT INTO CUSTOMER VALUES(924,"Phoebe","Buffay","C25","2000-9987","pheebs@gmail.com","Italiano Bakes");
INSERT INTO CUSTOMER VALUES(925,"Karthik","Manian","C26","1220-5660","mani@gmai.com","Swiss Cream");
INSERT INTO CUSTOMER VALUES(926,"Tommy","Shelby","C27","1520-0929","tom@gmail.com","Shree Mithai");


SELECT * FROM CUSTOMER;

INSERT INTO BILL VALUES(900,"Jonathan","Cecil","C1",173,"Online");
INSERT INTO BILL VALUES(901,"Tejas","Srinivas","C2",224,"Dine-in");
INSERT INTO BILL VALUES(902,"Krishna","Shree","C3",220,"Online");
INSERT INTO BILL VALUES(903,"Rhubanraj","Palani","C4",350,"Dine-in");
INSERT INTO BILL VALUES(904,"Nikhilesh","Shaji","C5", 66,"Dine-in");
INSERT INTO BILL VALUES(905,"Naveen","Kumar","C6",700,"Online");
INSERT INTO BILL VALUES(906,"Chandru","Sehar","C7",140,"Dine-in");
INSERT INTO BILL VALUES(907,"Shriram","Sundar","C8",340,"Dine-in");
INSERT INTO BILL VALUES(908,"Anantha","Raman","C9",376,"Online");
INSERT INTO BILL VALUES(909,"Navin","Krishna","C10",87,"Dine-in");
INSERT INTO BILL VALUES(910,"Mona","Milan","C11",306,"Dine-in");
INSERT INTO BILL VALUES(911,"Rahul","Gunaseelan","C12",374,"Dine-in");
INSERT INTO BILL VALUES(912,"Sai","Deepika","C13",230,"Online");
INSERT INTO BILL VALUES(913,"Ishita","Dwivedi","C14",210,"Dine-in");
INSERT INTO BILL VALUES(914,"Ananyaa","Sanjeev","C15",460,"Dine-in");
INSERT INTO BILL VALUES(915,"Pragadeesh","Murugan","C16",376, "Online");
INSERT INTO BILL VALUES(916,"Trisha","Murali","C17",176, "Online");
INSERT INTO BILL VALUES(917,"Harry","Potter","C18",120,"Dine-in");
INSERT INTO BILL VALUES(918,"Sherlock","Holmes","C19",87,"Dine-in");
INSERT INTO BILL VALUES(919,"Joey","Tribbiani","C20", 257,"Dine-in");
INSERT INTO BILL VALUES(920,"Chandler","Bing","C21",  194,"Online");
INSERT INTO BILL VALUES(921,"Ross","Geller","C22", 807 ,"Online");
INSERT INTO BILL VALUES(922,"Monica","Geller","C23", 194, "Dine-in");
INSERT INTO BILL VALUES(923,"Rachel","Green","C24", 340,"Online");
INSERT INTO BILL VALUES(924,"Phoebe","Buffay","C25", 495,"Dine-in");
INSERT INTO BILL VALUES(925,"Karthik","Manian","C26", 373,"Online");
INSERT INTO BILL VALUES(926,"Tommy","Shelby","C27", 498,"Dine-in");


SELECT * FROM BILL;

INSERT INTO MENU_BILL VALUES(900, "Starters", "Chicken 65", 3, 20, 60);
INSERT INTO MENU_BILL VALUES(900,"Fast Food","Pizza",1,23,23);
INSERT INTO MENU_BILL VALUES(900,"Main Course","Sushi",2,20,40);
INSERT INTO MENU_BILL VALUES(900,"Main Course","Panneer masala",4,10,40);
INSERT INTO MENU_BILL VALUES(900,"Desserts","Kaju Katli",1,10,10);
INSERT INTO MENU_BILL VALUES(900,"Main Course","Malai Kofta",1,6,6);

INSERT INTO MENU_BILL VALUES(901,"Main Course","Sashimi",2,22,44);
INSERT INTO MENU_BILL VALUES(901,"Fast food","Momos",3,30,90);
INSERT INTO MENU_BILL VALUES(901,"Desserts","Swiss icecream",1,30,30);
INSERT INTO MENU_BILL VALUES(901,"Starters","Chicken 65",1,20,20);
INSERT INTO MENU_BILL VALUES(901,"Main Course","Panneer masala",4,10,40);

INSERT INTO MENU_BILL VALUES(902,"Main Course","Italian",2,50,100);
INSERT INTO MENU_BILL VALUES(902,"Main Course","Italian",2,50,100);
INSERT INTO MENU_BILL VALUES(902,"Desserts","Kaju Katli",2,10,20);

INSERT INTO MENU_BILL VALUES(903,"Main Course","Noodles",1,250,250);
INSERT INTO MENU_BILL VALUES(903,"Main Course","Yorkshire Pudding",2,30,60);
INSERT INTO MENU_BILL VALUES(903,"Fast food","Sandwich",2,20,40);

INSERT INTO MENU_BILL VALUES(904,"Main Course","Sushi",1,20,20);
INSERT INTO MENU_BILL VALUES(904,"Fast food","Pizza",2,23,46);

INSERT INTO MENU_BILL VALUES(905,"Main Course","Mutton Biriyani",3,40,120);
INSERT INTO MENU_BILL VALUES(905,"Fast food","Momos",2,30,60);
INSERT INTO MENU_BILL VALUES(905,"Main Course","Butter Naan",2,250,500);
INSERT INTO MENU_BILL VALUES(905,"Main Course","Panneer masala",2,10,20);

INSERT INTO MENU_BILL VALUES(906,"Fast food","Sandwich",2,20,40);
INSERT INTO MENU_BILL VALUES(906,"Main Course","Sushi",2,20,40);
INSERT INTO MENU_BILL VALUES(906,"Desserts","Swiss icecream",2,30,60);

INSERT INTO MENU_BILL VALUES(907,"Main Course","Pasta",2,50,100);
INSERT INTO MENU_BILL VALUES(907,"Starters","Chicken 65",3,20,60);
INSERT INTO MENU_BILL VALUES(907,"Fast food","Momos",4,30,120);
INSERT INTO MENU_BILL VALUES(907,"Desserts","Kaju Katli",6,10,60);

INSERT INTO MENU_BILL VALUES(908,"Main Course","Noodles",1,250,250);
INSERT INTO MENU_BILL VALUES(908,"Main Course","Sashimi",3,22,66);
INSERT INTO MENU_BILL VALUES(908,"Fast food","Sandwich",3,20,60);

INSERT INTO MENU_BILL VALUES(909,"Main Course","Malai Kofta",3,6,18);
INSERT INTO MENU_BILL VALUES(909,"Fast food","Pizza",3,23,69);

INSERT INTO MENU_BILL VALUES(910,"Main Course","Yorkshire Pudding",3,30,90);
INSERT INTO MENU_BILL VALUES(910,"Main COurse","Sashimi",3,22,66);
INSERT INTO MENU_BILL VALUES(910,"Main Course","Mutton Biriyani",3,40,120);
INSERT INTO MENU_BILL VALUES(910,"Desserts","Kaju Katli",3,10,30);

INSERT INTO MENU_BILL VALUES(911,"Main Course","Noodles",1,250,250);
INSERT INTO MENU_BILL VALUES(911,"Main Course","Malai Kofta",3,6,18);
INSERT INTO MENU_BILL VALUES(911,"Starters","Chicken 65",3,20,60);
INSERT INTO MENU_BILL VALUES(911,"Fast food","Pizza",2,23,46);

INSERT INTO MENU_BILL VALUES(912,"Main Course","Pasta",2,50,100);
INSERT INTO MENU_BILL VALUES(912,"Fast food","Momos",3,30,90);
INSERT INTO MENU_BILL VALUES(912,"Main Course","Sushi",2,20,40);

INSERT INTO MENU_BILL VALUES(913,"Main Course","Panneer masala",3,10,30);
INSERT INTO MENU_BILL VALUES(913,"Main Course","Mutton Biriyani",3,40,120);
INSERT INTO MENU_BILL VALUES(913,"Fast food","Sandwich",3,20,60);

INSERT INTO MENU_BILL VALUES(914,"Desserts","Swiss icecream",3,30,90);
INSERT INTO MENU_BILL VALUES(914,"Desserts","Kaju Katli",3,10,30);
INSERT INTO MENU_BILL VALUES(914,"Main Course","Butter Naan",1,250,250);
INSERT INTO MENU_BILL VALUES(914,"Main Course","Yorkshire Pudding",3,30,90);

INSERT INTO MENU_BILL VALUES(915,"Main Course","Sashimi",3,22,66);
INSERT INTO MENU_BILL VALUES(915,"Main Course","Noodles",1,250,250);
INSERT INTO MENU_BILL VALUES(915,"Starters","Chicken 65",3,20,60);

INSERT INTO MENU_BILL VALUES(916,"Fast Food","Pizza",2,23,46);
INSERT INTO MENU_BILL VALUES(916,"Main Course","Sushi",4,20,80);
INSERT INTO MENU_BILL VALUES(916,"Main Course","Panneer masala",5,10,50);

INSERT INTO MENU_BILL VALUES(917,"Main Course","Panneer masala",2,10,20);
INSERT INTO MENU_BILL VALUES(917,"Starters","Chicken 65",2,20,40);
INSERT INTO MENU_BILL VALUES(917,"Desserts","Swiss icecream",2,30,60);

INSERT INTO MENU_bill VALUES(918,"Fast food","Pizza",1,23,23);
INSERT INTO MENU_BILL VALUES(918,"Desserts","Kaju Katli",2,10,20);
INSERT INTO MENU_BILL VALUES(918,"Main Course","Sashimi",2,22,44);

INSERT INTO MENU_BILL VALUES(919,"Main Course","Spaghetti",2,23,46);
INSERT INTO MENU_BILL VALUES(919,"Starters","Macaroni Magic",2,28,56);
INSERT INTO MENU_BILL VALUES(919,"Desserts","Cheesecake",1,35,35);
INSERT INTO MENU_BILL VALUES(919,"Main Course","Butter Roti",2,35,70);
INSERT INTO MENU_BILL VALUES(919,"Main Course","Butter Chicken",2,25,50);

INSERT INTO MENU_BILL VALUES(920,"Fast food","Pizza",2,23,46);
INSERT INTO MENU_BILL VALUES(920,"Main Course","Malai Kofta",2,6,12);
INSERT INTO MENU_BILL VALUES(920,"Desserts","Chocolate Mousse",2,40,80);
INSERT INTO MENU_BILL VALUES(920,"Starters","Macaroni Magic",2,28,56);

INSERT INTO MENU_BILL VALUES(921,"Main Course","Pasta",2,50,100);
INSERT INTO MENU_BILL VALUES(921,"Fast food","Momos",4,30,120);
INSERT INTO MENU_BILL VALUES(921,"Starters","Baked Aubergines",3,25,75);
INSERT INTO MENU_BILL VALUES(921,"Main Course","Butter Naan",2,250,500);
INSERT INTO MENU_BILL VALUES(921,"Main Course","Malai Kofta",2,6,12);

INSERT INTO MENU_BILL VALUES(922,"Desserts","Cheesecake",3,35,70);
INSERT INTO MENU_BILL VALUES(922,"Main Course","Panneer Sizzler",2,38,76);
INSERT INTO MENU_BILL VALUES(922,"Starters","Miso Soup",2,24,48);

INSERT INTO MENU_BILL VALUES(923,"Starters","Sausage Plait",4,14,56);
INSERT INTO MENU_BILL VALUES(923,"Desserts","Chocolate Mousse",4,40,160);
INSERT INTO MENU_BILL VALUES(923,"Main Course","Veg Biriyani",4,8,32);
INSERT INTO MENU_BILL VALUES(923,"Fast food","Pizza",4,23,92);

INSERT INTO MENU_BILL VALUES(924,"Main Course","Mutton Biriyani",3,40,120);
INSERT INTO MENU_BILL VALUES(924,"Main Course","Sushi",4,20,80);
INSERT INTO MENU_BILL VALUES(924,"Fast food","Pizza",5,23,115);
INSERT INTO MENU_BILL VALUES(924,"Desserts","Swiss icecream",6,30,180);

INSERT INTO MENU_BILL VALUES(925,"Fast food","Pizza",5,23,115);
INSERT INTO MENU_BILL VALUES(925,"Main Course","Sushi",6,20,120);
INSERT INTO MENU_BILL VALUES(925,"Main Course","Sashimi",4,22,88);
INSERT INTO MENU_BILL VALUES(925,"Desserts","Kaju Katli",5,10,50);

INSERT INTO MENU_BILL VALUES(926,"Fast food","Sandwich",5,20,100);
INSERT INTO MENU_BILL VALUES(926,"Main Course","Yorkshire Pudding",5,30,150);
INSERT INTO MENU_BILL VALUES(926,"Starters","Cheese Balls",4,50,200);
INSERT INTO MENU_BILL VALUES(926,"Main Course","Veg Biriyani",6,8,48);


INSERT INTO TABLES VALUES("T1", "4 Seats");
INSERT INTO TABLES VALUES("T2", "6 Seats");
INSERT INTO TABLES VALUES("T3", "3 Seats");
INSERT INTO TABLES VALUES("T4", "3 Seats");
INSERT INTO TABLES VALUES("T5", "2 Seats");
INSERT INTO TABLES VALUES("T6", "8 Seats");
INSERT INTO TABLES VALUES("T7", "4 Seats");
INSERT INTO TABLES VALUES("T8", "4 Seats");
INSERT INTO TABLES VALUES("T9", "6 Seats");
INSERT INTO TABLES VALUES("T10", "6 Seats");
INSERT INTO TABLES VALUES("T11", "2 Seats");
INSERT INTO TABLES VALUES("T12", "4 Seats");
INSERT INTO TABLES VALUES("T13", "4 Seats");
INSERT INTO TABLES VALUES("T14", "8 Seats");
INSERT INTO TABLES VALUES("T15", "6 Seats");


SELECT * FROM TABLES;

INSERT INTO BOOKING VALUES(NULL, "T1", "27/DEC/21-12AM", "C1");
INSERT INTO BOOKING VALUES(NULL, "T6", "27/DEC/21-12AM", "C1");
INSERT INTO BOOKING VALUES(NULL, "T3", "27/DEC/21-12AM", "C1");
INSERT INTO BOOKING VALUES(NULL, "T4", "09/OCT/21-2PM", "C3");
INSERT INTO BOOKING VALUES(NULL, "T9", "09/OCT/21-2PM", "C3");
INSERT INTO BOOKING VALUES(NULL, "T2", "11/AUG/21-12AM", "C2");
INSERT INTO BOOKING VALUES(NULL, "T3", "28/OCT/21-6AM", "C12");
INSERT INTO BOOKING VALUES(NULL, "T1", "28/OCT/21-6AM", "C12");
INSERT INTO BOOKING VALUES(NULL, "T2", "28/OCT/21-6AM", "C12");
INSERT INTO BOOKING VALUES(NULL, "T5", "28/OCT/21-6AM", "C12");
INSERT INTO BOOKING VALUES(NULL, "T7", "31/JAN/21-6PM", "C4");
INSERT INTO BOOKING VALUES(NULL, "T9", "20/NOV/21-12AM", "C5");
INSERT INTO BOOKING VALUES(NULL, "T5", "07/APR/21-8AM", "C7");
INSERT INTO BOOKING VALUES(NULL, "T10", "07/APR/21-8AM", "C7");
INSERT INTO BOOKING VALUES(NULL, "T6", "07/APR/21-8AM", "C7");
INSERT INTO BOOKING VALUES(NULL, "T7", "07/APR/21-8AM", "C7");
INSERT INTO BOOKING VALUES(NULL, "T4", "11/JUL/21-9PM", "C8");
INSERT INTO BOOKING VALUES(NULL, "T2", "27/DEC/21-9AM", "C15");
INSERT INTO BOOKING VALUES(NULL, "T7", "02/JUN/21-3PM", "C18");
INSERT INTO BOOKING VALUES(NULL, "T5", "22/SEP/21-7PM", "C19");
INSERT INTO BOOKING VALUES(NULL, "T15", "20/AUG/21-3AM", "C20");
INSERT INTO BOOKING VALUES(NULL, "T11", "21/JUN/21-2AM", "C23");
INSERT INTO BOOKING VALUES(NULL, "T12", "21/JUN/21-2AM", "C23");
INSERT INTO BOOKING VALUES(NULL, "T10", "21/JUN/21-2AM", "C23");
INSERT INTO BOOKING VALUES(NULL, "T14", "17/OCT/21-7AM", "C25");
INSERT INTO BOOKING VALUES(NULL, "T13", "05/MAR/21-10AM", "C27");


INSERT INTO HOME_DELIVERY VALUES("D101", "London","2021-12-27 12:30:45","9923-2345","C1",900);
INSERT INTO HOME_DELIVERY VALUES("D102", "Paris","2021-03-23 19:41:00",'1290-9876',"C3",902);
INSERT INTO HOME_DELIVERY VALUES("D103", "New York","2021-01-27 04:36:05",'1209-1234',"C6",905);
INSERT INTO HOME_DELIVERY VALUES("D104", "Tokyo","2021-07-17 00:00:00",'1277-1245',"C9",908);
INSERT INTO HOME_DELIVERY VALUES("D105", "London","2021-02-05 23:20:55",'6785-1234',"C13",912);
INSERT INTO HOME_DELIVERY VALUES("D106", "Paris","2021-11-06 08:22:31",'7890-2105',"C16",915);
INSERT INTO HOME_DELIVERY VALUES("D107", "Paris", "2021-10-09 11:32:09","4319-2021","C17",916);
INSERT INTO HOME_DELIVERY VALUES("D108","Beijing","2021-10-11 11:21:10" ,"9230-0000","C21",920);
INSERT INTO HOME_DELIVERY VALUES("D109","Mumbai","2021-12-12 03:24:24","9876-2345","C22",921);
INSERT INTO HOME_DELIVERY VALUES("D110","Chennai","2021-04-09 09:30:23","3490-1209","C24",923);
INSERT INTO HOME_DELIVERY VALUES("D111","Bangalore","2021-06-06 08:25:12","1255-3400","C26",925);

UPDATE HOME_DELIVERY SET DateTime = "2021-12-09 11:32:09" WHERE DeliveryId = "D107";

SELECT * FROM HOME_DELIVERY;

INSERT INTO DELIVERY_BOY VALUES(200,"D101");
INSERT INTO DELIVERY_BOY VALUES(209,"D102");
INSERT INTO DELIVERY_BOY VALUES(205,"D103");
INSERT INTO DELIVERY_BOY VALUES(203,"D104");
INSERT INTO DELIVERY_BOY VALUES(202,"D105");
INSERT INTO DELIVERY_BOY VALUES(207,"D106");
INSERT INTO DELIVERY_BOY VALUES(208,"D107");
INSERT INTO DELIVERY_BOY VALUES(209,"D108");
INSERT INTO DELIVERY_BOY VALUES(201,"D109");
INSERT INTO DELIVERY_BOY VALUES(202,"D110");
INSERT INTO DELIVERY_BOY VALUES(202,"D111");

SELECT * FROM DELIVERY_BOY;

INSERT INTO CASHIER VALUES(80,"Steve","Taco Bell","London","2500 USD",'M',"2007-12-09");
INSERT INTO CASHIER VALUES(81,"Reve","Cream Centre","New York","2300 USD",'M',"2008-04-03");
INSERT INTO CASHIER VALUES(82,"Stephen","KFC","California","2350 USD",'M',"2010-03-09");
INSERT INTO CASHIER VALUES(83,"Olivia","Shree Mithai","Jaipur","2400 USD",'F',"2009-12-10");
INSERT INTO CASHIER VALUES(84,"Avanti","Swiss Cream","Bern","1200 USD",'F',"2006-11-10");
INSERT INTO CASHIER VALUES(85,"Ryan","Italiano Bakes","London","1300 USD",'M',"2009-10-12");
INSERT INTO CASHIER VALUES(86,"Rohan","Bikaneriwaala","Chennai","1200 USD",'M',"2007-02-11");
INSERT INTO CASHIER VALUES(87,"Susan","Crispy Crunch","Mumbai","1800 USD",'F',"2008-02-02");
INSERT INTO CASHIER VALUES(88,"Bob","Beijinzi","Beijing","1700 USD",'M',"2010-09-09");
INSERT INTO CASHIER VALUES(89,"Eric","Teppan","Tokyo","2900 USD",'M',"2008-07-08");


# 1.	Identify the restaurant where the food item with lowest price is eaten by maximum number of customers.

SELECT 
    RestName, MAX(c) AS MaxCount
FROM
    (SELECT 
        RestName, COUNT(*) AS C
    FROM
        customer
    WHERE
        CustomerId IN (SELECT 
                CustomerId
            FROM
                Bill
            WHERE
                OrderId IN (SELECT 
                        OrderId
                    FROM
                        Menu_bill
                    WHERE
                        Name = (SELECT 
                                Name
                            FROM
                                Menu
                            WHERE
                                Price = (SELECT 
                                        MIN(Price)
                                    FROM
                                        Menu))))
    GROUP BY RestName) T;

#	2.	Identify the location of the restaurant where chef with highest salary is working.

SELECT 
    R.Name, R.Loc AS RestaurantLocation, C.ChefId, C.Salary
FROM
    Chef C
        JOIN
    Restaurant R ON R.Name = C.RestName
WHERE
    C.Salary = (SELECT 
            MAX(CAST(Salary AS SIGNED)) AS MX
        FROM
            Chef);
            
# 3.	Identify the online orders done from city where maximum online orders have been placed.            

SELECT 
    *
FROM
    (SELECT 
        *
    FROM
        Bill
    WHERE
        Type = 'Online') A
        JOIN
    Home_Delivery USING (OrderId)
WHERE
    Address = (SELECT 
            Address
        FROM
            Bill
                JOIN
            Home_Delivery USING (OrderId)
        WHERE
            Type = 'Online'
        GROUP BY Address
        HAVING COUNT(*) = (SELECT 
                MAX(C)
            FROM
                (SELECT 
                    Address, COUNT(*) AS C
                FROM
                    Bill
                JOIN Home_Delivery USING (OrderId)
                WHERE
                    Type = 'Online'
                GROUP BY Address) T));

# 4.	Which restaurant has the highest number of tables booked currently?

SELECT 
    RestName
FROM
    Customer C,
    Booking B,
    Tables T
WHERE
    C.CustomerId = B.CustId
        AND B.TableNum = T.TableNum
GROUP BY RestName
HAVING COUNT(*) = (SELECT 
        MAX(C)
    FROM
        (SELECT 
            COUNT(*) AS C
        FROM
            Customer C, Booking B, Tables T
        WHERE
            C.CustomerId = B.CustId
                AND B.TableNum = T.TableNum
        GROUP BY C.RestName) A);

# 5.	Find the details of tables booked in the restaurant where the highest paid waiter is working.

SELECT 
    C.CustomerId,
    C.FName,
    C.Contact,
    B.RestName,
    Book.BookingId,
    Book.DateTime,
    T.TableNum,
    T.Details
FROM
    Customer C,
    (SELECT 
        WaiterId, Name, RestName
    FROM
        (SELECT 
        *
    FROM
        Waiter
    WHERE
        Salary = (SELECT 
                MAX(CAST(Salary AS SIGNED))
            FROM
                Waiter)) A) B,
    Booking Book,
    Tables T
WHERE
    C.RestName = B.RestName
        AND Book.CustId = C.CustomerId
        AND T.TableNum = Book.TableNum;

# 6.	Display the details of restaurant and its chef where the order with maximum bill amount is made.
       
SELECT 
    C.CustomerId,
    C.FName,
    C.LName,
    R.Name AS RestaurantName,
    Ch.Name,
    Ch.Specialization,
    Ch.Salary,
    B.TotalAmount
FROM
    Customer C,
    Bill B,
    Restaurant R,
    Chef Ch
WHERE
    C.OrderId = B.OrderId
        AND C.RestName = R.Name
        AND R.Name = Ch.RestName
        AND TotalAmount = (SELECT 
            MAX(TotalAmount)
        FROM
            bill);

# 7. Display the food items ordered by customer id C1.

SELECT 
    C.CustomerId,
    C.Fname,
    C.EmailId,
    M.Name,
    M.Type,
    M.Quantity,
    M.UnitPrice,
    M.Price
FROM
    Customer C,
    Bill B,
    Menu_bill M
WHERE
    C.CustomerId = B.CustomerId
        AND C.CustomerId = 'C1'
        AND B.OrderId = M.OrderId;

# 8.	List the total amount gained by all owners in descending order.

SELECT 
    *
FROM
    Owner O
        NATURAL JOIN
    (SELECT 
        C.RestName, SUM(B.TotalAmount) AS TotalAmount
    FROM
        Customer C
    JOIN Bill B USING (CustomerId)
    GROUP BY (C.RestName)) A
ORDER BY TotalAmount DESC;

# 9.	Display the orders placed by youngest delivery boy.

SELECT 
    DB.BoyId, DBD.FName, DBD.LName, HD.DeliveryId, HD.Address as OrderAdd, HD.Contact as OrderCon, HD.DateTime
FROM
    Delivery_Boy DB,
    Delivery_Boy_Details DBD,
    Home_Delivery HD
WHERE
    HD.DeliveryId = DB.DeliveryId
        AND DB.BoyId = DBD.DeliveryBoyId
        AND BDate = (SELECT 
            MAX(BDate)
        FROM
            Delivery_Boy_Details);
            
# 10.	Display all employees working in a restaurant.

SELECT 
    *
FROM
    Waiter W
        JOIN
    (SELECT 
        *
    FROM
        Cashier C
    JOIN Owner O USING (RestName)) A USING (RestName);

# 11.	Which restaurant’s Indian dishes is liked by many people?

SELECT 
    RestName, COUNT(*) AS MaxCount
FROM
    Customer
WHERE
    OrderId IN (SELECT DISTINCT
            OrderId
        FROM
            Menu_Bill
        WHERE
            Name IN (SELECT 
                    Name
                FROM
                    Menu
                WHERE
                    Category = 'Indian'))
GROUP BY RestName
HAVING COUNT(*) = (SELECT 
        MAX(C)
    FROM
        (SELECT 
            RestName, COUNT(*) AS C
        FROM
            Customer
        WHERE
            OrderId IN (SELECT DISTINCT
                    OrderId
                FROM
                    Menu_Bill
                WHERE
                    Name IN (SELECT 
                            Name
                        FROM
                            Menu
                        WHERE
                            Category = 'Indian'))
        GROUP BY RestName) A);

# 12.	Display customer names who ate all dishes eaten by customer Id C5. (division)

SELECT 
    CustomerId, FName, LName
FROM
    Customer C
WHERE
    NOT EXISTS( SELECT 
            Name
        FROM
            (SELECT 
                Name
            FROM
                Menu_Bill
            WHERE
                OrderId IN (SELECT 
                        OrderId
                    FROM
                        Customer
                    WHERE
                        CustomerId = 'C5')) A
        WHERE
            Name NOT IN (SELECT 
                    Name
                FROM
                    Menu_Bill MB
                WHERE
                    MB.OrderId = C.OrderId));
                    
# 13.	Find the restaurant which works for minimum hours.

SELECT 
    *
FROM
    Restaurant
WHERE
    CAST(SUBSTR(OCTime, 11, 3) AS SIGNED) + 12 - CAST(SUBSTR(OCTime, 1, 2) AS SIGNED) = (SELECT 
            MIN(diff)
        FROM
            (SELECT 
                CAST(SUBSTR(OCTime, 11, 3) AS SIGNED) + 12 - CAST(SUBSTR(OCTime, 1, 2) AS SIGNED) AS diff
            FROM
                Restaurant) A);

# 14.	Get the details of vacant tables in restaurant .

SELECT 
    TableNum, Details
FROM
    Tables
WHERE
    TableNum NOT IN (SELECT 
            TableNum
        FROM
            Customer C,
            Booking B
        WHERE
            C.CustomerId = B.CustId
                AND C.RestName = 'KFC');

# 15. List, for every table, the number of times it has been booked, including those tables that have never been booked.

SELECT 
    *
FROM
    Tables
        LEFT OUTER JOIN
    Booking USING (TableNum);

# 16.	Create a view for Menu with its name and Price.

CREATE VIEW MENUS AS
    SELECT 
        Name, Price
    FROM
        Menu;

DELIMITER //
CREATE PROCEDURE SHOW_MENU()
BEGIN
	SELECT * FROM MENUS;
END //

CALL SHOW_MENU();

#DROP VIEW MENUS;
#DROP PROCEDURE SHOW_MENU;

# 17.	Display the details of the waiters who are working in the same restaurant.

#DROP TABLE WaiterList;

CREATE TABLE WaiterList (
    Restaurant VARCHAR(100),
    WaiterId INT,
    WaiterName VARCHAR(15),
    Salary VARCHAR(30),
    Sex CHAR(1),
    PRIMARY KEY (WaiterId)
);

DELIMITER $$
CREATE PROCEDURE DEMO()
BEGIN
	DECLARE Restaurant VARCHAR(100);
    DECLARE WaiterId INT;
    DECLARE Name VARCHAR(15);
    DECLARE Salary VARCHAR(30);
    DECLARE Sex CHAR(1);
    DECLARE NoDatafound INT DEFAULT 0;
    DECLARE Cur CURSOR FOR SELECT DISTINCT R.Name, W.Waiterid, W.Name, W.Salary, W.Sex FROM Restaurant R, Waiter W WHERE R.Name = W.RestName AND R.Name IN (SELECT DISTINCT Re.Name FROM Restaurant Re, Waiter Wa WHERE Re.Name = Wa.RestName GROUP BY Re.Name HAVING COUNT(*) >= 2) ORDER BY R.Name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET NoDatafound = 1;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET NoDatafound = 1;  
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET NoDatafound = 1;
    
    OPEN Cur;
		LABEL: LOOP
        IF NoDatafound = 1 THEN
        LEAVE LABEL;
        END IF;
        IF NOT NoDatafound = 1 THEN
        FETCH Cur INTO Restaurant, WaiterId, Name, Salary, Sex;
        INSERT INTO WaiterList VALUES(Restaurant, WaiterId, Name, Salary, Sex);
        END IF;
        END LOOP LABEL;
    CLOSE Cur;
END $$

CALL DEMO();
SELECT * FROM WaiterList;
#DROP PROCEDURE DEMO;

# 18. Write a trigger for updating salary of chef by 10% when customer orders more than 5 food items from his/her restaurant.

DELIMITER ^^
CREATE TRIGGER OnUpdate AFTER INSERT ON Customer FOR EACH ROW
BEGIN
DECLARE cou INT;
SELECT COUNT(*) INTO cou FROM Customer GROUP BY new.RestName;
IF cou > 5 THEN
UPDATE chef SET Salary = Salary + Salary*0.10 WHERE RestName = new.RestName;
END IF;
END ^^

INSERT INTO BILL VALUES(927,"Enola","Holmes","C28",100,"Dine-in");
INSERT INTO MENU_BILL VALUES(927,"Main Course","Sushi",5,20,100);
INSERT INTO CUSTOMER VALUES(927,"Enola","Holmes","C28","1908-8989","eno@gmail.com","KFC");

#DROP TRIGGER OnUpdate;

# 19. Display the cashier who got highest salary who lives in city which has letter ‘a’.

SELECT 
    *
FROM
    Cashier
WHERE
    Name IN (SELECT 
            Name
        FROM
            Cashier
        WHERE
            city LIKE '%a%')
        AND Salary = (SELECT 
            MAX(Salary)
        FROM
            cashier
        WHERE
            city LIKE '%a%');

# 20.	Delete menu which is ordered least.

DELETE FROM MENU 
WHERE
    Name IN (SELECT 
        Name
    FROM
        MENU_BILL
    GROUP BY Name
    HAVING COUNT(*) = (SELECT 
            MIN(c)
        FROM
            (SELECT 
                COUNT(*) AS c
            FROM
                MENU_BILL
            GROUP BY Name) A));
