
getwd()
setwd()

require(dplyr)
require(ggplot2)
require(tidyr)
require(scales)
require(readxl)

PurchProbShirt <- read_excel("Shirt_Long_Results.xlsx")


shirt <- PurchProbShirt %>% 
  filter(`cost ($)` >= 10)

# Dot Plot chart ci bars
D <- ggplot(shirt, aes(y = probability, x = `cost ($)`, 
                      color = Sector, shape = Sector)) + 
  geom_point(position = position_dodge(width = 0.5)) +
  geom_errorbar(aes(ymin=probability-ci, ymax=probability+ci), width=.1, color="black", position = position_dodge(width = 0.5)) +
  scale_shape_manual(values=c(19, 4, 15, 17))+
  scale_color_manual(values=c('coral1', "purple4", "green3", "cornflowerblue"))+
  scale_x_continuous(breaks = 10:15) +
  labs(color = "Sector", shape = "Sector", x = "Cost", y = "Probability", 
       title = "Figure 5: Probability of purchasing a shirt by customer rating, cost, certification, and sector",
       caption="Each bar is constructed using a 95% confidence interval of the mean") +
  facet_wrap(vars(rating)) +
  theme_bw() +
  facet_grid(certification ~ rating) +
  theme(panel.grid.minor = element_blank(),
        legend.position = "bottom")

D + xlab("Cost in Dollars")

