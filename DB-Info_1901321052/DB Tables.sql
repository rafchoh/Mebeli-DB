--Created BY: 
--Рафет Халил, СИ Редовно, Фак.№ 1901321052

--Моделиране и анализ на софтуер
--=======================================================================================================================================================

CREATE TABLE Category (
    CategoryID int NOT NULL PRIMARY KEY IDENTITY (1, 1),
    CategoryName nvarchar(50) NOT NULL,
    Info nvarchar(150)
);


CREATE TABLE Sale (
    SaleID int NOT NULL	PRIMARY KEY IDENTITY (1, 1),
    DiscountName nvarchar(50) NOT NULL,
    DiscountInfo nvarchar(150),
    Discount DECIMAL(6,2) NOT NULL,
    DiscountValidTill DATETIME NOT NULL
);


CREATE TABLE UserV (
    UserID int NOT NULL	PRIMARY KEY IDENTITY (1, 1),
    FullName nvarchar(25) NOT NULL,
    Email nvarchar(150) NOT NULL,
    PhoneNumber nvarchar(15) NOT NULL
);


CREATE TABLE Product (
    ProductID int NOT NULL PRIMARY KEY IDENTITY (1, 1),
    CategoryName nvarchar(50) NOT NULL,
    ProductName nvarchar(75) NOT NULL,
    Price DECIMAL(6,2) NOT NULL,
    Discount DECIMAL(6,2),
    ProductInfo nvarchar(255),
    Stock bit NOT NULL,
    SaleID int NOT NULL,
        FOREIGN KEY (SaleID) REFERENCES Sale(SaleID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE CategoryHasProduct (
    CategoryHasProductID int NOT NULL PRIMARY KEY IDENTITY (1, 1),
    CategoryID int NOT NULL,	
    ProductID int NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Cart (
    CartID int NOT NULL	PRIMARY KEY IDENTITY (1, 1),
    CategoryName nvarchar(50) NOT NULL,
    ProductName nvarchar(75) NOT NULL,
    NumOfProducts TINYINT NOT NULL,
    TotalPrice DECIMAL(8,2) NOT NULL,
    DateOfCreation DATETIME DEFAULT GETDATE(),
    DateOfUpdate DATETIME,
    UserID int NOT NULL,
	FOREIGN KEY (UserID) REFERENCES UserV(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE CartHasProduct (
    CartHasProductID int NOT NULL PRIMARY KEY IDENTITY (1, 1),
    CartID int NOT NULL,	
    ProductID int NOT NULL,
    DateOfCreation DATETIME DEFAULT GETDATE(),
    DateOfUpdate DATETIME,
	FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY IDENTITY (1, 1),
    CartID int NOT NULL,	
    UserID int NOT NULL,
    ProductName nvarchar(75) NOT NULL,
    NumOfProducts TINYINT NOT NULL,
    TotalPrice DECIMAL(8,2) NOT NULL,
    FullName nvarchar(25) NOT NULL,
    Email nvarchar(150) NOT NULL,
    PhoneNumber nvarchar(15) NOT NULL,
    HomeAddress nvarchar(200) NOT NULL,
    PaymentInfo nvarchar(150) NOT NULL,
    AdditionalInfo nvarchar(350), 
    OrderDate DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserID) REFERENCES UserV(UserID) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
