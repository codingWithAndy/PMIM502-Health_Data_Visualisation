#STEP 1. INSTALL THE PACKAGES
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
#######################################################################################################################

#INFORMATION ABOUT PACKAGE:
  #https://cran.r-project.org/web/packages/gapminder/index.html

#######################################################################################################################


#STEP 2. CREATE COPY OF THE GAP MINDER DATASET
gapminder_data<-gapminder

#NOW VIEW THIS DATASET
View(gapminder_data)

#HOW MANY OBSERVATIONS?
#HOW MANY VARIABLES?
#WHAT ARE THE DATA TYPES?

#COUNTRY:
#CONTINENT:
#YEAR:
#LIFEEXP:
#POP:
#GDPPERCAP:

#YOU CAN CHECK BY USING THIS FUNCTION...
str(gapminder_data)

levels(gapminder_data$continent)

glimpse(gapminder_data)

#USEFUL THINGS TO CHECK..MAX OF Y AXIS AND X AXIS
summarise(gapminder_data,maxLE=max(lifeExp), maxGDPPC=max(gdpPercap), maxpop=max(pop))     
#82.603 113523.1 1318683096


######################################################################################################################

#STEP 3.START BY CREATING A SCATTER PLOT USING YEAR=2002

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"))+
  geom_point()


#OR

ggplot(gapminder_data %>% filter(year==2002),aes(x=gdpPercap
                                                        ,y=lifeExp
                                                        ,group=continent
                                                        ,colour=continent))+
  geom_point()

#ONLY TWO POINTS FOR OCEANIA?
gapminder_data %>% filter(year==2002 & continent=="Oceania")


#WHAT DO YOU NOTICE ABOUT THE X AXIS OF OUR CHART COMPARED WITH THE GAPMINDER CHART?

#############################################################################################################
#STEP 4. TRANSFORM THE XAXIS SO THAT ITS THE SAME AS GAPMINDER EXAMPLE AND SET Y AXIS TO START AT 0

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"))+
  geom_point()+
  scale_x_log10()+
  ylim(0,100)
  


###############################################################################################################
#STEP 5. NOW ADD IN POP SIZE

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15)+
  scale_x_log10()+
  ylim(0,100)

###############################################################################################################
##BACK TO LECTURE 
#INTERACTIVITY
###############################################################################################################

#make interactive chart using 2002 data
p<-plot_ly(gapminder_data %>% filter(year==2002)
           ,x=~gdpPercap
           ,y=~lifeExp
           ,color=~continent
           ,size=~pop
           ,type='scatter'
           ,mode = 'markers'
           ,text=~country #so that we can get country info when we hover over points
           ,hoverinfo="x+y+text") %>%
  layout(xaxis=list(title='GDP per Capita')
         ,yaxis=list(range=c(0,100),title='Life Expectancy'))
p

#make interactive chart using all data
#make circles larger
p<-plot_ly(gapminder_data 
           ,x=~gdpPercap
           ,y=~lifeExp
           ,frame=~year
           ,color=~continent
           ,size=~pop
           ,type='scatter'
           ,mode = 'markers'
           ,marker=list(symbol='circle',sizemode='area') #default is diameter
           ,sizes=c(min(gapminder_data$pop/1000000),max(gapminder_data$pop/1000000)) #set min area to min pop size divided by 1m
           ,text=~country
           ,hoverinfo="x+y+text") %>%
  layout(xaxis=list(title='GDP per Capita')
         ,yaxis=list(range=c(0,100)
                     ,title='Life Expectancy'))
p

#above but with log x axis
p<-plot_ly(gapminder_data 
           ,x=~gdpPercap
           ,y=~lifeExp
           ,frame=~year
           ,color=~continent
           ,size=~pop
           ,type='scatter'
           ,mode = 'markers'
           ,marker=list(symbol='circle',sizemode='area') #default is diameter
           ,sizes=c(min(gapminder_data$pop/1000000),max(gapminder_data$pop/1000000)) #set min area to min pop size divided by 1m
           ,text=~country
           ,hoverinfo="x+y+text") %>%
  layout(xaxis=list(title='GDP per Capita', type="log")
         ,yaxis=list(range=c(0,100)
                     ,title='Life Expectancy'))
p

###############################################################################################################
##BACK TO LECTURE
##ANNOTATION

###############################################################################################################
#STEP 6. ADD TITLE, SUBTITLE,

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15)+
  scale_x_log10()+
  ylim(0,100)+
  labs(title = "Gap Minder World 2002",
       subtitle = "Health versus Wealth",
       caption = "Source: Gap Minder")
###############################################################################################################
##BACK TO LAECTURE

##CHART ANNOTATION

###############################################################################################################
#STEP 7. AXIS LABELS HAVE ALREADY BEEN ASSIGNED BY R, ARE YOU HAPPY WITH THESE..IF NOT CHANGE THEM.
#ASSIGN AXIS TITLES
ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15)+
  scale_x_continuous(trans='log10',limits=c(1,120000))+ #log(1)=0
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "Gap Minder World 2002",
       subtitle = "Health versus Wealth",
       caption = "Source: Gap Minder", 
       x = "GDP per Capita", y = "Life Expectancy")


###############################################################################################################
#STEP 8. SORT OUT THE LEGEND
#if you want to turn off scientific notation then need to use 'comma':
ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent"
                                                        ,colour="continent"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15, labels=comma)+
  scale_x_continuous(trans='log10',limits=c(1,120000),labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "Gap Minder World 2002",
       subtitle = "Health versus Wealth",
       caption = "Source: Gap Minder", 
       x = "GDP per Capita", y = "Life Expectancy")+
  guides(colour = guide_legend(title="Continent",override.aes = list(size=5),order=1)
         ,size = guide_legend(title="Population",override.aes = list(colour="#808080"),order=2))


################################################################################################################
#BACK TO LECTURE
#TYPOGRAPHY
#RUN THIS DURING LECTURE...TAKES A WHILE TO LOAD
font_import()
loadfonts(device="win")
################################################################################################################
#STEP 9. CHANGE THE FONT
gapminder_data$continent2<-toupper(gapminder_data$continent)

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent2"
                                                        ,colour="continent2"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15, labels=comma)+
  scale_x_continuous(trans='log10',limits=c(1,120000),labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "GAP MINDER WORLD 2002",
       subtitle = "HEALTH VERSUS WEALTH",
       caption = "SOURCE: GAP MINDER", 
       x = "GDP PER CAPITA", y = "LIFE EXPECTANCY")+
  guides(colour = guide_legend(title="CONTINENT",override.aes = list(size=5),order=1)
         ,size = guide_legend(title="POPULATION",override.aes = list(colour="#A6A6A6"),order=2))+
  theme(plot.title=element_text(size=25, colour = "#A6A6A6", family="Gill Sans")
        ,plot.subtitle = element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,plot.caption = element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,axis.title.x=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,axis.title.y=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,axis.text.x=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,axis.text.y=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,legend.text=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
    ,legend.title=element_text(size=15, colour = "#A6A6A6", family="Gill Sans"))


###############################################################################################################
##BACK TO LECTURE
##COLOUR
###############################################################################################################
#STEP 10. CHANGE COLOURS TO MATCH GAPMINDER...NOTE WE HAVE ONE EXTRA CATEGORY (OCEANIA)

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent2"
                                                        ,colour="continent2"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15, labels=comma)+
  scale_x_continuous(trans='log10',limits=c(1,120000),labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "GAP MINDER WORLD 2002",
       subtitle = "HEALTH VERSUS WEALTH",
       caption = "SOURCE: GAP MINDER", 
       x = "GDP PER CAPITA", y = "LIFE EXPECTANCY")+
  guides(colour = guide_legend(title="CONTINENT",override.aes = list(size=5),order=1)
         ,size = guide_legend(title="POPULATION",override.aes = list(colour="#A6A6A6"),order=2))+
  theme(plot.title=element_text(size=25, colour = "#A6A6A6", family="Gill Sans")
        ,plot.subtitle = element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,plot.caption = element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.title.x=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.title.y=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.text.x=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.text.y=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,legend.text=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,legend.title=element_text(size=15, colour = "#A6A6A6", family="Gill Sans"))+
  scale_colour_manual(values=c("#00ffff","#33ff66","#ff3366","#ffff00","#ff9933"))

###########################################################################################################
##BACK TO LECTURE 
#COMPOSTITION
#########################################################################################################
##STEP 11. FINAL TOUCHES. MAKE IT LOOK ELEGANT!

ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent2"
                                                        ,colour="continent2"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=15, labels=comma)+
  scale_x_continuous(trans='log10',limits=c(1,120000),labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "GAP MINDER WORLD 2002",
       subtitle = "HEALTH VERSUS WEALTH",
       caption = "SOURCE: GAP MINDER", 
       x = "GDP PER CAPITA", y = "LIFE EXPECTANCY")+
  guides(colour = guide_legend(title="CONTINENT",override.aes = list(size=5),order=1)
         ,size = guide_legend(title="POPULATION",override.aes = list(colour="#A6A6A6"),order=2))+
  theme_classic()+
  theme(plot.title=element_text(size=25, colour = "#848484", family="Gill Sans")
        ,plot.subtitle = element_text(size=15, colour = "#848484", family="Gill Sans")
        ,plot.caption = element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.title.x=element_text(size=15, colour = "#848484", family="Gill Sans")
        ,axis.title.y=element_text(size=15, colour = "#848484", family="Gill Sans")
        ,axis.text.x=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,axis.text.y=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,legend.text=element_text(size=15, colour = "#A6A6A6", family="Gill Sans")
        ,legend.title=element_text(size=15, colour = "#848484", family="Gill Sans")
        ,axis.line=element_line(colour="#A6A6A6")
        ,axis.line.x=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.line.y=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.ticks.x = element_line(colour="#A6A6A6")
        ,axis.ticks.y = element_line(colour="#A6A6A6"))+
  scale_colour_manual(values=c("#00ffff","#33ff66","#ff3366","#ffff00","#ff9933"))
  


##############################################################################################################
##STEP12. SAVE AS PNG FILE
img_height<-1000
img_width<-2400

CairoPNG(file=paste0("gapmindertutorial.png"), sep='',width=img_width,height=img_height)
ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent2"
                                                        ,colour="continent2"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=50, labels=comma)+
  scale_x_continuous(trans='log10',limits=c(1,120000),labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "GAP MINDER WORLD 2002",
       subtitle = "HEALTH VERSUS WEALTH",
       caption = "SOURCE: GAP MINDER", 
       x = "GDP PER CAPITA", y = "LIFE EXPECTANCY")+
  guides(colour = guide_legend(title="CONTINENT",override.aes = list(size=20),order=1)
         ,size = guide_legend(title="POPULATION",override.aes = list(colour="#A6A6A6"),order=2))+
  theme_classic()+
  theme(plot.title=element_text(size=60, colour = "#848484", family="Gill Sans")
        ,plot.subtitle = element_text(size=50, colour = "#848484", family="Gill Sans")
        ,plot.caption = element_text(size=40, colour = "#A6A6A6", family="Gill Sans")
        ,axis.title.x=element_text(size=40, colour = "#848484", family="Gill Sans")
        ,axis.title.y=element_text(size=40, colour = "#848484", family="Gill Sans")
        ,axis.text.x=element_text(size=40, colour = "#A6A6A6", family="Gill Sans")
        ,axis.text.y=element_text(size=40, colour = "#A6A6A6", family="Gill Sans")
        ,legend.text=element_text(size=40, colour = "#A6A6A6", family="Gill Sans")
        ,legend.title=element_text(size=40, colour = "#848484", family="Gill Sans")
        ,axis.line=element_line(colour="#A6A6A6")
        ,axis.line.x=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.line.y=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.ticks.x = element_line(colour="#A6A6A6")
        ,axis.ticks.y = element_line(colour="#A6A6A6"))+
  scale_colour_manual(values=c("#00ffff","#33ff66","#ff3366","#ffff00","#ff9933"));
dev.off();



##OR TO KEEP X AXIS IN LINE WITH GAPMINDER EXAMPLE REMOVE THE START FROM 0 CONDITION
img_height<-1000
img_width<-2400

CairoPNG(file=paste0("C:/Users/angharad/ownCloud/courses conferences/Masters data vis course/gap minder/gapmindertutorial2.png"), sep='',width=img_width,height=img_height)
ggplot(gapminder_data %>% filter(year==2002),aes_string(x="gdpPercap"
                                                        ,y="lifeExp"
                                                        ,group="continent2"
                                                        ,colour="continent2"
                                                        ,size="pop"))+
  geom_point(alpha=0.8)+
  scale_size_area(max_size=50, labels=comma)+
  scale_x_continuous(trans='log10',labels=comma)+ #log(1)=0, and stop scientific notation
  scale_y_continuous(limits=c(0,100), breaks=seq(0,100,by=10))+
  labs(title = "GAP MINDER WORLD 2002",
       subtitle = "HEALTH VERSUS WEALTH",
       caption = "SOURCE: GAP MINDER", 
       x = "GDP PER CAPITA", y = "LIFE EXPECTANCY")+
  guides(colour = guide_legend(title="CONTINENT",override.aes = list(size=20),order=1)
         ,size = guide_legend(title="POPULATION",override.aes = list(colour="#A6A6A6"),order=2))+
  theme_classic()+
  theme(plot.title=element_text(size=60, colour = "#848484", family="Gill Sans MT Condensed")
        ,plot.subtitle = element_text(size=50, colour = "#848484", family="Gill Sans MT Condensed")
        ,plot.caption = element_text(size=40, colour = "#A6A6A6", family="Gill Sans MT Condensed")
        ,axis.title.x=element_text(size=40, colour = "#848484", family="Gill Sans MT Condensed")
        ,axis.title.y=element_text(size=40, colour = "#848484", family="Gill Sans MT Condensed")
        ,axis.text.x=element_text(size=40, colour = "#A6A6A6", family="Gill Sans MT Condensed")
        ,axis.text.y=element_text(size=40, colour = "#A6A6A6", family="Gill Sans MT Condensed")
        ,legend.text=element_text(size=40, colour = "#A6A6A6", family="Gill Sans MT Condensed")
        ,legend.title=element_text(size=40, colour = "#848484", family="Gill Sans MT Condensed")
        ,axis.line=element_line(colour="#A6A6A6")
        ,axis.line.x=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.line.y=element_line(colour="#A6A6A6",size=0.5,linetype="solid")
        ,axis.ticks.x = element_line(colour="#A6A6A6")
        ,axis.ticks.y = element_line(colour="#A6A6A6"))+
  scale_colour_manual(values=c("#00ffff","#33ff66","#ff3366","#ffff00","#ff9933"));
dev.off();






##NEXT IMPORT INTO POWERPOINT/PUBLISHER/INKSCAPE...AND CREATE A FINAL VISUALISATION WITH CAPTIONS TO
#HIGHLIGHT KEYFINDINGS ETC...

