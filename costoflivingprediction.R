#prediction

dataframe <- read.csv("costofliving.csv")

#install.packages("tidyr")
library("tidyr")

dataframe$Full_city<- dataframe$City

dataframe <- dataframe %>%
  separate(City, c("Cty", "Country", "Country2"), ",")


print(head(dataframe,10))

dataframe$Country[dataframe$Country2 ==" United States"] <- "USA"

print(head(dataframe,10))
dataframe$Country

dataframe<-subset(dataframe,select= -c(Rank))

dataframe<-subset(dataframe,select= -c(Country2))
dataframe<-subset(dataframe,select= -c(Cty))


rownames(dataframe) <- dataframe$Full_city

dataframe$Full_city <- NULL
print(dataframe$Country[dataframe$City== "Birmingham"])
print(dataframe$Country[dataframe$City== "Vancouver"])
print(dataframe$Country[dataframe$City== "Hamilton"])

print(head(dataframe,10))
print(dataframe$City)


#with(dfcontinent, Continent[Country==ctry])

#install.packages("tidymodels")
library(readr)
library(tidymodels)

# ggplot(dataframe, aes(Rent.Index, fill = Country)) +
#   geom_bar() +
#   coord_flip()
plot(dataframe$Rent.Index)
help(plot)

dataframe <- na.omit(dataframe)

# Split data into train and test
set.seed(12)

dataframeTwo<-dataframe

dataframe$Country <- factor(dataframe$Country)
print(dataframe$Country)

split <- initial_split(dataframe, prop=0.8, strata=Country)
train <- split %>% training()
test <- split %>% testing()

#inear regression
lmModel = lm(Cost.of.Living.Index ~Rent.Index + Groceries.Index, data = train) #Create a linear regression with a quadratic coefficient
summary(lmModel) #Review the results

test2 = data.frame(Rent.Index=test$Rent.Index,Groceries.Index=test$Groceries.Index)

result <-  predict(lmModel,test2)
print(result)

library(modelr)
library(broom)

AIC(lmModel)
BIC(lmModel)

print(data.frame(
  R2 = rsquare(lmModel, data = test),
  RMSE = rmse(lmModel, data = test),
  MAE = mae(lmModel, data = test)
))

# #install.packages("caret")
library(caret)
predictions <- lmModel %>% predict(test)
print(data.frame(
  R2 = R2(predictions, test$Cost.of.Living.Index),
  RMSE = RMSE(predictions, test$Cost.of.Living.Index),
  MAE = MAE(predictions, test$Cost.of.Living.Index)
))

head(test)
colnames(dataframe)

#linear regression one

# lmTemp2 = lm(Pressure~Temperature + I(Temperature^2), data = pressure) #Create a linear regression with a quadratic coefficient
# summary(lmTemp2) #Review the results


#linear regression two



#linear regression 3













#install.packages("glmnet")

# Train a logistic regression model
# model <- logistic_reg(mixture = double(1),penalty=double(1)) %>%
#   set_engine("glmnet") %>%
#   set_mode("classification") %>%
#   fit(Country ~ ., data=train)
# model <-glm(Country ~.,data=train)
# 
# # Model summary
# tidy(model)

# # Load the multinom package
# library(nnet)
# model_one <- multinom(Country ~ ., data = train)
# # # Since we are going to use Academic as the reference group, we need relevel the group.
# # hsb$prog2 <- relevel(as.factor(hsb$prog), ref = 2)
# # hsb$ses <- as.factor(hsb$ses)
# # levels(hsb$prog2)
# 
# # z <- summary(test)$coefficients/summary(test)$standard.errors
# # z
# fitted(model_one)
# test$model_prob <- predict(model_one,test,type="response")
# 
# require(nnet)
# # Training the multinomial model
# multinom.fit <- multinom(Country ~ ., data = train)
# 
# # Checking the model
# summary(multinom.fit)
# 
# ## extracting coefficients from the model and exponentiate
# exp(coef(multinom.fit))
# 
# head(probability.table <- fitted(multinom.fit))
# 
# head(probability.table$max <- apply(probability.table, 1, max, na.rm=TRUE))
# 
# train$precticed <- predict(multinom.fit, newdata = train, "class")
# 
# # Building classification table
# ctable <- table(train$Country, train$precticed)
# 
# # Calculating accuracy - sum of diagonal elements divided by total obs
# round((sum(diag(ctable))/sum(ctable))*100,2)
# 
# 
# # Predicting the values for train dataset
# test$precticed <- predict(multinom.fit, newdata = test, "class")
# 
# # Building classification table
# ctable <- table(test$Country, test$precticed)
# 
# # Calculating accuracy - sum of diagonal elements divided by total obs
# (sum(diag(ctable))/sum(ctable))*100
# 
# 
# 
# ###################################
# dt = sort(sample(nrow(dataframe), nrow(dataframe)*.7))
# train<-data[dt,]
# test<-data[-dt,]
# 
# length(unique(dataframe$Country))
# 


# dfcontinent <- read.csv("Countries-Continents.csv")
# library(stringr)
# dataframe$Continent<- dfcontinent$Continent[str_squish(dataframe$Country) == str_squish(dfcontinent$Country)]
# dataframe$Continent
# 
# trim <- function (x) gsub("^\\s+|\\s+$", "", x)
# 
# dataframe$Country <- trim(dataframe$Country)
# dataframe$Country
# 
# dataframe$Continent <- dfcontinent$Continent[dfcontinent$Country==dataframe$Country]
# 
# for (c in unique(dataframe$Country)){
#   print(c)
#   print(dfcontinent$Continent[dfcontinent$Country=="Bermuda"])
#   dataframe$Continent[dataframe$Country==c] <- dfcontinent$Continent[dfcontinent$Country==c]
# }
# unique(dataframe$Country)
# 
# 
# 
# dfcontinent$Continent[dfcontinent$Country=="Nigeria"]
# dfcontinent$Continent
# print(with(dfcontinent, Continent[Country==dataframe$Country]))
# for (r in 1:nrow(dataframe)){
#   ctry<-dataframe[r,"Country"]
#   dataframe[r,"Continent"] <- dfcontinent[dfcontinent$Country==ctry]$Continent
# }
# dataframe$Continent