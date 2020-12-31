

# how to get pandas data from postgree sql using python 
import psycopg2 as pg
import pandas.io.sql as psql
import pandas as pd
connection = pg.connect(host = 'postgis1', database = 'sdad', 
                        user = 'login', password = 'pwd')

postgreSQL_select_Query = '''
SELECT *  
FROM schema_name.table_name 
LIMIT 100
'''

df = pd.read_sql_query(postgreSQL_select_Query, con=connection)
df 
