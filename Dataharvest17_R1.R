###############
## R_CLASS_I ##
###############

#Welcome to R I!

#This is the first in a series of three classes on R.
#In the first class, R I, we'll get familiar with RStudio and carry out some basic analysis.

#In this class we'll look at:
#1. What is R & what it can be used for?
#2. Importing data
#3. Examining the data
#4. Basic data analysis

##############################################
##1. What is R and what can it be used for? ##
##############################################

#R is a programming language and open-source statistical programming tool 
#It can be used for data analysis, visualising data and developing software
#We're going to use RStudio where you can see your data and commands in 4 panels
#The four panels are the console, where you execute commands; 
#A history panel; a workspace for display and a file/plot space

#There are many reasons why R has become more popular in recent years
#Some of the reasons are that it can be used for analysis and visuals
#It’s powerful, free, has a large community of users and packages

#R is a program and language
#RStudio is the user interface or GUI that we’ll be using

#RStudio is useful as you can see your data and commands in 4 panels
#The four panels are: 

#1.The console is in the bottom left corner
#This is where you execute commands
#Execute is just a fancy word for run
#Let’s try to run a command
#You can use the console like a calculator

5+5

5*10

#Now you can try typing in a command…

#2.The source editor
#This is directly above the console, in the top left corner
#Here you can write and edit scripts
#You can also run scripts from this area
#It also acts as a dataviewer
#When you open a dataset, it will appear here
#That way you can view and inspect datasets that are loaded into the R environment

#3.The workspace 
#In the top right corner is the workspace 
#Here you can view objects in their global environment
#This means viewing what else is loaded onto the directory the scripts are being run from
#You can also use the top right corner pane to search your command history
#This allows you to see the scripts and commands you have used in context
#It can be useful when you want to reuse parts of a script

#What does the history pane show you?

#4.File and plot space 
#This is in the lower right pane 
#Here you can view the packages you have installed, plots that you make and R help
#What can you see is loaded into the Studio environment under the “File” tab?

#You can get different views by toggling between different screens
#Let’s look at the help command for View
#Type this into the console

??View

######################
##2. Importing data ##
######################

#In order to work in RStudio, we’re going to load in some data

#There is some data already in our project, see the file panel
#What is it called?

#The data named DE_EDHIW and DE_PILW is from a group called the Luxembourg Income Study
#Let's read one of the csv files into R
#To read in the data we’ll type…
read.csv("DE_EDHIW.csv") 

#What can you see?

#Now in this case we want to give the dataset a name
#Or assign the csv a name

disposableincome <- read.csv("DE_EDHIW.csv")

#In R the default when a csv is being read in by R is to treat the first row as a header row

#Let’s open our data and take a look
#The command to see the data in a tabulated format is View
View(disposableincome)

#What does the data look like?

#The Guardian published a series on intergenerational inequality using this data
#In order to run the project, we needed to look at changes in income by age group over time
#The data is equivalised disposable income data for German household by the age

#What kinds of things might you want to find from this data?
#What are the top lines you would want to find from the data? 

######################
##3. Examining data ##
######################

#Let's look at some of the dimensions of the data
#How many rows and columns does the data have?
#We use the dim function and call the dataset
dim(disposableincome)

#This is the process for most commands, state the function and the dataset

#What do the first 6 rows of data look like?
head(disposableincome)

#What do the last 6 rows of data look like?
tail(disposableincome)

#What are the column names?
names(disposableincome)

#How many rows are in the dataset?
nrow(disposableincome)

#How many columns are in the dataset?
ncol(disposableincome)

###########################
##4. Basic data analysis ##
###########################

#In order to do some analysis in R we'll need to install a package for analysis

#What is a package?
#Packages allow you to carry out specific functions in R
#They're free and easy to install
#To explore all the packages available in your library
library()

#Some of the best packages for data analysis are the following dplyr and tidyr let's install them now

#dplyr
install.packages("dplyr")

#The package also needs to be loaded from the library
library("dplyr")

#tidyr
install.packages("tidyr")
library("tidyr")

#Note you need to call the package using "", i.e. "dplyr"
#This is one of R's quirks
#Let’s look at where the package is installed

#Now let's sort and filter the data
#Let's sort the data, from high to low
#The function here is arrange
arrange(disposableincome,EDHIW)

#Let’s talk through the function
#What is happening in this function?

#As you can see the sort prints the results to the console
#But let's take a look in the table format...
View(arrange(disposableincome,EDHIW))
#This is an example of nesting functions

#Let's mix it up and sort in the other direction
View(arrange(disposableincome,desc(EDHIW)))
#What could I do if I don't want the data printed to the console or in a view?

#Let's look at filtering
#What if I don't want to see all the age groups?
#Let's say I only want to see people 80 years and over
#We can subset the data using grep
#grep searches for a string of matching characters
disposableincome[grep("80 years and over", disposableincome$Age), ]
#What's happening in the above command...

#Now pull the subset for another age group...

#In the coming class we'll continue to analyse this data and look at statistical analysis in RStudio

###################
## Caelainn Barr ##
## The Guardian  ##
## @caelainnbarr ##
###################