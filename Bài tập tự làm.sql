IF EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME = 'Task10_BTTL')
	DROP DATABASE Task10_BTTL
GO
CREATE DATABASE Task10_BTTL
USE Task10_BTTL
go
-- tạo bảng Toys
CREATE TABLE Toys (
	ProductCode VARCHAR(5) PRIMARY KEY,
	Name VARCHAR(30),
	Category VARCHAR(30),
	Manufacturer VARCHAR(40),
	AgeRange VARCHAR(15),
	UnitPrice MONEY,
	Netweight INT,
	QtyOnHand INT
)
go
-- Thêm dữ liệu
INSERT INTO Toys (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
	VALUES
		('A1', 'Small Car', 'Car Toy 1', '2021-11-03', '3 - 6', 10000, 100, 12),
		('A2', 'Medium Car', 'Car Toy 2', '2021-11-05', '3 - 7', 20000, 500, 20),
		('A3', 'Big Car', 'Car Toy 3', '2021-11-08', '5 - 10', 50000, 1000, 30),
		('A4', 'Small BarbieGirl', 'Doll 1', '2021-12-03', '2 - 5', 15000, 50, 15),
		('A5', 'Medium BarbieGirl', 'Doll 2', '2021-12-05', '3 - 6', 25000, 100, 50),
		('A6', 'Big BarbieGirl', 'Doll 3', '2021-12-08', '4 - 8', 50000, 300, 70),
		('A7', 'Small Water Gun', 'Gun Toy 1', '2022-01-03', '5 - 7', 100000, 200, 40),
		('A8', 'Medium Water Gun', 'Gun Toy 2', '2022-01-05', '5 - 9', 150000, 300, 25),
		('A9', 'Big Water Gun', 'Gun Toy 3', '2022-01-08', '5 - 12', 200000, 600, 70),
		('A10', 'Spider Man', 'Doll 4', '2021-10-03', '3 - 8', 120000, 400, 60)
GO		
-- Viết câu lệnh tạo Thủ tục lưu trữ có tên là HeavyToys cho phép liệt kê tất cả các loại đồ chơi có trọng lượng lớn hơn 500g.
CREATE PROCEDURE HeavyToys
AS
SELECT Category FROM Toys 
WHERE Netweight > 500
GO
EXECUTE HeavyToys
go
-- Viết câu lệnh tạo Thủ tục lưu trữ có tên là PriceIncrease cho phép tăng giá của tất cả các loại đồ chơi lên thêm 10000 đơn vị giá.
SELECT * FROM Toys
go
CREATE PROCEDURE PriceIncrease
	@Increase int = 10000
AS
UPDATE Toys
SET UnitPrice += @Increase
GO
EXEC PriceIncrease
GO
SELECT * FROM Toys
GO
-- Viết câu lệnh tạo Thủ tục lưu trữ có tên là QtyOnHand làm giảm số lượng đồ chơi còn trong của hàng mỗi thứ 5 đơn vị.
CREATE PROCEDURE QtyOnHand
	@DecreaseQty int = 5
AS
UPDATE Toys
SET QtyOnHand -= @DecreaseQty
GO
EXEC QtyOnHand
GO
SELECT * FROM Toys