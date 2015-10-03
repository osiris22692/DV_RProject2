require("jsonlite")
require("RCurl")
require("dplyr")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Diabetes"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_jzp78', PASS='orcl_jzp78', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
names(df)
summary(df)

#Data Wrangling part
dw1 <- df %>% select(TIME_IN_HOSPITAL, NUM_MEDICATIONS, READMITTED) %>% filter(READMITTED == "<30")
dw2 <- df %>% select(RACE, AGE, NUM_MEDICATIONS) %>% filter(RACE == c("AfricanAmerican", "Asian", "Caucasian", "Hispanic", "Other")) %>% group_by(AGE, RACE) %>% summarize(meanMeds = mean(NUM_MEDICATIONS))
dw3 <- df %>% select(GENDER, AGE, NUM_MEDICATIONS) %>% filter(GENDER == c("Male", "Female")) %>% group_by(GENDER, AGE) %>% summarize(meanMeds = mean(NUM_MEDICATIONS))
