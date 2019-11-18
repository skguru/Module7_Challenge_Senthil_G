# Module7_Challenge_Senthil_G


The objective is identify the list of potential mentors for the PH company based on the provided data.  The following is the summary of activities performed to get the objective:

-ERD is used to understand the relationships between the SQL Tables and corresponding tables were derived as necessary. 

-Right Join was used and retirement_with_title table was created that includes the employee number, first and last name, title, from_date, title and salary data.  

-Duplicates were identified and removed;  The frequency count of employee titles in descending order was created under the table title_count. 

-Ready for mentor table was also created considering the condition given.  One error was noted in the challenge -  ask was to have the hiring date between January 1, 1965 and December 31, 1965.  The raw data contains no data within the timeframe and logically this should have been birth date and so birth date was used as the condition. Moreover, the last statement under the background calls for birth date as one of the data set needed for that table. 

-The table ready_for_mentor was created that includes employee number, first and last name, title, birth_date, from_date and to_date. 


Following files support the above summary:

-challenge.sql 

-ERD_challenge.png

-CSV files were created using the tables identified above: 
  
    -Retirement_with_title.csv
    
    -title_count.csv
    
    -ready_for_mentor.csv
