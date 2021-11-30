> library(readr)
> turnout <- read_csv("~/Documents/계량사회과학/데이터셋/INTRO/turnout.csv")
Rows: 14 Columns: 9                                                                                    
── Column specification ────────────────────────────────────────────
Delimiter: ","
dbl (9): year, VEP, VAP, total, ANES, felons, noncit, overseas, ...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(turnout)
> dim(turnout)
[1] 14  9
> summary(turnout)
      year           VEP              VAP             total       
 Min.   :1980   Min.   :159635   Min.   :164445   Min.   : 64991  
 1st Qu.:1986   1st Qu.:171192   1st Qu.:178930   1st Qu.: 73179  
 Median :1993   Median :181140   Median :193018   Median : 89055  
 Mean   :1993   Mean   :182640   Mean   :194226   Mean   : 89778  
 3rd Qu.:2000   3rd Qu.:193353   3rd Qu.:209296   3rd Qu.:102370  
 Max.   :2008   Max.   :213314   Max.   :230872   Max.   :131304  
                                                                  
      ANES           felons         noncit         overseas   
 Min.   :47.00   Min.   : 802   Min.   : 5756   Min.   :1803  
 1st Qu.:57.00   1st Qu.:1424   1st Qu.: 8592   1st Qu.:2236  
 Median :70.50   Median :2312   Median :11972   Median :2458  
 Mean   :65.79   Mean   :2177   Mean   :12229   Mean   :2746  
 3rd Qu.:73.75   3rd Qu.:3042   3rd Qu.:15910   3rd Qu.:2937  
 Max.   :78.00   Max.   :3168   Max.   :19392   Max.   :4972  
                                                              
    osvoters  
 Min.   :263  
 1st Qu.:263  
 Median :263  
 Mean   :263  
 3rd Qu.:263  
 Max.   :263  
 NA's   :13   
> range(year)
Error: object 'year' not found
> range(turnout$year)
[1] 1980 2008
> turnout_rate <- turnout$total / (turnout$VAP + turnout&overseas)
Error: object 'overseas' not found
> real_vap = turnout$VAP + turnout$overseas
> real_vap
 [1] 166248 168010 176356 180138 184212 188818 193196 197487 202515
[10] 208250 213560 218770 224198 235844
> turnout_rate_vap = turnout$total / real_vap
> turnout_rate_vap
 [1] 0.5203972 0.4024522 0.5253748 0.3607845 0.4972260 0.3593884
 [7] 0.5404097 0.3803086 0.4753376 0.3483169 0.4934211 0.3582850
[13] 0.5454777 0.5567409
> turnout_rate_vep = turnout$total / turnout$VEP
> turnout_rate_vep
 [1] 0.5419551 0.4213701 0.5524860 0.3814115 0.5276848 0.3841895
 [7] 0.5811384 0.4112625 0.5165793 0.3809316 0.5422449 0.3951064
[13] 0.6010084 0.6155433
> turnout_rate_vap_100 = turnout_rate_vap * 100
> turnout_rate_vap_100
 [1] 52.03972 40.24522 52.53748 36.07845 49.72260 35.93884 54.04097
 [8] 38.03086 47.53376 34.83169 49.34211 35.82850 54.54777 55.67409
> difference_vap_anes = abs(turnout_rate_vap_100 - turnout$ANES)
> difference_vap_anes
 [1] 18.96028 19.75478 21.46252 16.92155 20.27740 11.06116 20.95903
 [8] 17.96914 25.46624 17.16831 23.65789 26.17150 22.45223 22.32591
> average_diff_vap_anes = average(difference_vap_anes)
Error in average(difference_vap_anes) : could not find function "average"
> average_diff_vap_anes = mean(difference_vap_anes)
> average_diff_vap_anes
[1] 20.32914
> range_diff_vap_anes = range(difference_vap_anes)
> range_diff_vap_anes
[1] 11.06116 26.17150
> turnout_rate_vep_100 = turnout_rate_vep * 100
> difference_vep_anes = abs(turnout_rate_vep_100 - turnout$ANES)
> average_diff_vep_anes = mean(difference_vep_anes)
> range_diff_vep_anes = range(difference_vep_anes)
> average_diff_vep_anes
[1] 16.83634
> range_diff_vep_anes
[1]  8.581054 22.489359
> turnout_rate_vep_100[c(2,4,6,8,10,12)]
[1] 42.13701 38.14115 38.41895 41.12625 38.09316 39.51064
> turnout$ANES[c(2,4,6,8,10,12)]
[1] 60 53 47 56 52 62
> turnout_rate_vep_100[c(1,3,5,7,9,11,13,14)]
[1] 54.19551 55.24860 52.76848 58.11384 51.65793 54.22449 60.10084
[8] 61.55433
> turnout$ANES[c(1,3,5,7,9,11,13,14)]
[1] 71 74 70 75 73 73 77 78
> diff_rate_vep_anes_midterm = abs(turnout_rate_vep_100[c(2,4,6,8,10,12)] - turnout$ANES[c(2,4,6,8,10,12)])
> diff_rate_vep_anes_midterm
[1] 17.862987 14.858846  8.581054 14.873745 13.906838 22.489359
> diff_rate_vep_anes_presidential
Error: object 'diff_rate_vep_anes_presidential' not found
> diff_rate_vep_anes_presidential = abs(turnout_rate_vep_100[c(1,3,5,7,9,11,13,14)] - turnout$ANES[c(1,3,5,7,9,11,13,14)])
> diff_rate_vep_anes_presidential
[1] 16.80449 18.75140 17.23152 16.88616 21.34207 18.77551 16.89916
[8] 16.44567
> 
