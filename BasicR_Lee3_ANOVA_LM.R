# ANOVA - Analysis of Variance
# http://www.analyticsforfun.com/2014/06/performing-anova-test-in-r-results-and.html
# http://homepages.inf.ed.ac.uk/bwebb/statistics/ANOVA_in_R.pdf
# http://www.sthda.com/english/wiki/one-way-anova-test-in-r


## To load data into R
dataset <- read.csv(file.choose(), header=TRUE)

## We use a dataset avialable from R, mtcars
dataset <- mtcars

# explore the data
View(dataset)
str(dataset)
head(mtcars)


# when running an analysis, first check the assumptions
# check normality
shapiro.test(mtcars$mpg)
# The p-value needs to be bellow 0.05 for it to be normally distributed


## One way ANOVA
###model1 <- aov(y~x,data=dataset) 	# y = dependent variable, x = independent variable

model1 <- aov(mpg ~ cyl, data=mtcars)	# Is fuel efficiency affected by the number of cylinders?
summary(model1)
# Is the data fit the asumption of ANOVA,
# we can test run the data to see if it fits by
plot(model1)

## Two way ANOVA
###model2 <- aov(y ~ x + z + x*z, data=dataset) 	# two independent variables

model2 <- aov(mpg ~ cyl + gear + cyl*gear, data=mtcars)	# Note the different between "+" and "*"
summary (modal2)

## We are supposed to run a post hoc test if the means are not equal
tuk<- TukeyHSD(aov_cont)
tuk
plot(tuk)

## Running a simple linear regression with
# one independent variable and one dependent variable
### model3 <- lm(y~x, data= dataset)

model3 <- lm(mpg ~ cyl, data=mtcars)
summary(model3)
plot(model3)

# from the model, point graph can be plotted
###plot(x, y)
###plot(x, y, xlab="Xvalue", ylab="yvalue", main="graph")

plot(mtcars$mpg,mtcars$cyl)
#fit a linear regression graph in
abline(model3)



# The intepretation of the output
# Residuals are actually difference between actual observed and the response value predicted
# Intercept estimated coefficient is the expected value when dependent and independent variable is set to 1
# The variable coefficients is basically the change (+/-) in value needed when the independent increase by 1 unit
# Standard error is basically used to compute the confidence interval, in other words, it is an estimated error
# t-value is used to compute p value
# p value is the significance value
# Residual standard error is the quality of the regression line ie. is the amount of error that will deviate from the true regression line, with x number of sample included 
# The higher the value, the more important the independent affect the dependent (value range 0-1), adjusted according to number of variables
# F statistic is indicator of there's relationship between predictor and response varaibles, far away from 1 the better

# ANOVA can be run using the variables that is already key in to the lm function
anove(model)

# How about trying MANOVA?
# http://www.sthda.com/english/wiki/manova-test-in-r-multivariate-analysis-of-variance

# Now try running a GLM
# https://www.statmethods.net/advstats/glm.html