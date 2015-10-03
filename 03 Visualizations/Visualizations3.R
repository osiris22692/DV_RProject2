require("ggplot2")
require("dplyr")
dw3 %>% ggplot(aes(x=AGE, y=meanMeds, color=GENDER)) + geom_point()