#exploratory data analysis

# usa

# canada

#switzerland


#MEAN COST OF LIVING INDEX FOR USA
meancolusa<- mean(dataframe$Cost.of.Living.Index[dataframe$Country=="USA"], na.rm=TRUE)
meancolusa
dataframe$Cost.of.Living.Index[dataframe$Country=="USA"]


#MEAN RENT FOR USA
meanrentusa<-mean(dataframe$Rent.Index[dataframe$Country=="USA"], na.rm=TRUE)
meanrentusa

# MEAN GROCERIES FOR USA
meangroceriesusa<- mean(dataframe$Groceries.Index[dataframe$Country=="USA"], na.rm=TRUE)
meangroceriesusa
dataframe$Groceries.Index[dataframe$Country=="USA"]


#CITY WITH HIGHEST COST OF LIVING INDEXIN SWITZERLAND
maxcolswiz<-max(dataframe$Cost.of.Living.Index[dataframe$Country=="Switzerland"])
maxcolswiz
maxcityswiz<-rownames(dataframe)[dataframe$Cost.of.Living.Index==131.24]
maxcityswiz

#CITY WITH LOWEST RENT INDEX IN CANADA
minrentcanada<- min(dataframe$Rent.Index[dataframe$Country=="Canada"])
minrentcanada
minrentcanadacity<- rownames(dataframe)[dataframe$Rent.Index==minrentcanada & dataframe$Country=="Canada" ]
minrentcanadacity

#GROCERIES VS RESTAURANT PRICE
plot(dataframe$Groceries.Index,dataframe$Restaurant.Price.Index, col='red', main = 'groceries index vs restaurant index', xlab='Groceries Index',ylab='Restaurants Index')

#COST OF LIVING INDEX TO PURCHASING POWER
plot(dataframe$Cost.of.Living.Index,dataframe$Local.Purchasing.Power.Index, col='pink', main = 'Cost of living index vs Local Purchasing index', xlab='Cost of Living Index',ylab='Local Purchasing Index')


#SORT BY HIGHEST 
