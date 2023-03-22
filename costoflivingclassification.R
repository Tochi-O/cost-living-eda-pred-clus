#classification


dataframe <- read.csv("costofliving.csv")
print(dataframe$Rank)
#drop empty rank column
dataframe<-subset(dataframe,select= -c(Rank))
#making the index be the city names
rownames(dataframe) <- dataframe$City

dataframe$City <- NULL

head(dataframe,10)

k2 <- kmeans(dataframe, centers = 4, nstart = 25)
str(k2)


fviz_cluster(k2, data = dataframe)





# dfRace<-
# 
# dfEdu<-
# 
# dfTestPrep<-
#   
#   
#   library(tidyverse)  # data manipulation
# library(cluster)    # clustering algorithms
# library(factoextra) # clustering algorithms & visu
# 
# df <- USArrests
# 
# df <- na.omit(df)
# 
# df <- scale(df)
# head(df)
# 
# distance <- get_dist(df)
# fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))
# 
# k2 <- kmeans(df, centers = 4, nstart = 25)
# str(k2)
# 
# 
# fviz_cluster(k2, data = df)
# 
# edu=unique(dfEdu$parentallevelofeducation)
# 
# k3 <- kmeans(df, centers = 4), nstart = 25)
# k4 <- kmeans(df, centers = 4, nstart = 25)
# k5 <- kmeans(df, centers = 4, nstart = 25)
# 
# #plots to compare
# p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
# p2 <- fviz_cluster(k3, geom = "point",  data = df) + ggtitle("k = 3")
# p3 <- fviz_cluster(k4, geom = "point",  data = df) + ggtitle("k = 4")
# p4 <- fviz_cluster(k5, geom = "point",  data = df) + ggtitle("k = 5")
# 
# library(gridExtra)
# grid.arrange(p1, p2, p3, p4, nrow = 2)
# 
