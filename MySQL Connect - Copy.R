library(readr)
library(RCurl) 
library(DBI)
library(RMySQL)

# Connect to FTP API 
url = "url"
# Sign-in and get CSV file
text_data <- getURL(url, userpwd = "username:password", connecttimeout = 60)

# Read and assign CSV to data frame
df <- read.csv(text = text_data)

# Connect to local MySQL DB
db = dbConnect(MySQL(),
               user = 'user',
               password = 'password',
               host = 'localhost',
               dbname = 'trackman')

#Write data frame to pitching_data table in trackman DB
dbWriteTable(db, value = df, name = "pitching_data", row.names = FALSE, append = TRUE ) 
