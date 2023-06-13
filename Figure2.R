
getwd()
setwd()

require(tidyverse)
require(ggplot2)
require(dplyr)
require(forcats)

#Creation of chart showing average part-worths with 95% credible intervals for the Shirt Test Scenario
#data("Partworth_Chart")
Partworth_Shirt_Chart <- read.csv("Partworth_Shirt_Chart.csv", header=TRUE)


Shirt <- Partworth_Shirt_Chart
# Convert design columns to factors (for labeling plots)
Partworth_Shirt_Chart$Attribute = factor(Partworth_Shirt_Chart$Attribute)
Partworth_Shirt_Chart$Level = factor(Partworth_Shirt_Chart$Level)


Partworth_Shirt_Chart$Level <- fct_inorder(f = c(
  'Nonprofit', 'For Profit', 'Unknown',
  '$10', '$11', '$12', '$13', '$14', '$15',
  'One Star', 'Two Stars', 'Three Stars', 'Four Stars',
  'Five Stars', 'No Stars', 'Certification', 'No Certification'), ordered = TRUE)

Partworth_Shirt_Chart$Level <- fct_rev(Partworth_Shirt_Chart$Level)


ggplot(Partworth_Shirt_Chart,
       aes(x=Mean, 
           y=Level)) +
  #geom_errorbar(aes(xmin = LB,
  #                  xmax = UB))+
  geom_pointrange(aes(xmin = LB,
                      xmax = UB))+
  geom_vline(xintercept = 0) +
  geom_point() +
  xlab("Mean Part-Worth Scores")+
  ylab("Attribute Levels")+
  scale_x_continuous(breaks = seq(-3,3, by=1))+
  facet_grid(Attribute ~., scales = 'free', space ='free_y')