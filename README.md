**
Netflix Movies and TV Shows Data Analysis using SQL:**
Project Overview
This project involves a comprehensive analysis of Netflix's library of movies and TV shows using PostgreSQL. The goal is to extract actionable insights from the dataset, such as content distribution, popular genres, prolific directors, and year-over-year trends.
Objectives
Data Cleaning: 
Handle missing values in the director and casts columns and format date fields.
Content Analysis:
Compare the amount of Movies vs. TV Shows available.
Regional Insights:
Identify the top countries producing content for Netflix.
Advanced Filtering: 
Categorize content based on specific keywords (e.g., "violence") and analyze long-running series.
Dataset:
The dataset used for this project is the widely available Netflix Movies and TV Shows CSV (often sourced from Kaggle). It contains information about nearly 9,000 titles, including:
show_id, type, title, director, casts, country, date_added, release_year, rating, duration, listed_in, description.
Key SQL Queries & Analysis
This project covers a variety of SQL techniques:
Aggregations: Using COUNT, AVG, and GROUP BY to summarize data.
String Manipulation: Using SPLIT_PART, TRIM, and UNNEST to handle comma-separated values in casts and listed_in.
Window Functions: Using RANK() to find the most common ratings.
Logic Statements: Utilizing CASE statements to categorize content based on description keywords.
Date Formatting: Converting string dates into DATE objects for time-series analysis.
