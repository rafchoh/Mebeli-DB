Created BY: 
Рафет Халил, СИ Редовно, Фак.№ 1901321052

Моделиране и анализ на софтуер
=======================================================================================================================================================

INSERT INTO Category (CategoryName, Info)
VALUES (N'Дневна', N'Продукти за обзавеждане на дневната ви.');
INSERT INTO Category (CategoryName, Info)
VALUES (N'Спалня', N'Продукти за обзавеждане на спалнята ви.');
INSERT INTO Category (CategoryName, Info)
VALUES (N'Преоценени', N'Преоценени стоки');


INSERT INTO Sale(DiscountName, DiscountInfo, Discount, DiscountValidTill)
VALUES (N'Черен петък', '35%', 0.35, 2021-11-28);
INSERT INTO Sale(DiscountName, DiscountInfo, Discount, DiscountValidTill)
VALUES (N'Новогодишни намаления', '23%', 0.23, 2022-01-05);
INSERT INTO Sale(DiscountName, DiscountInfo, Discount, DiscountValidTill)
VALUES (N'Пролетни отстъпки', '15%', 0.15, 2022-03-27);


INSERT INTO UserV(FullName, Email, PhoneNumber)
VALUES (N'Иван Георгиев', 'GIvan@gmail.com', '0883854217');
INSERT INTO UserV(FullName, Email, PhoneNumber)
VALUES (N'Стефан Стефанов', 'stf-stf@abv.bg', '+359889043601');
INSERT INTO UserV(FullName, Email, PhoneNumber)
VALUES (N'Силвия Мисова', 'misova_silviq@outlook.com', '0980795321');
INSERT INTO UserV(FullName, Email, PhoneNumber)
VALUES (N'Стефани Кирова', 'ms.kirova@gmail.com', '0872854039');


INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Преоценени', N'Спален комплект', 383, 1.00, N'Мостра 210607-08', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Спален комплект', 383, 1.00, N'Мостра 210607-08', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Преоценени', N'Гардероб', 295, 1.00, N'Мостра 210607-01', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Гардероб', 295, 1.00, N'Мостра 210607-01', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Фабиано II + матрак', 1906, 0.35, N'Спален комплект + матрак 160/200 , светъл периер + антрацит гланц и зелен океан', 0, (SELECT SaleID FROM Sale WHERE Discount = 0.35));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Дневна', N'Бохо', 1516, 0.35, N'Разтегателен диван , тъмно зелен', 1, (SELECT SaleID FROM Sale WHERE Discount = 0.35));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Дневна', N'Майра', 477, 0.35, N'Секция , Silk + Magma + дъб колониален', 0, (SELECT SaleID FROM Sale WHERE Discount = 0.35));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Нора + матрак', 1156, 0.35, N'Спален комплект + матрак 160/200 , Magma + дъб Евок', 1, (SELECT SaleID FROM Sale WHERE Discount = 0.35));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Дневна', N'Стефани', 92, 0.35, N'Холна маса , дъб сонома + бял гланц', 0, (SELECT SaleID FROM Sale WHERE Discount = 0.35));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Лео покет + мемори пяна', 835, 1.00, N'164/210, двулицев матрак, 164/210', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Сения', 1830, 1.00, N'Спален комплект , орех + черен гланц', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Спалня', N'Колекция Бланко', 3493, 1.00, N'Нощен шкаф, Трикрил гардероб, Спалня за матрак, ТВ шкаф, 2*Скрин /snow pine + new grey', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Дневна', N'Колекция Кама', 1861, 1.00, N'2*Етажерка за стена, 2*ТВ модул, Шкаф с лед осветление /дъб камарг + черно', 1, (SELECT SaleID FROM Sale WHERE Discount = 1.00));
INSERT INTO Product(CategoryName, ProductName, Price, Discount, ProductInfo, Stock, SaleID)
VALUES (N'Дневна', N'Софи', 361, 0.35, N'Фотьойл , жълт + принт', 1, (SELECT SaleID FROM Sale WHERE Discount = 0.35));


INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Спалня', (SELECT ProductName FROM Product WHERE ProductName=N'Нора + матрак' AND CategoryName=N'Спалня'), 3, 3*404.6, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'GIvan@gmail.com'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Дневна', (SELECT ProductName FROM Product WHERE ProductName=N'Колекция Кама' AND CategoryName=N'Дневна'), 1, 1861, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'GIvan@gmail.com'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Дневна', (SELECT ProductName FROM Product WHERE ProductName=N'Бохо' AND CategoryName=N'Дневна'), 1, 530.6, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'GIvan@gmail.com'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Дневна', (SELECT ProductName FROM Product WHERE ProductName=N'Колекция Кама' AND CategoryName=N'Дневна'), 1, 1861, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'stf-stf@abv.bg'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Спалня', (SELECT ProductName FROM Product WHERE ProductName=N'Колекция Бланко' AND CategoryName=N'Спалня'), 1, 3493, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'stf-stf@abv.bg'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Спалня', (SELECT ProductName FROM Product WHERE ProductName=N'Лео покет + мемори пяна' AND CategoryName=N'Спалня'), 1, 835, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'ms.kirova@gmail.com'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Спалня', (SELECT ProductName FROM Product WHERE ProductName=N'Сения' AND CategoryName=N'Спалня'), 1, 1830, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'ms.kirova@gmail.com'));
INSERT INTO Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Преоценени', (SELECT ProductName FROM Product WHERE ProductName=N'Гардероб' AND CategoryName=N'Преоценени'), 3, 3*295, GETDATE(), NULL, (SELECT UserID FROM UserV WHERE Email = 'misova_silviq@outlook.com'));
INSERT INTO dbo.Cart(CategoryName, ProductName, NumOfProducts, TotalPrice, DateOfCreation, DateOfUpdate, UserID)
VALUES (N'Дневна', (SELECT ProductName FROM Product WHERE ProductName=N'Софи' AND CategoryName=N'Дневна'), 2, 2*(361*0.35), GETDATE(), NULL, (SELECT UserID FROM UserV WHERE UserID = 4));


INSERT INTO Orders(CartID, UserID, ProductName, NumOfProducts, TotalPrice, FullName, Email, PhoneNumber, HomeAddress, PaymentInfo, AdditionalInfo, OrderDate)
VALUES ((SELECT CartID FROM Cart WHERE ProductName = N'Нора + матрак' AND UserID = 1), (SELECT UserID FROM UserV WHERE Email = 'GIvan@gmail.com'), N'Нора + матрак, Колекция Кама, Бохо', 5, 3605.40, N'Иван Георгиев', 'GIvan@gmail.com', '0883854217', N'гр.София, ул. „Хубавка“ 2А', N'наложен платеж', '', GETDATE());
INSERT INTO Orders(CartID, UserID, ProductName, NumOfProducts, TotalPrice, FullName, Email, PhoneNumber, HomeAddress, PaymentInfo, AdditionalInfo, OrderDate)
VALUES ((SELECT CartID FROM Cart WHERE ProductName = N'Колекция Кама' AND UserID = 2), (SELECT UserID FROM UserV WHERE Email = 'stf-stf@abv.bg'), N'Колекция Бланко, Колекция Кама', 2, 5354, N'Стефан Стефанов', stf-stf@abv.bg, '+359889043601', N'гр.София, ул. „Захари Круша“ 24', N'наложен платеж', '', GETDATE());
INSERT INTO Orders(CartID, UserID, ProductName, NumOfProducts, TotalPrice, FullName, Email, PhoneNumber, HomeAddress, PaymentInfo, AdditionalInfo, OrderDate)
VALUES ((SELECT CartID FROM Cart WHERE ProductName = N'Гардероб' AND UserID = 3), (SELECT UserID FROM UserV WHERE Email = 'misova_silviq@outlook.com'), N'Гардероб', 3, 885, N'Силвия Мисова', 'misova_silviq@outlook.com', '0980795321', N'гр.Пловдив, бул. „Освобождение“ 39', N'наложен платеж', '', GETDATE());
INSERT INTO Orders(CartID, UserID, ProductName, NumOfProducts, TotalPrice, FullName, Email, PhoneNumber, HomeAddress, PaymentInfo, AdditionalInfo, OrderDate)
VALUES ((SELECT CartID FROM Cart WHERE ProductName = N'Сения' AND UserID = 4), (SELECT UserID FROM UserV WHERE Email = 'ms.kirova@gmail.com'), N'Лео покет + мемори пяна, Сения, Софи', 4, 2917.70, N'Стефани Кирова', 'ms.kirova@gmail.com', '0872854039', N'Хасково, ул. „Момчил Войвода“ 2', N'наложен платеж', '', GETDATE());
_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________