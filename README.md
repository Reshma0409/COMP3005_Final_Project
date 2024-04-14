# COMP3005_Final_Project
This is my Final Project on COMP 3005 - Database Management Systems at Carleton University

=========================================================

1. Queries in queries_database as well as queries.py are to be tested using dbexports.sql. I have used data from dbexports.sql to form my queries.

=========================================================

3. In project_database, we can see the loaded data by having statements at the end like : SELECT * FROM matches; or SELECT * FROM lineups; or SELECT * FROM competitions;

=========================================================

5. In queries.py, line 39, I used query_database_name = "dbexport"  instead of "query_database". Please consider replacing that file.

=========================================================

7. According to my understanding, I loaded the data set from JSON Files into the project_database successfully. Then I opened dbexports and I inserted given values into given tables using INSERT statements so that the tables will be created for testing. Later, I wrote queries based on the dbexports data and tested them in dbexports' query tool itself. That is the reason I request you to run the queries using dbexports instead of query_database. In query_database, I have gathered all the queries and wrote accordingly. But without the data (with data being in the dbexports), I am unable to run the query_database alone.

=========================================================

10. My json_loader includes the code for importing huge data from json files into postgre.
11. My query.py will work if a small change can be done - see point 3. The results are accurate.
12. My project_database contains table creation for data given in JSON files. It is able to load the data with the queries such as "SELECT * FROM MATCHES" or "SELECT * FROM COMPETITIONS" at the end of the CREATE TABLE statements.
13. My queries_database includes all the queries written in one place.

=========================================================
