## Learning to make nice graphics with 'ggplot2'
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
 

## first load up required libraries
library() # to check what packages are avialable
library(ggplot2)

install.packages('ggplot2') # this only needs to be run once, if the library does not have required package
# CRAN mirrors mean the physical servers that are store identical copies of the binaries, select 'Malaysia' which is located in UPM.
# the installed packages are in C:\Users\LightLee\Documents\R\win-library\3.5


## set the working directory
setwd("D:/R/urbancafe")	# set the working directory #needs to be \\ or / 
getwd()  			# check the working directory

## load in the data we want to use (your own preferbably)
mydata <- read.csv('my_first_dataframe.csv')
mydata

# we can also use one of the datasets avialable from R
data() 			# for a list of datasets in R
library (datasets)	# normally we place all the libraries we need at the top of the script
library (titanic)
ls ("package:titanic")	# list the objects (dataframes) inside a package


# Let's use the example data set prepared by R, Motor Trader Cars (mtcars)


# Explore the dataset
str(mtcars) # explore the car dataframe structure
View(mtcars) # View the data in a popup window
### how many rows and columns are there?

## Let's do some plotting with the ggplot2 package
?ggplot2
# Download and print the cheatsheet  for ggplot, it has quick summaries of functions
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

## Remember the basic format of R language
# object <- function (dataframe, arguments)

# we start with the function ggplot(), 
# supply a dataset and give arguements for aesthetic mapping: aes().
# Then we add on layers: geom_point() or geom_histogram(),
# scales: scale_colour_brewer() and coordinate systems: coord_flip().


ggplot(mtcars,aes(x=cyl,y=mpg))				# cyl is cylinders, mpg is 'miles per gallon'
ggplot(mtcars,aes(x=cyl,y=mpg))+geom_point()		# Add 'geoms': visual marks that represent data points
ggplot(mtcars,aes(x=factor(cyl),y=mpg))+geom_boxplot()	# notice the difference
ggplot(mtcars,aes(x=factor(cyl),y=mpg))			# 
	+geom_bar(stat = "summary", fun.y = "mean")	# make bar graphs with the mean of each group (factor)


#save your plot in the working directory
ggsave("my_first_ggplot.png") 

# try making a complex graph following an online manual
# https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html