#connect to PostgreSQL sever
library(RPostgreSQL)
library(tidyverse)

# create connection
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  #dbname = "____",
  #user = "____",
  #password = "_______",
  #port = ****
)

# add data
piz <- data.frame(
  num = c(1,2,3),
  menu = c("Hawaiian","Seafood","Extra Cheese"),
  price = c(450,600,500)
)
app <- data.frame(
  num = 1:3,
  menu = c("French Fries" ,"Cheese Sticks", "Nuggets"),
  price = c(100,150,80)
)
bev <- data.frame(
  num = 1:3,
  menu = c("Water", "Coke", "Sprite"),
  price = c(10, 30, 20)
)

# db list tables
dbWriteTable(con, "menu_pizza", piz)
dbWriteTable(con, "menu_appetizer", app)
dbWriteTable(con, "menu_beverage", bev)
dbListTables(con)
#dbRemoveTable(con,"__")

# get data
dbGetQuery(con, "select * from menu_pizza")
dbGetQuery(con, "select * from menu_appetizer")
dbGetQuery(con, "select * from menu_beverage")
