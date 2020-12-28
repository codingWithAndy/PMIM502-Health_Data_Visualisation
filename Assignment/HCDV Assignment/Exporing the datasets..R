install.packages("gapminder")
library(gapminder)

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

install.packages("Cairo")
library(Cairo)

install.packages("plotly")
library(plotly)

install.packages("scales")
library(scales)

install.packages("extrafont")
library(extrafont)

mydata = read.csv("Road Safety Data - Casualties 2019.csv")

mydata

car_data = read.csv("Road Safety Data- Vehicles 2019.csv")

car_data
install.packages("readODS")
library(readODS)
library(ggplot2)
ods_data = read.ods(file = '3275f503-b71f-47db-9b00-81a88c6202b0.ods', sheet = "GB - All accidents", formulaAsFormula = FALSE)

# ONS Sheets
# GB - All accidents
# Countries - All accidents
# Regions - All accidents
ods_data

wales_data =  read.ods(file = 'Wales info.ods', sheet = 2, formulaAsFormula = FALSE)

wales_data

ggplot(wales_data %>% filter(Local_authority=="Conwy"),aes(x=Light_condition
                                                 ,y=All_accidents
                                                 ,colour=Light_condition))
