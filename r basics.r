#---------------------------------------------------------------#
# Text following a # is ignored, so you can use this to explain and document stuff
# or simply to give your script some structure/overview/clarity
# R: www.r-project.org/
# preferred Rstudio GUI: www.rstudio.com/
# use cntr+r to run a selection or current line

# Online R sources:
# https://cran.r-project.org/doc/manuals/R-intro.html
# http://www.cyclismo.org/tutorial/R/
# http://tryr.codeschool.com/
# https://www.r-bloggers.com/how-to-learn-r-2/
# https://awesome-r.com/
# http://www.r-tutor.com/


#---------------------------------------------------------------#
# Get/set the working directory
getwd()
setwd("E:/")

# Load libraries on top of those that are loaded by default.
library(secr)
# use install.package("secr"), or the 'Packages' tab to the right to install packages

# Optionally load other .r scripts, using source('sourceScript.r'), which in this case loads the script 'sourceScript.r'


#---------------------------------------------------------------#
# Variable Assignment: give a value to a named variable


# Both assignment operators "=" and "<-" can be used
a = 3
a
a <- 3
a

# Variable assignment means that the RHS is assigned to the LHS, thus this is possible:
a = 3
a = a + 3 # i.e.: the 'old' a + 3 becomes the 'new' a
a

# Generally you can freely give variables a name (they are case sensitive), but know that some names are reserved
# and thus not allowed to use as variable name. See:
?Reserved()


#---------------------------------------------------------------#
# General methods

# Above, we have created the variable 'a', which now should have the value 6
# in R, 'a' is a named object, and we can do different things with it

# for example, we can ask what class it is (data can be of different class, thus R has hence different classes)
class(a) # numeric

# contract to:
a = "test"
class(a) # character

# General methods include
# class() # retrieve the class of an object
# head() # header, defaults to first 6 rows/elements
# tail() # tail, defaults to last 6 rows/elements
# str() # display the structure of an object
# summary() # get a summary
# names() # object slot names (e.g. column names for data.frames)
# rownames() # object row names
# colnames() # object col names
# attributes() # object attributes
# length() # 1d length of a vector
# dim() # 2d dimension of a matrix/data.frame (nrow, ncol)
# nrow() # nr of rows
# ncol() # nr of cols
# which() # test which element equals TRUE

# Functions for simple arithmetics:
# mean() # average value
# min() # min value
# max() # max value
# sd() # standard deviation
# var() # variance
# cov() # variance-covariance matrix
# sqrt() # square-root


#---------------------------------------------------------------#
# Help

# To get help on a function, put a ? before the function name and run
?mean
?mean()
??mean # ?? will search anywhere it can, not just the matching function name


#---------------------------------------------------------------#
# Combine data into a vector

# Use c(...) to combine data into a vector, here values 1 up to 6
x = c(1,2,3,4,5,6) 	
x

# Some stats on x
length(x)
max(x)
mean(x)

# The same can be written in shorthand:
x = 1:6 # similar to the above
x

# Or, similarly, using the function seq:
seq(from=1, to=6, by=1) # sequence from 1 up to 6 in steps of 1
seq(from=1, by=1, length.out=6) # sequence starting at value 1 incrementing with 1 and total vector length of 6

# Use function rev() to reverse a vector:
6:1
rev(1:6)

# Toy example: create (and plot) a vector with first increasing values, then decreasing values
y = c(1:7, 6:1)
x = 1:length(y)
plot(x, y) # very default plotting
plot(x, y, xlab="x value", ylab="y value", type="b", col=2, pch=16, main="Plot title") # plot a bit adjusted

# For the vector y: get length of the vector, and number of unique values
length(y)
unique(y)
sort(unique(y))
length(unique(y))


#---------------------------------------------------------------#
# Missing / NA values

# Vector of values as above, but with missing value (NA)
y = c(1:7, NA, 6:1)
y

# Without instructing many functions otherwise, R does not 'know' how to deal with the NA value(s)
mean(y) # result: NA
mean(y, na.rm=FALSE) # this is the default, thus result still NA. Use the 'na.rm' argument to instruct functions whether or not to remove NA values prior to computing something (defaults to FALSE)
mean(y, na.rm=TRUE) # na.rm set to TRUE, thus NA's removed prior to computing the mean

# The same applies for many other functions, e.g. max(), min(), sd(), var(), ...

# Check for the existence of NA values using the function 'is.na': it returns TRUE if the value is NA, else FALSE
is.na(y) # all FALSE but 1 is TRUE
which(is.na(y)) # which record is 'TRUE'? Record 8


#---------------------------------------------------------------#
# Logical operators

# TRUE and FALSE are values of class "logical"
TRUE
FALSE
class(TRUE)
class(FALSE)

# Many operations in R return the result as a logical value, e.g. the is.na() function used above

# For example, some often-used logical operators (operators that check whether 2 values are different/the same/larger/smaller etc...)
1 == 1 # test whether they are the same
1 == 2 # idem. but result is false
c(1,2) == c(2,2) # the equality test is now done for each record in the vector separately
x = 1 == 2 # as above, but now the result (FALSE) is assigned to the variable 'x'
x
1 != 1 # is NOT equal to?
1 > 1 # larger than?
1 >= 1 # larger than or equal to?
1 < 1 # smaller than?
1 <= 1 # smaller than or equal to?
1 <= 2 & 4 > 3 # are BOTH tests TRUE?
1 <= 2 & 3 > 4 # idem
1 <= 2 | 3 > 4 # is ANY of the tests TRUE?
1 %in% c(1,2,3) # %in% checks whether the element occurs (anywhere) in another vector of values
! 4 %in% c(1,2,3) # %in% checks whether element is NOT (!) a part of vector
! 1 == 1 # ! is NOT
any(c(1,2) == c(2,2)) # TRUE if at least one of the results is TRUE
all(c(1,2) == c(2,2)) # TRUE only if ALL results are TRUE


#---------------------------------------------------------------#
# NULL: like NA, but now not a missing value, but something whose value is undefined
x = NULL
x
is.null(x)


#---------------------------------------------------------------#
# Basic calculations (on single values or vectors of data)
x = 1:100
mean(x)
var(x)
sum(x)
min(x)
max(x)
sqrt(x)
log(x)
log1p(x) # = log(1+x)
log(1+x)
x^2
exp(x) # e^x


#---------------------------------------------------------------#
# Vector indexing

# Vector can be subsetted / indexed using square brackets [], for example:
y # The full y vector as created above
y[7] # get 7th record from vector 'y': value 7
y[8] # get 7th record from vector 'y': value NA
y[1:3] # records 1-3 from vector 'y'

# Records can be removed from a vector using '-' before the record index
y[-8] # remove record 8 from the vector 'y', thus return all other records

# above: the y vector is returned without its 8th record, but the y vector itself still contains the 8th record:
y

# so use variable assignment to store the new subsetted vector, e.g.:
y2 = y[-8]
y2

# Be carefull in using a '-' index: compare and check what goes wrong:
y[-7:8] # error! (in this case the index goes from -7, -6, ..., 7, 8, thus this is wrong)
y[-c(7:8)] # okay: here elements 7 and 8 are removed from vector y

# Using vector indexing: compute the mean of the y vector in different ways (but all the same correct answer):
mean(y, na.rm=TRUE)
mean(y[-8])
mean(y[c(1:7,9:length(y))])
mean(y[!is.na(y)])
mean(y[-which(is.na(y))])

# Vector-element can also be given names, so that you can index them by their name:
weights = c("tim"=75, "peter"=82, "sam"=68)
weights
names(weights)

# different ways to get the value of weight given to "sam"
weights[3]
weights["sam"]
weights[names(weights) == "sam"]

# Names can also be assigned afterwards: here the same example:
weights = c(75, 82, 68)
weights
names(weights) = c("tim", "peter", "sam")
weights
weights[3]
weights["sam"]
weights[names(weights) == "sam"]


#---------------------------------------------------------------#
# data.frames

# one of the most important data classes in R are data.frames
# they are 2 dimensional tables, with a rows as records, and columns containing the pieces of information recorded per record

# by default, the columns in a data.frame have a name, but the rows are simply numbered 1,2... (but these can be given unique names as well)
x = data.frame(id=1:10, age = 21:30, name=c(rep("john",5), rep("eddie",5)), stringsAsFactors=FALSE) # the 'stringsAsFactors' argument can be used to specify whether character strings should be kept as class 'character' or as 'factor' (see below)
x

class(x)
dim(x) # nrow, ncol
nrow(x)
ncol(x)
head(x)
tail(x)
str(x)
names(x)
rownames(x)
summary(x)

# Like above: (row) names can be assigned/changed later
names(x)
names(x) = c("ID","AGE","NAME")
names(x)
names(x) = c("id","age","name")
names(x)
  

#---------------------------------------------------------------#
# Indexing / subsetting data.frames

# like indexing vectors, data.frames can be indexed using square brackets [], but because data.frames are 2D this needs to be [,], with row selection before the comma, and column selection after the comma
# [select rows, select columns]. when empty [,]: return all data
x[,]

# Select 1 entire column, here the 1st column: "id"
x$id
x[,1]
x[,"id"]
x[,c(TRUE,FALSE,FALSE)]
x[,names(x) == "id"]

# When selecting only 1 column (or row), by default a vector (and not a data.frame) is returned
class(x[,"id"]) # integer (vector)
class(x)

# Adding drop=FALSE will result in returning a data.frame instead (even with just 1 row and/or column); the default is drop=TRUE
x[,"id"]
x[,"id",drop=TRUE] # the same; the default: returning a vector and NOT a data.frame
x[,"id",drop=FALSE] # now returning a data.frame
class(x[,"id",drop=TRUE])
class(x[,"id",drop=FALSE])

# Selecting multiple columns (cannot be done using the $ sign, but can be done using the square brackets [,]). Here some different examples (some doing the same in a different way):
x[,c(1,3)]
x[,c("id","name")]
x[,c("name","id")]
x[,-2]
x[,names(x) %in% c("id","name")]
x[,names(x) != "age"]

# Select rows, done in the same way, but now for the first element of [,]
x[1,]
x[1:5,]
x[x$name=="eddie",]

# using the function subset(), you can (more easily) subset a data.frame, returning only records (=rows) that match the subsetting condition
subset(x, name=="eddie")

# Using the above, you can subset both rows and columns in different ways, e.g.:
x[1,"name"]
x[c(4,6,8),c("id","name")]
x[x$name=="eddie","id"]
subset(x, name=="eddie")$id
subset(x, name=="eddie")[,"id"]
subset(x, name=="eddie")[,c("name","id")]


#---------------------------------------------------------------#
# Adding columns to data.frame / recycling of values

# Create test data.frame with 10 records
test = data.frame(id=1:10, day=1, month="jan")
test
# note that all records have value 1 for column day, and value "jan" for column month

# When adding/changing the value of columns in a data.frame, the values are (possibly) recycled to fill the entire column
test$p1 = 1.4 # all records are value 1.4, thus R automatically recognizes them as class numeric
test$p2 = "blabla" # all records are value "blabla", thus R automatically recognizes them as class character
test$p3 = 1:10 # replacement value is of the same length as nrow(test), thus OK
test$p4 = c(21:30)+0.25 # idem, but numeric

test$p5 = 1:20 # ERROR: vector is longer than nrow(test)
test$p6 = 1:5 # Vector is shorter than nrow(test), but in this case NO warning: the values are recycled to fill the entire column (meaning nrow() %% length() == 0). This: value 1:5 is copied twice

test$p6 = 1:3 # ERROR: vector length shorter than nrow(test), and it cannot be fully recycled

test

# checking
nrow(test) %% length(1:5) == 0 # Checking; indeed TRUE

# doing the same manually:
rep(1:5, 2)


#---------------------------------------------------------------#
# Other data classes: matrix, list, factor, date, datetime, ...

### list
# one of the most basic/versatile classes in R, see ?list()
# elements in a list can be of different length and/or class, with named or unnamed elements
x = list(1:10, c(25,31), "John") # elements not named
x
x = list(id=1:10, age=c(25,31), name="John") # named elements
x

length(x)
str(x)
names(x)

# indexing and subsetting: using single or double square brackets: [] or [[]]
# [] returns a list which is a subset of the list
# [[]] returns a single element within the list
# e.g:
x["age"]
class(x["age"])
x[c("age","name")]

x[["name"]]
class(x[["name"]])

# Compare: [] vs [[]]
x["name"]
class(x["name"])
x[["name"]]
class(x[["name"]])

# wrong use: double brackets on >1 element (because double brackets only return 1 element)
x[[c("age","name")]]


### matrix: like data.frames 2 dimensional, but now all records are of the same class (in data.frames the columns can be of different class)
x = matrix(1:16, nrow=4, ncol=4, byrow=TRUE)
x

head(x)
class(x)

nrow(x)
ncol(x)
diag(x) # values on the diagonal
upper.tri(x) # Logical indicating whether a record belongs to the upper triangle
lower.tri(x) # idem, but lower triangle
x[upper.tri(x)]
t(x) # transpose

# For info on matrix algebra, see: http://www.statmethods.net/advstats/matrix.html

# Combining vectors into a matrix
x = cbind(1:10, 11:20, 101:110)
x
class(x)


### factor: for categorical data with limited options

# convert a character vector to object of class factor, implicitly assuming that all unique records in the vector are the possible levels the factor values can be
x = as.factor(c("john","patric"))
x
levels(x)

# specifying the factor levels manually
x = factor(c("patric","john"), levels=c("john","patric","eddie"))
x
levels(x)

# Now x has 3 levels, but only 2 of them currently occur in 'x'
length(x)
x[3] = "eddie" # this works: we now added a 3rd record with the name 'eddie'; this is one of the levels of 'x' so we can use it as a value

x[4] = "mark" # this gives an error: 'mark' is not a valid value for the factor object 'x', as it has specified levels where 'mark' is not one of them

# Thus: add "mark" to the levels of 'x', and try again
levels(x)
levels(x) = c(levels(x), "mark")
levels(x)

x[4] = "mark" # now it works!
x


### Date and date-time classes

# date objects are of class "Date"
# date-time objects are of class "POSIXct" (or "POSIXlt", but I would rather use POSIXct format) 

# to get the current system date/time (in local time zone)
x = Sys.Date()
x
class(x)

x = Sys.time()
x
class(x)

# To create POSIXct timestamps: most handy to use the ISOdatetime function:
x = ISOdatetime(2016,11,14,15,39,52, tz="GMT")
x
class(x)

# Converting from a systematix character string to POSIXlt format (see ?strptime() to see the many different formats possible)
x = strptime("2016-11-14 15:39:52", format="%Y-%m-%d %H:%M:%S", tz="GMT")
x
class(x)

x = as.POSIXct(x)
x
class(x)

# Having date/time data in Date or POSIX format makes many computations more easy
# e.g. time differences can then automatically be computed: e.g. using time2 - time1, or the function difftime()


#---------------------------------------------------------------#
# Conversions between classes: see:
as.matrix()
as.data.frame()
as.numeric()
as.factor()
as.character()
as.list()
as.integer()
as.POSIXct()


#---------------------------------------------------------------#
# Applying functions over rows/columsn of data.frames/matrices
x = matrix(1:16, nrow=4, ncol=4, byrow=TRUE)
x

# see: ?apply()
apply(x, 1, sum) # Sums per row
apply(x, 2, sum) # Sums per column

# or other functions applied per row:
apply(x, 1, mean)
apply(x, 1, max)
apply(x, 1, min)
apply(x, 1, sd)
# etc.

# For some functions, there are pre-difined functions
rowSums(x)
colSums(x)
rowMeans(x)
colMeans(x)


#---------------------------------------------------------------#
# Reading/writing external data

# Loading data into a data.frame from external files, here tab-delimited .txt file
x = read.table(file="E:/test.txt", sep='\t', head=TRUE)
# sep='\t': column-separator is a tab
# head=TRUE: the first row contains the header (column names)
# See also:
?read.table
?read.csv
?read.delim

# Writing a data.frame/matrix can be done using
?write.table
?write.csv
# or: write.matrix() in the library MASS

# An R-object can be saved to a .RData or .rda file using:
save(Robject, file="filename.RData")

# And can be loaded from file into R memory using:
load("filename.RData")

# Note that in this case, the file 'filename.RData' contains an R object which is named 'Robject'
# I normally save a R object using its name, so that you know the name of the object when loading the object

# To get a list of objects stored into memory:
objects()


#---------------------------------------------------------------#
# Random numbers / probability distributions...

# Uniform distribution:
?runif() # Random numbers
?dunif() # density values

# normal distribution:
?rnorm()
?dnorm()

# idem for other distributions: e.g.
# rweibull, rgamma, rexp, rlnorm etc

# See:
?Distributions()

# Example: draw 100,000 random values from normal distribution, plot histogram and add PDF line
x = rnorm(100000, mean=100, sd=25)
hist(x, breaks=100, freq=FALSE)
x_seq = seq(from=min(x), to=max(x), length.out=1000)
x_seq_density = dnorm(x_seq, mean=100, sd=25)
lines(x_seq, x_seq_density, col=2)


#---------------------------------------------------------------#
# Linear regression

# for linear regression, see functions lm() and glm()
# lm() fits a simple linear model, glm() is a generalized version which can do the same, but also much more by having control over the link function!

# Create a test data set with 100 records to use for regression analysis
dat = data.frame(id=1:100) # 1 column data.frame with just record id, 100 rows
dat$x = rnorm(100, mean=0, sd=1) # predictor variable, standard normal
dat$y = 0.55 + 1.33*dat$x - 0.85*dat$x^2 + rnorm(100, mean=0, sd=0.75) # response variable that is a function of intercept + x + x^2 + normally distributed noise

# Plot x vs y
plot(dat$x, dat$y, pch=16, col=2, cex=0.75, xlab="X", ylab="Y")

# Fit a gaussian GLM: HERE ONLY a linear line
fittedModel = glm(y ~ 1 + x, data=dat, family="gaussian")
# Explanation of the function arguments:
# 'y ~ 1 + x' means that the response variable is 'y', which is a function of an intercept ('1'; to omit the intercept use 0 instead) and the predictor variable 'x'
# the data that is needed for the regression is the data.frame 'dat'
# the error distribution to use is the gaussian one (also the default, so you could remove this part)

fittedModel # you now see a short printed summary of the model, but the R object itself contains a lot more!
names(fittedModel) # all the slots with stored information, e.g. the first one:
fittedModel$coefficients
summary(fittedModel) # a more detailed summary of the fitted model

# Use the fitted model to get a prediction line for new data
newdat = data.frame(x=seq(from=-3, to=3, length.out=1000)) # data.frame with 1000 rows with x increasing from -3 to 3
newdat$pred = predict(fittedModel, newdata=newdat) # using the fitted model, we get a prediction for the new dataset

# Add the new predicted data as a line to plot
lines(newdat$x, newdat$pred, col=4)
# note that the line does not really fit the data well

# Thus: fit a second model, now WITH squared x term
fittedModel2 = glm(y ~ 1 + x + I(x^2), data=dat, family="gaussian")
# here the 'I(x^2)' part first calculates x^2, and then includes it as a predictor in the GLM
newdat$pred2 = predict(fittedModel2, newdata=newdat) # Create a prediction again to draw a line
lines(newdat$x, newdat$pred2, col=3) # add the line, here green
# According to the plot, this model now fits much better!

# Add legend to the plot
legend(x="bottomright", bty="n", lty=1, col=c(2,3), legend=c("y ~ 1 + x","y ~ 1 + x + I(x^2)"))

# Test both models
anova(fittedModel, fittedModel2)
anova(fittedModel, fittedModel2, test="Chisq")
# model 2 seems to be significantly better than model 1, supporting the conclusions based on the plots drawn


#---------------------------------------------------------------#
# Conditionality: if (-else)

# Do something when a condition applies: here: change a value WHEN it is negative
x = -5
if(x < 0)
{
  x = 999
}
x

# compare to:
x = 10
if(x < 0)
{
  x = 999
}
x

# Similarly: do something when a condition applies, ELSE do something else
x = -5
if(x < 0)
{
  x = paste("negative value:",x) # see ?paste(): it concatenates values into a character string
}else
{
  x = paste("positive value:",x)
}
x

# Compare:
x = 10
if(x < 0)
{
  x = paste("negative value:",x) # see ?paste(): it concatenates values into a character string
}else
{
  x = paste("positive value:",x)
}
x


#---------------------------------------------------------------#
# Loops: 'for' and 'while' loops

# When doing something iteratively, wrap code inside a loop. The most often used loop is a 'for' loop, which does something a pre-specified number of times
# A for-loop takes this form:
# for(variable in sequence) expression
# where 'variable' is the name of your iteration variable, and 'sequence' is a vector or list of values.
# 'expression' can be a single R command - or several lines of commands wrapped in curly brackets:
# for(variable in sequence)
# { 
#   expression
#   expression
#   expression
# }

# Here a simple for loop that outputs the square root of the values 1-10
for(x in 1:10) print(sqrt(x))

# Written more clearly with curly brackets:
for(x in 1:10)
{
  print(sqrt(x))
}

# For example: using the above we can now do something like this:
dat = data.frame(id=1:10, value=1:10, valueSqrt=NA) # data.frame with empty column 'valueSqrt' which we are going to fill with values in a loop
# Fill first 5 values with sqrt(value)
for(i in 1:5)
{
  dat[i,"valueSqrt"] = sqrt(dat[i,"value"])
}
dat
# now fill rows 6:nrow()
for(i in 6:nrow(dat))
{
  dat[i,"valueSqrt"] = sqrt(dat[i,"value"])
}
dat
# Obviously this was just to show use of loops etc: there are more efficient ways to compute the sqrt in a data.frame :-)

# A while loop works somewhat the same, but only loops while some condition is met.
# NOTE that therefore you will have to make sure that at some point, the loop stops
# Without the loop stopping, it will run indefinately, untill you force the pc to switch off

i = 1 # our iterator
while(i <= 10) # loop as long as the iterator values is <= 10
{
	i = i + 1 # INCREASE The iterator values by 1
}
i
# The value of 'i' should now be 11: the last check of the while condition it was 10, then incremented within the loop, and then the loop stopped


#---------------------------------------------------------------#
# Create your own function

# Using the function() command, you can create your own function 

# a function contains a set of R expressions and provides a defined interface, with inputs (i.e. function arguments) and outputs (i.e. return values). The use of functions simplifies things for the user because the user no longer needs to be knowledgeable of the details of the underlying code. They only need to understand the inputs and outputs.

# The general structure of a function is as follows:
# functionName = function(functionArguments)
# {
#   functionBody
# }
# Which can then be called using
# functionName(functionArguments)
# where functionArguments is a series of arguments/objects passed on to the function,
# which are then processed in the functionBody part, the result of which is returned

# For example: create a very simple function that returns the the x plus 2
testFun = function(x)
{
  y = x + 2
  return(y)
}

# Test function
testFun(2) # should be 4

# multiple function arguments can be passed to the function, including default values (if they are not passed on to the function, this is the value that these arguments get!)
testFun = function(x, addition=2)
{
  y = x + addition
  return(y)
}
testFun(2) # still results in value 4
# only 1 argument is passed to the function, but it is not named. R assumes now that it is the first argument of the function specification, thus 'x'
# to avoid R having to 'guess' what argument you mean, use their name when passing on to the function:
testFun(x=2) # the same as above, but with more clarity (for yourself, and R)
# note: the argument 'addition' is not supplied, thus the default value 2 is used
testFun(x=2, addition=2) # same as default
testFun(x=2, addition=4) # new result: 6

# check behaviour (know that R allows for computations on vectors, not just single values):
testFun(x=c(2,3,4), addition=4)
testFun(x=c(2,3,4), addition=c(4,3,2))
testFun(x=c(2,3,4), addition=c(2,3,4))

# Extra arguments can be passed on to a function using '...', thereby avoiding the need to specify them in the function declaration
# This is VERY helpful when the behaviour of a function will be dynamic (as demonstrated below)
# but do not use this simply because of lazyness: when a function always uses a paramter/argument: do specify the argument in the function declaration

# To demonstate the usefullness: let us write a function that can do many different things, by passing on a function itself as one of the arguments
testFun = function(x, fun, ...)
{
	y = fun(x, ...)
	return(y)
}
# now: fun will be a function, which is applied to x together with any optional other argument passed on to the function using the '...'

# Create vector of data values
xvalues = 1:10

# Use the function to compute different things:
testFun(x=xvalues, fun=mean)
testFun(x=xvalues, fun=min)
# The same function can thus be used to compute different things: because it passes on the values to another function which we can specify

# Here, we did not pass any other arguments, thus we did not use the '...' part.
# But when we create a new vector with data, including NA, then this can be handy
xvalues = c(NA, 1:10)

# As above:
testFun(x=xvalues, fun=mean)
testFun(x=xvalues, fun=min)
# Both: result is NA, because there is a NA in the vector

# Use na.rm=TRUE (passed on to the functions through the ... part!)
testFun(x=xvalues, fun=mean, na.rm=TRUE)
testFun(x=xvalues, fun=min, na.rm=TRUE)
# now the result is ok, but note that we did not write the na.rm argument explicitly in the function specification!

# So we can do similar things but using other functions/arguments, e.g.:
xvalues = c(NA, 1:100)
testFun(x=xvalues, fun=quantile, probs=0.25, na.rm=TRUE, type=1)
# see ?quantile() for more info on this function

# The result of our function should be the same as:
quantile(xvalues, probs=0.25, na.rm=TRUE, type=1)


#---------------------------------------------------------------#
# General issues

# As you start to use many packages in R, the likelihood of two functions having the same name increases
# you can then use a function of a specified R package using: packagename::functionname()
# e.g.:
x = 1:10
base::mean(x) # the function 'mean' from the package 'base' is used




### END