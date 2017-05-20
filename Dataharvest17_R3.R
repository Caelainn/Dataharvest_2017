#################
## R_CLASS_III ##
#################

#In R III we're going to look at some of R's simple tools that allow you to go deeper with your data analysis, digging and visualisation
#To begin we'll start by pulling data from the web
#Then we'll call data using APIs and structure the output

#In this class we'll look at:
#1. Scraping with RStudio
#2. Structuring the data 
#3. Cleaning the data 
#4. Making API calls
#5. Further Practice

#############################
##1. Scraping with RStudio ##
#############################

#At the start of the script we install and load the packages needed for the project
install.packages("rvest")
install.packages("stringr")
install.packages("tidyr")

#Rvest is used for scraping data from the web and includes commands html and html_node
#Stringr is useful for working with strings, including matching, subsetting and extracting data
#Tidyr is a common package and is used for reshaping data

#Once the packages have been installed, let's load them using the library command
library(rvest, stringr, tidyr)

#First assign the web address to url
url <- 'http://espn.go.com/nfl/superbowl/history/winners'

#Pass it to the command 'read_html'
#read_html is part of the rvest package and pulls the underlying html from a webpage
superbowl <- read_html(url)

############################
##2. Structuring the data ##
############################

#Now let's strucutre the data into a dataframe

#Next, we use the rvest functions html_nodes and html_table 
#We'll extract the HTML table and convert it to a data frame
superbowl_table <- html_nodes(superbowl, 'table')
sb <- html_table(superbowl_table)[[1]]
head(sb)

#What should we remove from the table?
sb <- sb[-(1:2), ]
head(sb)

#Now let's set new column names or variables
names(sb) <- c("number", "date", "site", "result")
head(sb)

#########################
##3. Cleaning the data ##
#########################

#We can also clean up the data here
#We'll replace Roman numerals with numeric values
sb$number <- 1:51

#We will also convert the date to a standard format
sb$date <- as.Date(sb$date, "%B. %d, %Y")
head(sb)

#The result column should be split so we can more easily work with the data
#We'll divide it into 4 new columns
#Let's start splitting by the comma delimiter
sb <- separate(sb, result, c('winner', 'loser'), sep=', ', remove=TRUE)
head(sb)

#Now we'll split out the scores from the winner and loser columns 
#We'll do this by substring pattern matches, which is based on regex
#Let's look at the table and figure what we want...

scorepattern <- " \\d+$"
sb$winnerScore <- as.numeric(str_extract(sb$winner, scorepattern))
sb$loserScore <- as.numeric(str_extract(sb$loser, scorepattern))
sb$winner <- gsub(scorepattern, "", sb$winner)
sb$loser <- gsub(scorepattern, "", sb$loser)
head(sb)

#Let's write the result out to a csv
write.csv(sb, 'superbowl.csv', row.names=F)

########################
##4. Making API calls ##
########################

#Install RCurl package to call API
install.packages('RCurl')
library('RCurl')

#Let's also install the XML package to allow us to parse XML
#The results of the API call will be in XML
install.packages('XML')
library('XML')

#Register for xml key with Zillow and assign it to a 'key'
key <- 'X1-ZWz19d402sfmrv_43hp8'

reply = getForm("http://www.zillow.com/webservice/GetRegionChildren.htm",
                'zws-id' = "X1-ZWz19d402sfmrv_43hp8",
                state = "fl",
                city = "jacksonville",
                childtype = "neighborhood")

zillowdoc = xmlTreeParse(reply, asText = TRUE, useInternal = TRUE)

#We now have the data parsed into a tree

#Find the value of the property from the doc
xmlValue(zillowdoc[["//amount"]])

#We now want to parse the Xmltree
#By parsing we'll disgard the useless data and keep the elements we need
#We'll then structure this into a dataframe

#Write result to XML file
saveXML(zillowdoc, file="jacksonvillezillow.xml")

#Read xml file into R
result <- xmlParse(file = "jacksonvillezillow.xml")

########################
##5. Further Practice ##
########################

#There are plenty of built in datasets to play with in R
#They can be really useful for practicing and building up confidence
#To find built in datasets in R try this...
data()

#If you’re into machine learning, there are some great exercises on Kaggle
#The Titanic machine learning exercise with R is one of my favourites
#https://www.youtube.com/watch?v=32o0DnuRjfg

#To find further help with R…

#RStudio has a range of great tipsheets
# www.rstudio.com/resources/cheatsheets/

#Check out r-bloggers for hints and tips

#The O'Reilly Cookbook is a helpful resource

#Hadley Wickham, Chief Scientist at RStudio, is a font of knowledge for all things R - find him on Twitter @hadleywickham

###################
## KEEP IN TOUCH ##
###################

#Find me on Twitter @caelainnbarr
#Or on email caelainn.barr@theguardian.com

###################
## Caelainn Barr ##
## The Guardian  ##
## @caelainnbarr ##
###################