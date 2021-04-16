RHT <- read.csv("F:/RHumidityTemp.csv") #Load the dataset

install.packages("ggplot2")
library(ggplot2)

#Scatter plot of Relative Humidity Vs temperature

qplot(Temperature,Relative.Humidity,data = RHT)

#DiagnosticPlots

plot(lm(Relative.Humidity~Temperature,data = RHT))

#Plot for Prediction Intervals and Confidence intervals


pred_int<-predict(lm(Relative.Humidity~Temperature,data=RHT),interval = "prediction")
RHT <- cbind(RHT,pred_int)

g <- ggplot(aes(Temperature,Relative.Humidity), data = RHT)
g+geom_point()+geom_smooth(method = 'lm')+geom_line(aes(y=lwr), color = "red", linetype = "dashed")+geom_line(aes(y=upr), color = "red", linetype = "dashed")

  