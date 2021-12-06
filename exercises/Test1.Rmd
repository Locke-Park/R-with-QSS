---
title: "QSS_EXCERSICE_1-1"
author: "Sehoon Park"
date: "12/6/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#1.1 Load the data into R and check the dimensions of the data.
```{r}
setwd("~/Documents/qss/dataset/INTRO")
turnout <- read.csv("turnout.csv")
dim(turnout)
```
#1.2 Also, obtain a summary of the data.
```{r}
summary(turnout)
```
#1.3 How many observations are there?
```{r}
nrow(turnout)
```
#1.4 What is the range of years covered in this data set?
```{r}
range(turnout$year)
```
#2.1 Calculate the turnout rate based on the voting age population or VAP. Note that for this data set, we must add the total number of eliible overseas voters since the VAP variable does not include these individuals in the count.
```{r}
rate_vap = floor((turnout$total / (turnout$VAP+turnout$overseas)) * 100)
rate_vap
```
#2.2 Next, calculate the turnout rate using the voting eligible population or VEP.
```{r}
rate_vep = floor((turnout$total / turnout$VEP) * 100)
rate_vep
```
#2.3 What difference do you observe?
```{r}
print("VAP based turnout rate is slightly higher than VEP based one")
```
#3.1 Compute the differences between the VAP and ANES estimates of turnout rate.
```{r}
diff_vap_anes = abs(rate_vap - turnout$ANES)
```
#3.2 How big is the difference on average?
```{r}
mean(diff_vap_anes)
```
#3.3 What is the range of the differences?
```{r}
range(diff_vap_anes)
```
#3.4 Conduct the same comparision for the VEP and ANES estimates of voter turnout.
```{r}
diff_vep_anes = abs(rate_vep - turnout$ANES)
mean(diff_vep_anes)
range(diff_vep_anes)
```
#3.5 Briefly comment on the results.
```{r}
print("VEP based turnout rate shows less difference with ANES than VAP based rate.")
```

#4.1 Compare the VEP turout rate with the ANES turnout rate separately for presidential elections and midterm elections. Note that the data set excludes the year 2006
```{r}
rate_vep_presidential <- rate_vep[c(1,3,5,7,9,11,13,14)]
rate_anes_presidential <- turnout$ANES[c(1,3,5,7,9,11,13,14)]
rate_vep_midterm <- rate_vep[c(2,4,6,8,10,12)]
rate_anes_midterm <- turnout$ANES[c(2,4,6,8,10,12)]

rate_vep_presidential
rate_anes_presidential
rate_vep_midterm
rate_anes_midterm
```
#4.2 Does the bias of the ANES estimates vary across election types?
```{r}
abs(rate_vep_presidential - rate_anes_presidential)
abs(rate_vep_midterm - rate_anes_midterm)
print("The mid-term election data is more fluctuate.")
```
#5.1 Divide the data into half by election years such that you subset the data into two periods.
```{r}
early_turnout <- turnout[c(1:7),]
late_turnout <- turnout[c(8:14),]
early_turnout
late_turnout
```
#5.2 Claculate the difference between the VEP turnout and the ANES turnout rate separately for each year within each period.
```{r}
out1 <- diff_vep_anes[c(1:7)]
names(out1) <- early_turnout$year
out1

out2 <- diff_vep_anes[c(8:14)]
names(out2) <- late_turnout$year
out2
```
#5.3 Has the Bias of ANES increased over time?
```{r}
print("No, it hasn't")
```
#6.1 ANES does not interview prisoners and overseas voters. Calculate an adjustment to the 2008 VAP turnout rate. Begin by subtracting the total number of ineligible felons and noncitizens from the VAP to calculate an adjusted VAP.
```{r}

vap_2008 <- turnout[14,]
vap_2008
adjustment_turnout_2008 <- floor((vap_2008$total / (vap_2008$VAP-vap_2008$felons-vap_2008$noncit)*100))
adjustment_turnout_2008
```
#6.2 Next, calculate an adjusted VAP turnout rate, taking care to subtract the number of overseas ballots counted from the total ballots in 2008.
```{r}
adjustment2_turnout_2008 <- floor(((vap_2008$total - vap_2008$overseas)/ (vap_2008$VAP-vap_2008$felons-vap_2008$noncit)*100))
adjustment2_turnout_2008
```
#6.3 Compare the adjusted VAP turnout with the unadjusted VAP, VEP and the ANES turnout rate.Briefly discuss the results.
```{r}
name_2008 <- c("adjusted VAP", "VAP", "VEP", "ANES")
results_2008 <-c(60, 55, 61, 78)
names(results_2008) <- name_2008
results_2008
print("Adjusted VAP shows very simillar result with VEP.")
