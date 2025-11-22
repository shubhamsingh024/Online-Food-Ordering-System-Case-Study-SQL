#Database
CREATE DATABASE food_ordering;
USE food_ordering;

#Tables 
#customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(30),
    RegistrationDate DATE NOT NULL
);
#restraunts
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(255) NOT NULL,
    Address VARCHAR(500),
    CuisineType VARCHAR(100)
);
#menuitem
CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT NOT NULL,
    ItemName VARCHAR(255) NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    Description TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
#orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
#orderdetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Quantity INT NOT NULL,
    ItemPrice DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);
#review
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    RestaurantID INT NOT NULL,
    CustomerID INT NOT NULL,
    ReviewDate DATE NOT NULL,
    Rating DECIMAL(2,1) NOT NULL,
    Comments TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

#Show Table
SHOW TABLES;

#inserting data
#customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, RegistrationDate) VALUES
(1001, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '9876543210', '2024-01-05'),
(1002, 'Anjali', 'Mehta', 'anjali.mehta@example.com', '9876501234', '2024-01-12'),
(1003, 'Arjun', 'Singh', 'arjun.singh@example.com', '9876012345', '2024-02-01'),
(1004, 'Priya', 'Rao', 'priya.rao@example.com', '9876023456', '2024-02-18'),
(1005, 'Sanjay', 'Patel', 'sanjay.patel@example.com', '9876034567', '2024-03-10'),
(1006, 'Neha', 'Sharma', 'neha.sharma@example.com', '9876045678', '2024-03-22'),
(1007, 'Vikram', 'Joshi', 'vikram.joshi@example.com', '9876056789', '2024-04-05'),
(1008, 'Meera', 'Iyer', 'meera.iyer@example.com', '9876067890', '2024-04-15'),
(1009, 'Aman', 'Gupta', 'aman.gupta@example.com', '9876078901', '2024-05-01'),
(1010, 'Kavita', 'Desai', 'kavita.desai@example.com', '9876089012', '2024-05-20');

#restraunt
INSERT INTO Restaurants (RestaurantID, RestaurantName, Address, CuisineType) VALUES
(2001, 'Spice Villa', 'MG Road, Bangalore', 'Indian'),
(2002, 'Green Bowl', 'Kormangala, Bangalore', 'Healthy'),
(2003, 'Dragon Palace', 'Powai, Mumbai', 'Chinese'),
(2004, 'Pizza Point', 'Andheri West, Mumbai', 'Italian'),
(2005, 'Burger Hub', 'Connaught Place, Delhi', 'Fast Food'),
(2006, 'Tandoori Nights', 'Rohini, Delhi', 'Indian'),
(2007, 'Sushi Express', 'Banjara Hills, Hyderabad', 'Japanese'),
(2008, 'Dosa Corner', 'T Nagar, Chennai', 'South Indian'),
(2009, 'Creamy Crust Cafe', 'Park Street, Kolkata', 'Bakery'),
(2010, 'Global Bites', 'Gachibowli, Hyderabad', 'Continental');

#menuitems
INSERT INTO MenuItems (MenuItemID, RestaurantID, ItemName, Price, Description) VALUES
(3001, 2001, 'Butter Chicken', 320.00, 'Creamy tomato gravy with tender chicken'),
(3002, 2001, 'Paneer Tikka', 250.00, 'Grilled paneer with Indian spices'),
(3003, 2001, 'Veg Biryani', 220.00, 'Aromatic rice with vegetables and spices'),
(3004, 2002, 'Quinoa Salad', 280.00, 'Fresh mixed veggies with quinoa'),
(3005, 2002, 'Avocado Toast', 240.00, 'Toasted bread topped with fresh avocado'),
(3006, 2002, 'Greek Salad', 260.00, 'Olives, feta cheese, cucumber'),
(3007, 2003, 'Hakka Noodles', 180.00, 'Stir-fried noodles with veggies'),
(3008, 2003, 'Chicken Manchurian', 220.00, 'Fried chicken in spicy gravy'),
(3009, 2003, 'Fried Rice', 160.00, 'Classic Chinese fried rice'),
(3010, 2004, 'Margherita Pizza', 350.00, 'Classic pizza with cheese and basil'),
(3011, 2004, 'Veggie Supreme Pizza', 420.00, 'Loaded with vegetables'),
(3012, 2004, 'Pasta Alfredo', 300.00, 'Creamy white sauce pasta'),
(3013, 2005, 'Cheese Burger', 180.00, 'Juicy patty with cheese'),
(3014, 2005, 'Veg Burger', 150.00, 'Crispy veggie patty'),
(3015, 2005, 'French Fries', 90.00, 'Crispy golden fries'),
(3016, 2006, 'Chicken Tandoori', 350.00, 'Roasted chicken with spices'),
(3017, 2006, 'Dal Makhani', 200.00, 'Slow-cooked dal with butter'),
(3018, 2006, 'Garlic Naan', 60.00, 'Naan with garlic flavor'),
(3019, 2007, 'California Roll', 280.00, 'Crab, avocado and cucumber'),
(3020, 2007, 'Veg Sushi', 240.00, 'Assorted veggie sushi'),
(3021, 2007, 'Ramen Bowl', 300.00, 'Noodles in rich broth'),
(3022, 2008, 'Masala Dosa', 120.00, 'Crispy dosa with masala filling'),
(3023, 2008, 'Idli Sambar', 90.00, 'Soft idlis with sambar'),
(3024, 2008, 'Vada Plate', 100.00, 'Crispy vadas with chutney'),
(3025, 2009, 'Chocolate Muffin', 80.00, 'Soft muffin with chocolate chips'),
(3026, 2009, 'Croissant', 70.00, 'Fresh buttery croissant'),
(3027, 2009, 'Coffee Latte', 150.00, 'Rich and creamy coffee'),
(3028, 2010, 'Grilled Chicken', 350.00, 'Grilled chicken with herbs'),
(3029, 2010, 'Veg Lasagna', 320.00, 'Layered pasta with veggies'),
(3030, 2010, 'Garlic Bread', 160.00, 'Toasted garlic bread');

#orders
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, OrderDate, TotalAmount) VALUES
(4001, 1001, 2001, '2025-06-01', 570.00),
(4002, 1003, 2004, '2025-06-03', 350.00),
(4003, 1005, 2005, '2025-01-10', 330.00),  
(4004, 1002, 2008, '2025-06-06', 210.00),
(4005, 1006, 2003, '2025-02-05', 380.00),  
(4006, 1009, 2010, '2025-06-10', 510.00),
(4007, 1004, 2009, '2025-04-15', 150.00),  
(4008, 1010, 2007, '2025-05-10', 580.00), 
(4009, 1001, 2006, '2025-06-18', 410.00),
(4010, 1008, 2002, '2025-06-20', 540.00),
(4011, 1007, 2001, '2025-06-22', 480.00),
(4012, 1009, 2004, '2025-06-25', 450.00),
(4013, 1003, 2003, '2025-06-27', 300.00),
(4014, 1005, 2008, '2025-06-28', 310.00),
(4015, 1002, 2005, '2025-06-30', 230.00);

#orderdeatils
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, ItemPrice) VALUES
(5001, 4001, 3001, 1, 320.00),
(5002, 4001, 3002, 1, 250.00),
(5003, 4002, 3010, 1, 350.00),
(5004, 4003, 3013, 1, 180.00),
(5005, 4003, 3015, 1, 150.00),
(5006, 4004, 3022, 1, 120.00),
(5007, 4004, 3023, 1, 90.00),
(5008, 4005, 3007, 1, 180.00),
(5009, 4005, 3008, 1, 200.00),
(5010, 4006, 3028, 1, 350.00),
(5011, 4006, 3030, 1, 160.00),
(5012, 4007, 3025, 1, 80.00),
(5013, 4007, 3026, 1, 70.00),
(5014, 4008, 3019, 1, 280.00),
(5015, 4008, 3021, 1, 300.00),
(5016, 4009, 3016, 1, 350.00),
(5017, 4009, 3018, 1, 60.00),
(5018, 4010, 3004, 1, 280.00),
(5019, 4010, 3006, 1, 260.00),
(5020, 4011, 3003, 1, 220.00),
(5021, 4011, 3002, 1, 250.00),
(5022, 4012, 3012, 1, 300.00),
(5023, 4012, 3027, 1, 150.00),
(5024, 4013, 3009, 1, 160.00),
(5025, 4013, 3007, 1, 140.00),
(5026, 4014, 3022, 1, 120.00),
(5027, 4014, 3024, 1, 100.00),
(5028, 4014, 3023, 1, 90.00),
(5029, 4015, 3014, 1, 150.00),
(5030, 4015, 3015, 1, 80.00);

#reviews
INSERT INTO Reviews (ReviewID, RestaurantID, CustomerID, ReviewDate, Rating, Comments) VALUES
(7001, 2001, 1001, '2025-06-02', 4.5, 'Loved the food, especially the butter chicken'),
(7002, 2004, 1003, '2025-06-04', 4.2, 'Pizza was good but delivery was slightly late'),
(7003, 2005, 1005, '2025-01-12', 3.8, 'Burger was tasty but fries were cold'),
(7004, 2008, 1002, '2025-06-07', 4.0, 'Dosa was crispy and fresh'),
(7005, 2003, 1006, '2025-02-07', 2.9, 'Noodles were too oily'),
(7006, 2010, 1009, '2025-06-11', 4.7, 'Amazing continental flavors'),
(7007, 2009, 1004, '2025-04-17', 3.5, 'Coffee was good, pastry was average'),
(7008, 2007, 1010, '2025-05-12', 4.8, 'Sushi was very fresh and delicious'),
(7009, 2006, 1001, '2025-06-19', 3.0, 'Good food but took too long to prepare'),
(7010, 2002, 1008, '2025-06-21', 4.3, 'Healthy food that tastes great'),
(7011, 2001, 1007, '2025-06-23', 4.1, 'Paneer was soft and well cooked'),
(7012, 2005, 1005, '2025-06-29', 2.5, 'Burger was soggy and not fresh');

SELECT * FROM Customers;
SELECT * FROM Restaurants;
SELECT * FROM MenuItems;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Reviews;

#PROBLEM STATEMENT SOLUTIONS
#1)--Customer Behavior & Engagement
#Q1.Identify customers who have placed the highest number of orders. What does this indicate about their loyalty or engagement?
SELECT Customers.CustomerID,
CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName,
COUNT(Orders.OrderID) AS TotalOrders
FROM Orders
JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID
GROUP BY 
Customers.CustomerID, CustomerName
ORDER BY 
TotalOrders DESC;

#Q2.Find customers who haven’t placed any orders in the last 3 months. How can the platform re-engage them?
#Order Date Range 
SELECT MIN(OrderDate), MAX(OrderDate) FROM Orders;
#MIN = 2025-01-10 (first order)
#MAX = 2025-06-30 (last order)
#Therefore, the last 3 months range from 30 March 2025 to 30 June 2025
SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE OrderDate BETWEEN '2025-03-30' AND '2025-06-30'
);

#Q3.Determine the average order value per customer. What does this reveal about spending habits?
SELECT 
    CustomerID,
    COUNT(*) AS TotalOrders,
    AVG(TotalAmount) AS AverageOrderValue
FROM Orders
GROUP BY CustomerID;


#2)--Restaurant Performance Analysis
#Q1.Identify the top 5 restaurants with the highest average ratings. What factors might contribute to their success?
SELECT 
 Restaurants.RestaurantID,
 Restaurants.RestaurantName,
AVG(Reviews.Rating) AS AverageRating
FROM Reviews
JOIN Restaurants
 ON Reviews.RestaurantID = Restaurants.RestaurantID
GROUP BY Restaurants.RestaurantID, Restaurants.RestaurantName
ORDER BY AverageRating DESC
LIMIT 5;

#Q2.Find restaurants with the lowest number of orders despite being active. What could be causing low performance?
SELECT 
    Restaurants.RestaurantID,
    Restaurants.RestaurantName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Restaurants
LEFT JOIN Orders
    ON Restaurants.RestaurantID = Orders.RestaurantID
GROUP BY Restaurants.RestaurantID, Restaurants.RestaurantName
ORDER BY TotalOrders ASC
LIMIT 2;

#Q3.Determine which cuisine types receive the most and least orders. How can marketing focus be adjusted accordingly?
SELECT 
    Restaurants.CuisineType,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Restaurants
JOIN Orders
    ON Restaurants.RestaurantID = Orders.RestaurantID
GROUP BY Restaurants.CuisineType
ORDER BY TotalOrders DESC;


#3)--Revenue & Business Metrics
#Q1.Calculate the total revenue generated in the last quarter. How does it compare to the previous one?
#Jan-March
SELECT SUM(TotalAmount) AS Q1_Revenue
FROM Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-03-31';
#Apr-Jun
SELECT SUM(TotalAmount) AS Q2_Revenue
FROM Orders
WHERE OrderDate BETWEEN '2025-04-01' AND '2025-06-30';

#Q2.Identify the top 3 most ordered menu items across all restaurants. Should these items be promoted further?
SELECT 
    MenuItems.ItemName,
    SUM(OrderDetails.Quantity) AS TotalOrdered
FROM OrderDetails
JOIN MenuItems 
    ON OrderDetails.MenuItemID = MenuItems.MenuItemID
GROUP BY MenuItems.ItemName
ORDER BY TotalOrdered DESC
LIMIT 3;

#Q3.Analyze the revenue contribution of each restaurant. Which ones are the most profitable?
SELECT 
    Restaurants.RestaurantID,
    Restaurants.RestaurantName,
    SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
JOIN Restaurants
    ON Orders.RestaurantID = Restaurants.RestaurantID
GROUP BY Restaurants.RestaurantID, Restaurants.RestaurantName
ORDER BY TotalRevenue DESC;


#4)--Operational Efficiency
#Q1.Determine the average number of items per order. How can order processing be optimized?
SELECT 
    AVG(ItemsPerOrder) AS AverageItemsPerOrder
FROM (
    SELECT 
        OrderDetails.OrderID,
        SUM(OrderDetails.Quantity) AS ItemsPerOrder
    FROM OrderDetails
    GROUP BY OrderDetails.OrderID
) AS OrderCounts;

#Q2.Identify orders where the total amount was less than a certain threshold (e.g., ₹200). Should minimum order charges be introduced?
SELECT 
    Orders.OrderID,
    Orders.CustomerID,
    Orders.RestaurantID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
WHERE Orders.TotalAmount < 200;

#Q3.Find restaurants that receive the most reviews but have average ratings below 3.0. What corrective actions could be taken?
SELECT 
    Restaurants.RestaurantID,
    Restaurants.RestaurantName,
    COUNT(Reviews.ReviewID) AS TotalReviews,
    AVG(Reviews.Rating) AS AverageRating
FROM Reviews
JOIN Restaurants
    ON Reviews.RestaurantID = Restaurants.RestaurantID
GROUP BY Restaurants.RestaurantID, Restaurants.RestaurantName
HAVING AVG(Reviews.Rating) < 3.0
ORDER BY TotalReviews DESC;


#5)--Customer Satisfaction & Feedback
#Q1.Analyze the distribution of customer ratings. How many reviews are 4 stars or above?
SELECT 
    COUNT(Reviews.ReviewID) AS ReviewsAbove4
FROM Reviews
WHERE Reviews.Rating >= 4.0;

#Q2.Identify customers who frequently leave low ratings. Could this indicate dissatisfaction or unrealistic expectations?
SELECT 
Customers.CustomerID,
Customers.FirstName,
Customers.LastName,
COUNT(Reviews.ReviewID) AS LowRatingCount
FROM Reviews
JOIN Customers
ON Reviews.CustomerID = Customers.CustomerID
WHERE Reviews.Rating < 3.0
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY LowRatingCount DESC;

#Q3.Find patterns in review comments to detect recurring issues (e.g., “cold food,” “late delivery”).
SELECT 
    Reviews.ReviewID,
    Reviews.CustomerID,
    Reviews.RestaurantID,
    Reviews.Rating,
    Reviews.Comments,
    
    CASE 
        WHEN Comments LIKE '%late%' OR Comments LIKE '%long%' 
            THEN 'Delivery Issue'
        WHEN Comments LIKE '%cold%' OR Comments LIKE '%not fresh%' 
            THEN 'Food Temperature Issue'
        WHEN Comments LIKE '%oily%' OR Comments LIKE '%soggy%' 
            THEN 'Food Quality Issue'
        WHEN Comments LIKE '%average%' 
            THEN 'Average Quality'
        ELSE 'Positive / No Issue'
    END AS IssueType
FROM Reviews;



#6)--Comparative & Predictive Analysis
#Q1.Compare total revenue from vegetarian vs non-vegetarian menu items. Should the company invest more in one category?
SELECT 
    CASE 
        WHEN MenuItems.ItemName LIKE '%Veg%' 
          OR MenuItems.ItemName LIKE '%Paneer%' 
          OR MenuItems.ItemName LIKE '%Dosa%' 
          OR MenuItems.ItemName LIKE '%Salad%' 
          OR MenuItems.ItemName LIKE '%Sandwich%' 
            THEN 'Vegetarian'
        ELSE 'Non-Vegetarian'
    END AS Category,

    SUM(OrderDetails.Quantity * OrderDetails.ItemPrice) AS TotalRevenue

FROM OrderDetails
JOIN MenuItems 
    ON OrderDetails.MenuItemID = MenuItems.MenuItemID

GROUP BY Category;

#Q2.Predict which customers are likely to become inactive based on order frequency and last order date.
SELECT 
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    COUNT(Orders.OrderID) AS TotalOrders,
    MAX(Orders.OrderDate) AS LastOrderDate
FROM Customers
LEFT JOIN Orders 
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY 
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName
HAVING 
    TotalOrders <= 1
    OR LastOrderDate < '2025-05-01'
ORDER BY LastOrderDate;

#Q3.
SELECT 
CASE
 WHEN DAYOFWEEK(OrderDate) IN (1, 7) THEN 'Weekend'
 ELSE 'Weekday'
 END AS DayType,
COUNT(*) AS TotalOrders
FROM Orders
GROUP BY DayType;