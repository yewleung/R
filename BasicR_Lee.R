# text after a hashtag is not run as a comamnd. Hence use it for making notes and explanations
# or to give the script structure/overview/clarity
# R: www.r-project.org/
# preferred Rstudio GUI: www.rstudio.com/
# other useful R software: Tinn-R and R commander

# Online R sources for intro:
# https://cran.r-project.org/doc/manuals/R-intro.html
# https://www.datacamp.com/courses/free-introduction-to-r
# https://www.burns-stat.com/documents/tutorials/impatient-r/
# https://www.tutorialspoint.com/r/index.htm
# https://stackoverflow.com/questions/tagged/r

## other online resources
# http://www.cyclismo.org/tutorial/R/
# http://tryr.codeschool.com/
# https://www.r-bloggers.com/how-to-learn-r-2/
# https://stats.stackexchange.com/
# https://awesome-r.com/
# http://www.r-tutor.com/

## getting to know the R GUI
# R Console - this window processes the instructions (commands) and displays results
# Blue text are results
# Red text are commands given to R
# At the bottom, the red command prompt, ">" indicates R has completed its task (and awaits further instructions)
# if it is a "+", R is still waiting for the command to be completed (most of the time it's missing a closing bracket)
# press "Esc" if you get stuck to abort the current command

# R Editor - to open this window: File>New Script
# A text editor (like this!). Use it to write scripts (a set of instructions given to the R console)
# This script can be saved (File>Save) to be easily re-run later
# Remember to make lots of notes/heades/explanations with the hashtag

# R Graphics - a window to display plots and graphs


## Simple calculations with R
# Objective: Use R as a calculator
# Either highlight the text or right click the line, select 'Run line or selection' (ctrl + R)

20 + 3   # addition, check the answer in the console window
6-4      # subtraction
2*5      # multiplication
125/3.75 # division
1.5^2	   # raise 1.5 to the power of 2

### Go ahead and try some calculations, you can make complex lines too
18+6-(45/3)*100

# all these symbols are called OPERATORS
# Stick an operator inbetween two values to make a calculation
1:5      # sequence numbers 1 to 5

## Variable assignment operator
# Objective: give a value to a named object
# Both assignment operators "=" and "<-" can be used
# Personally I like "<-" better

a <- 3   # assign the value '3' to and object 'a'
a        # print object 'a', check the R console

# notice that when an assingment is made, only red text is processed in the console,
# when a command to R is made, the console returns/displays the results in blue

# the RHS is assigned to the LHS

a = 3
a = a + 4 #the 'old' a plus 4 becomes the 'new' a
a

# variables (objects) can also be assigned with words (characters)
b <- "Hello world!" # Notice the quotation marks needed for text values
b

# Generally, variables can be given any name freely
# They are case sensitive, and don't like spaces (use '.' or '_' instead)
# Some names are reserved, they cannot be used as a variable name (object)
?Reserved() # the questionmark opens up the help for a funciton

## Using Vectors
# A vector is the simplest data structure type in R
# R's manual definition: "a single entity consisting of a collection of things"
# i.e a collection of numbers form a numeric vector

c(1,2,3,4,5) # 'c' means combine
?c

# when we constructed this vector, we just used our first FUNCTION in R
# In programming language, a function is a piece of code that takes inputs and does something specific with them
# We told the c() function to do something to the entries inside the parentheses (brackets)
# Entries in () are referred to as ARGUMENTS

# now assign c(1,2,3,4,5) to an object 'd' (yeah, let's skip naming an object 'c')
### can you remember an operator to simplify this?
d <- c(1:5)
d

# congratulations! you've assigned an OBJECT using a FUNCTION on an ARGUMENT
# Object              = d
# Variable assignment = <-
# Function            = c()
# Argument            = 1:5

# Object <- Function(Argument)

## General methods
# Objective: use functions on an object
# Above, we created the object 'a', that should have a value of 7
# Many things can be done to it
# for example, we can ask what class it is
# (data can exsist as different class/types in R)

class(a) # numeric
### What class do you think "Hello world!" would have?
class(b) # remember what was assigned to 'b'
class(d)

## Functions for simple arithmetics
sum(d)
mean(d)	# average value
min(d)
max(d)
sd(d)		# standard deviation
var(d)	# variance
sqrt(d)	# square-root

# notice how the square-root function was applied to all 5 entries
### How would you square-root the sum of all entries in 'd'?
sqrt(sum(d))

## Plotting
x <- d
y <- rnorm(x) #generate pseudo-random normal vectors for the y-coordinate

plot (x,y)

# add more arguments
plot(x,y, main="Why vs Axe", xlab="5 values of d", ylab="why lable", type="b", col=2, pch=23)
# we added the main title, x and y lables, changed the type from point to line graph, the colour to orange and the symbols to diamonds
# for a list of what the numbers mean: https://www.statmethods.net/advgraphs/parameters.html

## Making a DATAFRAME
dataf <- data.frame(x,y) # make variables into columns
dataf
View(dataf)		# this function needs a capital letter, werid from the rest
df <- edit(dataf)	# select R Console, Edit > Data Editor > "dataf"
# edit it just like it was in Excel or SPSS

## Navigating the workspace 
ls()	# list objects in the GLOBAL ENVIRONMENT
rm(a)	# remove object 'a' from workspace/glob_env
ls()	# re-run to check if removing succesful
#rm(list=ls(all=TRUE)) #remove all objects, careful!

## Let's save our work
save(dataf,file = 'My_first.rda') # save individual variables
### where did it save to?
getwd() # a fuction to retrieve the folder that is set as default, normally needs to be changed

## Time for some flashbacks
# clear the global environment
rm(list=ls(all=TRUE))	# select R Console, Misc > Remove all objects
ls()				# select R Console, Misc > List Objects
load('My_first.rda')	# make the object avialable in R session again
dataf
plot(dataf)
### looks too bland? find the script above and run it to get the colourful lines
plot(dataf, main="Why vs Axe", xlab="5 values of d", ylab="why lable", type="b", col=2, pch=23)

## Set/get the working directory
setwd("D:/R/urbancafe") # note the quotes and forward slash / compared to backslash \\
getwd() # re-run to check if change is successful
# The working directory is where R will look for data and save data (stored in something called the 'global environment')
# file.choose() # this function can be used to find a file path too

# Save the dataf as a csv file in the new working directory
write.csv(dataf,"my_first_dataframe.csv",row.names=F) # the argument for false row names removes the first column of row numbers
# ?write.csv

# Save the plot in the WD
dev.copy(png,"my_first_plot.png")
dev.off() #the plot isn't actually written to the file until you call dev.off.
# can save it as JPEG, PDF: https://www.stat.berkeley.edu/~s133/saving.html

## Save this script: File>Save (ctrl + s)
# Find the folder (working directory) and save the script with an appropriate name
# A good practice in coding is not to use spaces, so either a fullstop "." or underscore "_" is used
# i.e.: Basic_R.r
# this applies to making objects, headers in dataframes, etc

rm(dataf)	# clear the workspace
ls()		# should have zero objects

## Loading/reading data into R
dataf <- read.csv('My_first_dataframe.csv')

# add a column to the dataframe
dataf$species <- as.factor(c("a","b","b","d","d","d"))
# the $ sign is used to make/select a column in the dataframe
# the as.factor ensures the type is not a list of 'characters'

# understanding what kind of data we have
str(dataf)		# outline of structure
summary(dataf)	# min,Q1,median,mean,Q3,max,tally/total

## that's all for lesson one!
# next up:
# installing packages
# loading packages
# running some advance functions and statistics