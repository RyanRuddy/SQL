import pandas as pd
import pyodbc
import psycopg2

#Connect to SQL Server
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=;'
                      'Database=;'
                      'Trusted_Connection=;')


cursor = conn.cursor()
df = pd.read_sql_query(
'''SELECT
    COALESCE(b.Name, '(Blank)') AS BrandName,
    COALESCE(c.Name, '(Blank)') AS CategoryName,
    pp.ProductID AS ProductProductID,
    pp.Name AS ProductName,
    oi.ProductID as OrderItemProductID,
    SUM(oi.Quantity) AS TotalUnitsSold,
    SUM(oi.LineTotal) AS TotalSales
FROM BikeStores.Production.Product pp
LEFT JOIN BikeStores.Production.Brand b ON pp.BrandID = b.BrandID
LEFT JOIN BikeStores.Production.Category c ON pp.CategoryID = c.CategoryID
LEFT JOIN BikeStores.Sales.OrderItem oi ON pp.ProductID = oi.ProductID
WHERE 
    oi.ListPrice > 109.99
GROUP BY 
    b.Name,
    c.Name,
    pp.ProductID,
    pp.Name,
    oi.ProductID
ORDER BY 
    SUM(oi.LineTotal) DESC''', conn)
conn.close()
df

import psycopg2
conn = psycopg2.connect(
    user='',
    password='',
    host='',
    port='',
    database=''
)

cursor = conn.cursor()
table_query =( 
'''
CREATE TABLE IF NOT EXISTS Bike_Store_Sales 
(
id SERIAL PRIMARY KEY,
BrandName varchar(50) NOT NULL,
CategoryName varchar(50) NOT NULL,
ProductProductID INTEGER NOT NULL,
ProductName varchar (75) NOT NULL,
OrderItemProductID INTEGER NOT NULL,
TotalUnitsSold INTEGER NOT NULL,
TotalSales DECIMAL(10,2) NOT NULL
);
'''
)

cursor.execute(table_query)

for i in df.index:
    sql = "INSERT INTO Bike_Store_Sales(BrandName,CategoryName,ProductProductID,ProductName,OrderItemProductID,TotalUnitsSold,TotalSales) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (str(df['BrandName'][i]), str(df['CategoryName'][i]), int(df['ProductProductID'][i]), str(df['ProductName'][i]), int(df['OrderItemProductID'][i]), int(df['TotalUnitsSold'][i]), float(df['TotalSales'][i]))
    cursor.execute(sql, val)

conn.commit()

cursor.close()

conn.close()