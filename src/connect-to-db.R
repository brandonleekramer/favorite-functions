
# connect to postgresql to get our data

conn <- dbConnect(drv = PostgreSQL(), 
                  dbname = "sdad", 
                  host = "10.250.124.195", 
                  port = 5432, 
                  user = Sys.getenv("db_userid"), 
                  password = Sys.getenv("db_pwd"))

# query the users_gh data (table of all github users) 
db_data <- dbGetQuery(conn, "SELECT * FROM schema_name.table_name")

# disconnect from postgresql database 
dbDisconnect(conn)