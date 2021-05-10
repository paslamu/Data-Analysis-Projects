/* Connect to the database
Let us first load the SQL extension and establish a connection with the database */
    %load_ext sql
    
/* Enter the connection string for your Db2 on Cloud database instance below */
   %sql ibm_db_sa://rgg91846:t%5Ebtkng0wgq3rs8f@dashdb-txn-sbox-yp-dal09-08.services.dal.bluemix.net:50000/BLUDB 

/* 1. Rows in Crime table */
   %sql Select COUNT(*) FROM Crime

/* 2. Retrieve first 10 rows from Crime table */
   %sql SELECT * FROM Crime LIMIT 10

/* 3. How many crime involoves an arrest */
   %sql 
   SELECT 
     arrest, 
      COUNT(arrest)AS If_true 
   FROM
     Crime 
   WHERE arrest='TRUE' 

/* 4. Which unique types of crimes have been recorded at GAS STATION locations? */
    %sql SELECT DISTINCT(primary_type)FROM Crime WHERE location_description='GAS STATION'

/* 5. In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’ */
    %sql SELECT * FROM Census_data WHERE community_area_name LIKE 'B%'

/* 6. Which schools in Community Areas 10 to 15 are healthy school certified? */
    %%sql 
    SELECT
      name_of_school
    FROM 
      Schools 
    WHERE community_area_number between 10 and 15 and healthy_school_certified='Yes'

/* 7. What is the average school Safety Score? */
   %sql SELECT AVG(safety_score)as average FROM Schools
   
/* 8. List the top 5 Community Areas by average College Enrollment [number of students] */
   %%sql 
   SELECT
     community_area_name, 
       AVG(college_enrollment) as average_college 
   FROM 
     Schools 
   GROUP BY 
     community_area_name
   ORDER BY average_college 
     desc LIMIT 5
 
/* 9. Use a sub-query to determine which Community Area has the least value for school Safety Score? */
  %%sql 
  SELECT 
    community_area_name 
  FROM 
    Schools 
  WHERE safety_score =(select min(safety_score)from schools
  
/* 10. Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1 */
   %%sql
   SELECT
     c.per_Capita_Income 
   FROM 
     Census_data as c, Schools as s 
   WHERE c.community_area_number=s.community_area_number and s.safety_score= 1
