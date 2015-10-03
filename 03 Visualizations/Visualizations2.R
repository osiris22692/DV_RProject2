require("ggplot2")
require("dplyr")
dw2 %>% ggplot(aes(x=AGE, y=meanMeds, color=RACE)) + geom_point()