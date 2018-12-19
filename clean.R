
library(caTools)
clean_data<-raw_data

# find unique values in each column to check for abnormal values
sapply(clean_data,function(y)unique(y))

# the Satisfaction variable has 3 abnormal values which need to be replaced or removed

#conversion to numeric converts the abnprmal values to NA
clean_data$Satisfaction <- as.numeric(as.character(t(clean_data$Satisfaction)))

mean(clean_data$Satisfaction,na.rm=TRUE)
# mean = 3.37941
# replace the NA values with mean
# the NA values are replaces with 3.5 instead of the actual value of the mean because 
# satisfaction is a factor variable and 3.5 is the closest value
clean_data$Satisfaction[is.na(clean_data$Satisfaction)] <- 3.5
clean_data$southeast<-as.factor(trimws(clean_data$Airline.Name)=='Southeast Airlines Co.')
unique(clean_data$Satisfaction)
clean_data_full=clean_data



data = clean_data
dim(data)  # 32 11

#Sample Indexes
indexes = sample(1:nrow(data), size=0.25*nrow(data))

# Split data
test = data[indexes,]
dim(test)  
train = data[-indexes,]
dim(train) 
clean_data = train
