library(rsample)      
library(caret)        
library(ggthemes)
library(scales)
library(wesanderson)
library(tidyverse)
library(gbm)
library(Metrics)
library(here)

roads = read.csv('C:/processingstep3.csv', header = TRUE, sep = ',')

set.seed(123)
RoadSplit <- initial_split(roads, prop = .7)
RoadTrain <- training(RoadSplit)
RoadTest  <- testing(RoadSplit)

set.seed(123)
road_fit_1 <- gbm::gbm(IsAccident ~., 
                       data = RoadTrain, 
                       verbose = TRUE, 
                       shrinkage = 0.01, 
                       interaction.depth = 10, 
                       n.minobsinnode = 5,
                       n.trees = 1000, 
                       cv.folds = 10
)
perf_gbm1 = gbm.perf(road_fit_1, method = "cv")
roadEffects <- tibble::as_tibble(gbm::summary.gbm(road_fit_1, 
                                                  plotit = FALSE))
roadEffects %>% utils::head()


gbm::plot.gbm(road_fit_1, i= 'November_DateTime')
gbm::plot.gbm(road_fit_1, i= 'December_DateTime')
gbm::plot.gbm(road_fit_1, i= 'Daylight_Light_Conditions')
gbm::plot.gbm(road_fit_1, i= 'CrossRoad_Junction_Detail')

n.trees = seq(from=100 ,to=1000, by=100) 
predmatrix<-predict(road_fit_1,RoadTrain,n.trees = n.trees)
dim(predmatrix) 


test.error<-with(RoadTrain,apply( (predmatrix-IsAccident)^2,2,mean))
head(test.error) 

plot(n.trees , test.error , pch=19,col="blue",xlab="Number of Trees",ylab="Test Error", main = "Perfomance of Boosting on Test Set")

abline(h = min(test.error),col="red") 
legend("topright",c("Minimum Test error Line for Random Forests"),col="red",lty=1,lwd=1)


roadEffects %>% 
  dplyr::arrange(desc(rel.inf)) %>%
  dplyr::top_n(10) %>%
  ggplot(aes(x = forcats::fct_reorder(.f = var, 
                                      .x = rel.inf), 
             y = rel.inf, 
             fill = rel.inf)) +
  geom_col() +
  coord_flip() +
  scale_color_brewer(palette = "Dark2") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text()) + 
  xlab('Features') +
  ylab('Relative Influence') +
  ggtitle("Top 10 caues of road accidents")

RoadTest$predicted <- base::as.integer(predict(oad_fit_1, 
                                               newdata = RoadTest, 
                                               n.trees = perf_gbm1))

ggplot(RoadTest) +
  geom_point(aes(y = predicted, 
                 x = IsAccident, 
                 color = predicted - IsAccident), alpha = 0.7) +
  theme_fivethirtyeight() +
  theme(axis.title = element_text()) + 
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma) +
  scale_color_continuous(name = "Predicted - Actual", 
                         labels = comma) +
  ylab('Predicted Accidents') +
  xlab('Actual Accidents') +
  ggtitle('Predicted vs Actual Acidents') 
