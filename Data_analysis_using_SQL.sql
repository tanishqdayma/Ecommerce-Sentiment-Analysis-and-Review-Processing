# Task 1: The task is to fetch count of the rows in the given dataset.

select count(*) 
from ecommerce;

# Task 2: The task is to fetch unique brand names in the given dataset

select distinct brand 
from ecommerce;

# Task 3: Retrieve all records from the 'ecommerce' table where the brand is 'Amazon'.

select * 
from ecommerce 
where brand = 'Amazon';

# Task 4: Retrieve all records from the 'ecommerce' table where the product reviews contain the word 'good' in their text.

select * 
from ecommerce 
where reviews_text LIKE '%good%';

# Task 5: Provide a list of all products and their corresponding details from the 'ecommerce' table that belong to the 'Electronics' category

select * 
from ecommerce 
where categories LIKE '%Electronics%';

# Task 6: Retrieve all records from the 'ecommerce' table where the products are categorized under 'Electronics' as their primary category and the brand is 'Flipkart'.

select * 
from ecommerce
where brand = 'Flipkart' AND primaryCategories LIKE '%Electronics%';

# Task 7: Provide a summary of the number of positive and negative sentiments for each primary category in the 'ecommerce' table.

select primaryCategories,
   (select COUNT(*) FROM ecommerce e1 where e1.primaryCategories = e.primaryCategories AND sentiment = 'Positive') AS positive_count,
   (select COUNT(*) FROM ecommerce e2 where e2.primaryCategories = e.primaryCategories AND sentiment = 'Negative') AS negative_count
from ecommerce e
group by primaryCategories;

# Task 8: Retrieve all records from the 'ecommerce' table where the sentiment in the product reviews is classified as 'positive'.

select * 
from ecommerce 
where sentiment = 'Positive';

# Task 9: Provide a summary report for each brand in the 'ecommerce' table, including the total number of positive and negative sentiments in product reviews, the total number of reviews, and the percentage of positive and negative sentiments for each brand.

select brand,
SUM(Case when sentiment = 'positive' Then 1 Else 0 End) as positive_count,
SUM(Case when sentiment = 'negative' Then 1 Else 0 End) as negative_count,
count(*) as total_reviews,
round((SUM(Case when sentiment = 'positive' Then 1 Else 0 End) / count(*)) *100 ,2) as percentage_positive,
round((SUM(Case when sentiment = 'negative' Then 1 Else 0 End) / count(*)) *100 ,2) as percentage_negative
from ecommerce e
group by brand;


# Task 10: Retrieve a count of products for each primary category in the 'ecommerce' table

select primaryCategories, count(*)
from ecommerce
group by primaryCategories;


# Task 11: Retrieve all records from the 'ecommerce' table where the product name contains the word 'Tablet' as a substring

select *
from ecommerce
where name LIKE '%Tablet%';

# Task 12: Count the number of product reviews in the 'ecommerce' table where the text contains the word 'Alexa' as a substring.

select count(*)
from ecommerce
where reviews_text LIKE '%Alexa%';	

