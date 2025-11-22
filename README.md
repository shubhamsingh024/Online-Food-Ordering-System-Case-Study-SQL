# Online-Food-Ordering-System-Case-Study-SQL
Online Food Ordering System – SQL Case Study

This repository contains a detailed relational database case study for an Online Food Ordering Platform similar to Zomato/Swiggy.
It includes the database schema, SQL statements, and analytical queries based on customer behavior, restaurant performance, and revenue analysis.

📌 Introduction

Online food ordering platforms connect customers with restaurants digitally, allowing them to browse menus, place orders, make payments, and leave reviews.

This case study focuses on data-driven insights, SQL querying, and database schema design.

🛠 Database Schema
1. Customers

CustomerID (PK)

FirstName

LastName

Email

Phone

RegistrationDate

2. Restaurants

RestaurantID (PK)

RestaurantName

Address

CuisineType

3. MenuItems

MenuItemID (PK)

RestaurantID (FK)

ItemName

Price

Description

4. Orders

OrderID (PK)

CustomerID (FK)

RestaurantID (FK)

OrderDate

TotalAmount

5. OrderDetails

OrderDetailID (PK)

OrderID (FK)

MenuItemID (FK)

Quantity

ItemPrice

6. Reviews

ReviewID (PK)

RestaurantID (FK)

CustomerID (FK)

ReviewDate

Rating

Comments

📂 Repository Contents
📁 online-food-ordering-system
│── README.md
│── Online_Food_Ordering_System.sql
│── Online_Food_Ordering_System_questions_and_info.docx
│── Online_Food_Ordering_System-Case Study_PPT

🎯 Objectives

The system aims to analyze:

Customer ordering patterns

Restaurant performance

Menu item popularity

Revenue trends

Customer satisfaction

Predictive & comparative business insights

📊 Analysis Categories & SQL Tasks
1. Customer Behavior

Most active customers

Customers inactive for last 3 months

Average order value per customer

2. Restaurant Performance

Top 5 restaurants by ratings

Restaurants with lowest orders

Best/worst performing cuisine types

3. Revenue Analysis

Total revenue in last quarter

Top 3 most ordered menu items

Restaurant-wise revenue breakdown

4. Operational Efficiency

Average items per order

Orders below ₹200

Restaurants with many reviews but low ratings (<3.0)

5. Customer Satisfaction

Rating distribution

Customers giving frequent low ratings

Text analysis on review comments

6. Comparative & Predictive Insights

Veg vs Non-Veg revenue

Predicting inactive customers

Weekday vs Weekend trends


🧠 Skills Learned

Normalizing database schemas

Writing advanced SQL queries

Understanding business KPIs

Real-world data analysis

Preparing a case study for portfolio/resume
