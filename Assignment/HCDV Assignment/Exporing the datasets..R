mydata = read.csv("Road Safety Data - Casualties 2019.csv")

mydata

car_data = read.csv("Road Safety Data- Vehicles 2019.csv")

car_data
install.packages("readODS")
library(readODS)
ods_data = read.ods(file = '3275f503-b71f-47db-9b00-81a88c6202b0.ods', sheet = "GB - All accidents", formulaAsFormula = FALSE)

# ONS Sheets
# GB - All accidents
# Countries - All accidents
# Regions - All accidents
ods_data
