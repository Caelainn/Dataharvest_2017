################
## R_CLASS_II ##
################

#In this class we'll get down to some data wrangling and learn how join and subset datasets in R

#In this class we'll look at:
#1. Joining data
#2. Data types
#3. Subsetting data
#4. Descriptive statistics
#5. Beyond descriptive statistics

####################
##1. Joining data ##
####################
#So we have a dataset we have been working with
#But what if we want to join another dataset to that data?

#Let's load the data set in and look at it
disposableincome_10 <- read.csv("DE_EDHIW_10.csv")

#Take a look at the data
View(disposableincome_10)

#The structure is exactly the same as the existing dataset
#The column headers match up so let's append the rows
#We'll use the bind_rows command, a function of dplyr

all_de <- bind_rows(disposableincome,disposableincome_10)
#This throws an error...

#In order to solve this let's talk about data types or the class of the variables

##################
##2. Data types ##
##################

#To look at the class you can use sapply
sapply(disposableincome, class)
sapply(disposableincome_10, class)

View(all_de)

#Let's look at the class of columns in the new file
sapply(all_de, class)
#What appears to be the problem?

#We can change the class back to it's original form as a factor...
all_de$Survey <- factor(all_de$Survey)

#So now we have the complete dataset with the addition of 2010 data in the correct form
#What if we wanted to take a smaller piece of the data for analysis?

#######################
## 3.Subsetting data ##
#######################

#There are a few ways to subset data
#One of the most straightforward is to name the data by location
#This can then be saved to a new dataframe
headsingle_allde <- all_de[ ,-(5:7)]

#Or we can name the data we want to keep
nochildren_allde <- all_de[, 1:4]

#Or we can name the column headers we want to keep
myvars <- c("Survey", "Age", "EDHIW.Single.Person")
single_de <- all_de[myvars]

#Let's look at some quick ways of finding headlines

#Let's look at the median and mean values of our new dataset
median(all_de$EDHIW)
mean(all_de$EDHIW)

#and take a look at the outliers
min(all_de$EDHIW)
max(all_de$EDHIW)

#What else might we want to consider when looking at the data for storylines?

##############################
##4. Descriptive statistics ##
##############################

#R comes with a number of built in packages for analysis
#This means you can run simple analysis on practice data sets

#To see how R gives you the ability to analyse your data simply and effectively we're going to use one it's built in data packages

#To see a full list of the packages
data()

#We're going to use airquality dataset for this class
#Open it up and take a look…
airquality

#Let’s also find out more about the dataset
?airquality

#If we were going to use this in a story about air pollution what might we want to know?
#The first step is to look at the descriptive statistics
#What are descriptive statistics?

#The summary function gives you basic descriptive statistics 
??summary

#Let’s look at the summary statistics for the Wind column in the airquality dataset
summary(airquality$Wind)

#Let’s look through the details of what is returned from this query…
#What might you want to use these for?

#Let’s run the summary analysis for the entire dataset
summary(airquality)

#There are some unusual results in there
#Any ideas why we are getting the summary stats for month and day?

#Looking at the results, what might you use from this to describe your data? 
#Let’s come up with a few top lines from the data for a story…

#####################################
##5. Beyond descriptive statistics ##
#####################################

#We’re going to look at data on smokers

#Let’s read in the data
#Note we’re reading in a table this time
lung <- read.table("LungCapData.txt", header=T)

#What’s different about this data to that of before?

#Let’s check out the data headers
names(lung)

#Of course we can also get the summary statistics for the entire table as well
summary(lung)
#What is different in this summary table to the first one we created?

#If we want to summarize a categorical variable, Smoke, this is done in a summary table
#It’s summarized by a frequency or proportion
table(lung$Smoke)

#So we know the number of smokers and non-smokers
#Let’s get the total number of people in the survey
length(lung$Smoke)

#Let’s use this to calculate the proportion of smokers and non-smokers
table(lung$Smoke)/725

#Or we can do it like this…
table(lung$Smoke)/length(lung$Smoke)
#Why does this also work?

#Let’s look at this based on the gender breakdown
table(lung$Smoke, lung$Gender)

#Let’s look at working with the numeric variables in the data set
#We’ll consider the appropriate number to use looking at the average…
mean(lung$LungCap)

#We can also trim the mean if we are concerned that there may be outliers
mean(lung$LungCap, trim=0.10)

#What can you tell by comparing the results of the mean and the trimmed mean?

#Let’s look at the median as well
median(lung$LungCap)

#Based on these results what number might you want to report in your story?

#Let’s take a further look at some of the further simple stats functions..

#To calculate the variance use var
var(lung$LungCap)
#When might we use this?

#Let’s get the standard deviation
sd(lung$LungCap)

#Let’s look at the correlation between lung capacity and age
cor(lung$LungCap, lung$Age)
#How can we interpret the result?

#What other variables appear to have a strong correlation?

#In the next class we will look at scrapping data from the web

###################
## Caelainn Barr ##
## The Guardian  ##
## @caelainnbarr ##
###################