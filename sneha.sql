 SELECT column_name, data_type
 FROM information_schema.columns
 WHERE table_name = 'health';
 DROP TABLE IF EXISTS health;

CREATE TABLE health (
    category VARCHAR(100),
    mrp NUMERIC(10,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INT,
    discountedSellingPrice NUMERIC(10,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

INSERT INTO health (
    category,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice,
    weightInGms,
    outOfStock,
    quantity)
VALUES
('Face Wash', 250.00, 10.00, 100, 225.00, 150, FALSE, 2),
('Shampoo', 350.00, 15.00, 50, 297.50, 200, FALSE, 1),
('Moisturizer', 400.00, 20.00, 75, 320.00, 100, FALSE, 3),
('Sunscreen', 500.00, 10.00, 40, 450.00, 100, FALSE, 1),
('Soap', 100.00, 5.00, 200, 95.00, 125, FALSE, 4),
('Face Serum', 600.00, 25.00, 30, 450.00, 30, FALSE, 1),
('Body Lotion', 300.00, 10.00, 60, 270.00, 250, FALSE, 2),
('Lip Balm', 120.00, 0.00, 0, 120.00, 10, TRUE, 1),
('Conditioner', 280.00, 15.00, 45, 238.00, 180, FALSE, 2),
('Hand Cream', 180.00, 10.00, 80, 162.00, 50, FALSE, 1);
select * from health;
select category ,mrp,discountedsellingPrice from health;
select distinct category from health;
select count(*)as total_records from health;

--crud operations 
INSERT INTO health (
    category,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice,
    weightInGms,
    outOfStock,
    quantity)
VALUES
('primer',100,200,100,23,12,FAlSE,1);
--update
update health SET mrp=120 where category='primer';
--where function
select*from health where discountpercent=200;
--delete function
delete from health where category='primer';
select* from health where mrp>300;
select *from health where discountpercent>20 and availablequantity>10;
select * from health where mrp between 50 and 100;
select * from health where category LIKE '%Serum%';
select* from health where outofstock='TRUE';
select *from health orderby  mrp DESC limit 5;
--aggregate functions(count,sum,avg,min.max)
select count(*) from health;
select avg(mrp) from health;
select max(mrp) as highest_mrp , min(mrp) as lowest_mrp from health;
select count(*) availability from health;
select count(*) outofstock from health;
--grouping(group by,having) group by is used to group the similar products
SELECT category, COUNT(*) AS total_products
FROM health
GROUP BY category;

