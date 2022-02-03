Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that 
will help you profile and understand the data just like a data scientist would. 
For this first part of the assignment, you will be assessed both on the correctness of your 
findings, as well as the code you used to arrive at your answer. 
You will be graded on how easy your code is to read, so remember to use proper formatting and 
comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and 
analysis of the data for a particular research question you want to answer. 
You will be required to prepare the dataset for the analysis you choose to do. As with the 
first part, you will be graded, in part, on how easy your code is to read, 
so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are 
being asked, and your job will be to transfer your answers and SQL coding 
where indicated into this worksheet so that your peers can review your work. You should be able 
to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) 
to copy and paste your answers. If you are going to use Word or some other page layout application, 
just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table =  10000
iii. Category table =  10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. 
If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562          
iii. Category = 2643      
iv. Attribute = 1115     
v. Review = 8090          #fk=business_id
vi. Checkin = 493         
vii. Photo =  6493        #only fk used 
viii. Tip =  537          #fk=user_id
ix. User =   10000
x. Friend =  11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: "no"
	
	
	SQL code used to arrive at answer:
	
SELECT count(*)
FROM user
WHERE id IS NULL
	OR name IS NULL
	OR review_count IS NULL
	OR yelping_since IS NULL
	OR useful IS NULL
	OR funny IS NULL
	OR cool IS NULL
	OR fans IS NULL
	OR average_stars IS NULL
	OR compliment_hot IS NULL
	OR compliment_more IS NULL
	OR compliment_profile IS NULL
	OR compliment_cute IS NULL
	OR compliment_list IS NULL
	OR compliment_note IS NULL
	OR compliment_plain IS NULL
	OR compliment_cool IS NULL
	OR compliment_funny IS NULL
	OR compliment_writer IS NULL
	OR compliment_photos IS NULL
	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and 
average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082 
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0		max: 5.0		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1	 	max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:
+-----------------+---------------+
| city            | Total reviews |
+-----------------+---------------+
| Las Vegas       |         82854 |
| Phoenix         |         34503 |
| Toronto         |         24113 |
| Scottsdale      |         20614 |
| Charlotte       |         12523 |
| Henderson       |         10871 |
| Tempe           |         10504 |
| Pittsburgh      |          9798 |
| Montréal        |          9448 |
| Chandler        |          8112 |
| Mesa            |          6875 |
| Gilbert         |          6380 |
| Cleveland       |          5593 |
| Madison         |          5265 |
| Glendale        |          4406 |
| Mississauga     |          3814 |
| Edinburgh       |          2792 |
| Peoria          |          2624 |
| North Las Vegas |          2438 |
| Markham         |          2352 |
| Champaign       |          2029 |
| Stuttgart       |          1849 |
| Surprise        |          1520 |
| Lakewood        |          1465 |
| Goodyear        |          1155 |
+-----------------+---------------+
(Output limit exceeded, 25 of 362 total rows shown)

	SQL code used to arrive at answer:
	
SELECT city
	,sum(review_count) AS "Total reviews"
FROM business
GROUP BY city
ORDER BY "Total reviews" DESC                                   
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT stars
	,sum(review_count) AS "Count"
FROM business
WHERE city = 'Avon'
GROUP BY stars
ORDER BY stars
	,"Count"

Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+-------+-------+
| stars | Count |
+-------+-------+
|   1.5 |    10 |
|   2.5 |     6 |
|   3.5 |    88 |
|   4.0 |    21 |
|   4.5 |    31 |
|   5.0 |     3 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT stars
	,sum(review_count) AS "Count"
FROM business
WHERE city = 'Beachwood'
GROUP BY stars
ORDER BY stars
	,"Count"

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
+-------+-------+
| stars | Count |
+-------+-------+
|   2.0 |     8 |
|   2.5 |     3 |
|   3.0 |    11 |
|   3.5 |     6 |
|   4.0 |    69 |
|   4.5 |    17 |
|   5.0 |    23 |
+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

SELECT id
	,name
	,review_count
FROM user
ORDER BY review_count DESC limit 3
	
		
	Copy and Paste the Result Below:
	
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+		


8. Does posing more reviews correlate with more fans?
    
	Yes, it does from the output below it however varies depending
	how long the individual has been yelping. The longer they have been 
	yelping the more the fans. However no direct correlation can be made 
	from just reviews and fans. the is a typical example of where correlation
	does not imply causality
    	
	Please explain your findings and interpretation of the results:
	
SELECT id
	,name
	,review_count
	,fans
	,yelping_since
FROM user
ORDER BY fans DESC

    Output :
	
+------------------------+-----------+--------------+------+---------------------+
| id                     | name      | review_count | fans | yelping_since       |
+------------------------+-----------+--------------+------+---------------------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 | 2007-07-19 00:00:00 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 | 2012-11-27 00:00:00 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 | 2012-12-16 00:00:00 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 | 2009-07-08 00:00:00 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 | 2009-10-05 00:00:00 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 | 2009-02-05 00:00:00 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 | 2015-02-19 00:00:00 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 | 2012-04-05 00:00:00 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 | 2007-08-14 00:00:00 |
| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 | 2009-05-31 00:00:00 |
| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 | 2008-10-28 00:00:00 |
| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 | 2007-08-29 00:00:00 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 | 2006-03-28 00:00:00 |
| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 | 2010-10-01 00:00:00 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 | 2006-07-19 00:00:00 |
| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 | 2007-03-10 00:00:00 |
| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 | 2005-08-07 00:00:00 |
| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 | 2012-10-08 00:00:00 |
| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 | 2009-01-12 00:00:00 |
| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 | 2008-02-16 00:00:00 |
| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 | 2013-07-08 00:00:00 |
| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 | 2009-09-07 00:00:00 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 | 2008-01-03 00:00:00 |
| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 | 2009-04-30 00:00:00 |
+------------------------+-----------+--------------+------+---------------------+
(Output limit exceeded, 25 of 10000 total rows shown)

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: More from "love" with 1780 than "hate" with 232

	
	SQL code used to arrive at answer:
	
SELECT count(TEXT) AS loveCnt                                     SELECT count(TEXT) AS hateCnt                                                                                                                                                                         
FROM review                                                       FROM review
WHERE TEXT LIKE '%love%'                                          WHERE TEXT LIKE '%hate%'

+---------+                                                       +---------+
| loveCnt |                                                       | hateCnt |
+---------+                                                       +---------+
|    1780 |                                                       |     232 |
+---------+                                                       +---------+
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
SELECT id
	,name
	,fans
FROM user
ORDER BY fans DESC limit 10	
	
	Copy and Paste the Result Below:

+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall 
star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. 
Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

   2-3 group have more hours open than the 4-5 star group however their review count is way more less.

ii. Do the two groups you chose to analyze have a different number of reviews?
    
    Yes, they have a different number of review counts with 2-3 stars group having way more lesser review than 
    the 4-5 group .They appear to be of a fix number 52 counts for the 2-3 stars group and 431 count for the 
    4-5 group .
    
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
    
	Yes all businesses in the same postal code.     Also, noticed they are only two business for the city and category 
	of choice which are Starbucks(2-3 stars)
    and Bootleggers Modern American Smokehouse(4-5 stars)
SQL code used for analysis:

SELECT b.name
	,h.hours
	,b.review_count
	,b.postal_code
	,CASE 
		WHEN hours LIKE "%monday%"
			THEN 1
		WHEN hours LIKE "%tuesday%"
			THEN 2
		WHEN hours LIKE "%wednesday%"
			THEN 3
		WHEN hours LIKE "%thursday%"
			THEN 4
		WHEN hours LIKE "%friday%"
			THEN 5
		WHEN hours LIKE "%saturday%"
			THEN 6
		WHEN hours LIKE "%sunday%"
			THEN 7
		END AS ordering
	,CASE 
		WHEN b.stars BETWEEN 2
				AND 3
			THEN '2-3 stars'
		WHEN b.stars BETWEEN 4
				AND 5
			THEN '4-5 stars'
		END AS star_rating
FROM business b
INNER JOIN hours h ON b.id = h.business_id
INNER JOIN category c ON c.business_id = b.id
WHERE (
		b.city == 'Phoenix'
		AND c.category LIKE 'Food'
		)
	AND (
		b.stars BETWEEN 2
			AND 3
		OR b.stars BETWEEN 4
			AND 5
		)
GROUP BY stars
	,ordering
ORDER BY ordering
	,star_rating ASC
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you 
find between the ones that are still open and the ones that are closed? List at least two differences and 
the SQL code you used to arrive at your answer.
		
i. Difference 1:
    
    More stores are open=8480 than they are closed=1520. On average more review counts=31.75% for stores 
	that are open than for closed=23.19.	
         
ii. Difference 2:
    
    Ideally, Not much of ratings difference between stores that are open nor close	on averag for closed 
	stores 3.52 and open 3.67 which makes sense that stores that closes on some few days may not really 
	impact much on ratings.
         
         
SQL code used for analysis:

SELECT count(name)
	,avg(review_count)
	,avg(stars)
	,is_open
	,CASE is_open
		WHEN 1
			THEN 'open'
		ELSE 'close'
		END store_state
FROM business
GROUP BY store_state	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on 
the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering 
businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, 
predicting the number of fans a user will have, and so on. These are just a few examples to get you started,
so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, 
to all of the following:
	
i. Indicate the type of analysis you chose to do:
    
    Predicting star ratings 	
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
    
    To help business flourish it is important that a high star rating can be an important factor to attracting
    and improving their clientele. So if we could understand the various categories like useful, funny, cool,
    business name,address , city, state. The reason for this data is to get  insight of our clientele and the kind of 
	services that makes them feel good. 
                  
iii. Output of your finished dataset:
     
+----------------------------------------------------+------------+-------+---------------------------------------------+-------+--------------+---------------------+------------------+------------+
| name                                               | city       | state | address                                     | stars | review_count | useful_contribution | entertaining_env | cool_env   |
+----------------------------------------------------+------------+-------+---------------------------------------------+-------+--------------+---------------------+------------------+------------+
| Delmonico Steakhouse                               | Las Vegas  | NV    | 3355 Las Vegas Blvd S                       |     5 |         1389 | quite useful        | quite funny      | quite cool |
| Delmonico Steakhouse                               | Las Vegas  | NV    | 3355 Las Vegas Blvd S                       |     3 |         1389 | quite useful        | quite funny      | quite cool |
| Delmonico Steakhouse                               | Las Vegas  | NV    | 3355 Las Vegas Blvd S                       |     4 |         1389 | None                | funny            | None       |
| Delmonico Steakhouse                               | Las Vegas  | NV    | 3355 Las Vegas Blvd S                       |     5 |         1389 | quite useful        | quite funny      | quite cool |
| Pio Pio                                            | Charlotte  | NC    | 1408 E Blvd                                 |     3 |          299 | quite useful        | quite funny      | quite cool |
| Pio Pio                                            | Charlotte  | NC    | 1408 E Blvd                                 |     3 |          299 | quite useful        | quite funny      | quite cool |
| Matt's Big Breakfast                               | Phoenix    | AZ    | 801 N 1st St                                |     5 |          700 | quite useful        | quite funny      | quite cool |
| The Fry                                            | North York | ON    | 4864 Yonge Street                           |     1 |           76 | quite useful        | quite funny      | quite cool |
| Dubliner                                           | Phoenix    | AZ    | 3841 E Thunderbird Rd, Ste 111              |     1 |          112 | quite useful        | quite funny      | quite cool |
| Dubliner                                           | Phoenix    | AZ    | 3841 E Thunderbird Rd, Ste 111              |     3 |          112 | quite useful        | quite funny      | quite cool |
| Matt's Big Breakfast                               | Phoenix    | AZ    | 3800 E Sky Harbor Blvd, Terminal 4, Gate B5 |     2 |          279 | quite useful        | quite funny      | quite cool |
| Romados                                            | Montréal   | QC    | 115 Rue Rachel E                            |     3 |          398 | quite useful        | quite funny      | quite cool |
| U.S. Bank                                          | Scottsdale | AZ    | 9719 N Hayden Rd                            |     3 |            8 | quite useful        | quite funny      | quite cool |
| Alamo Rent A Car                                   | Mesa       | AZ    | 6033 S Sossaman Rd                          |     5 |           18 | quite useful        | quite funny      | quite cool |
| Now and Zen Massage Therapy                        | Las Vegas  | NV    | 7455 W Washington Ave, Ste 210              |     5 |           32 | quite useful        | quite funny      | quite cool |
| I'm Board! Games & Family Fun                      | Middleton  | WI    | 6917 University Ave                         |     5 |           19 | quite useful        | quite funny      | quite cool |
| Michael Mina                                       | Las Vegas  | NV    | 3600 S Las Vegas Blvd                       |     5 |          574 | quite useful        | quite funny      | quite cool |
| Michael Mina                                       | Las Vegas  | NV    | 3600 S Las Vegas Blvd                       |     4 |          574 | quite useful        | quite funny      | quite cool |
| Ed's Tavern                                        | Charlotte  | NC    | 2200 Park Rd                                |     5 |           95 | quite useful        | quite funny      | quite cool |
| Po' Boys Restaurant                                | Urbana     | IL    | 202 E University Ave, Ste C                 |     5 |           54 | quite useful        | quite funny      | quite cool |
| Torontoism - Sotheby's International Realty Canada | Toronto    | ON    | 1867 Yonge Street, Suite 100                |     5 |            7 | quite useful        | quite funny      | quite cool |
| Joyride Taco House                                 | Gilbert    | AZ    | 302 N Gilbert Rd                            |     4 |          902 | quite useful        | quite funny      | quite cool |
| Industry Public House                              | Pittsburgh | PA    | 4305 Butler St                              |     2 |          436 | quite useful        | quite funny      | quite cool |
| Industry Public House                              | Pittsburgh | PA    | 4305 Butler St                              |     4 |          436 | quite useful        | quite funny      | quite cool |
| Pizza Taglio                                       | Pittsburgh | PA    | 126 S Highland Ave                          |     5 |           93 | quite useful        | quite funny      | quite cool |
+----------------------------------------------------+------------+-------+---------------------------------------------+-------+--------------+---------------------+------------------+------------+ 	 
         
iv. Provide the SQL code you used to create your final dataset:

SELECT b.name
	,b.city
	,b.STATE
	,b.address
	,r.stars
	,b.review_count
	,CASE 
		WHEN r.useful BETWEEN 0
				AND 3
			THEN 'quite useful'
		WHEN r.useful BETWEEN 3
				AND 5
			THEN 'useful'
		END AS useful_contribution
	,CASE 
		WHEN r.funny BETWEEN 0
				AND 3
			THEN 'quite funny'
		WHEN r.funny BETWEEN 3
				AND 5
			THEN 'funny'
		END AS entertaining_env
	,CASE 
		WHEN r.cool BETWEEN 0
				AND 3
			THEN 'quite cool'
		WHEN r.cool BETWEEN 3
				AND 5
			THEN 'cool'
		END AS cool_env
FROM business b
JOIN review r ON b.id = r.business_id