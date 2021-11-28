| Please choose a lesson, or type 0 to return to course menu.

 1: INTRO1         2: INTRO2         3: CAUSALITY1  
 4: CAUSALITY2     5: MEASUREMENT1   6: MEASUREMENT2
 7: PREDICTION1    8: PREDICTION2    9: PREDICTION3 
10: DISCOVERY1    11: DISCOVERY2    12: DISCOVERY3  
13: PROBABILITY1  14: PROBABILITY2  15: UNCERTAINTY1
16: UNCERTAINTY2  17: UNCERTAINTY3  

Selection: 2

  |                                                          |   0%

| These exercises are a companion to Chapter 1 of 'Quantitative
| Social Science: Introduction'.

...

  |==                                                        |   4%
| How would you multiply 4 by 7?

> 4*7
[1] 28

| That's a job well done!

  |=====                                                     |   8%
| How would you multiply 2 by the result of 9 plus 1?

> 2*(9+1)
[1] 20

| Nice work!

  |=======                                                   |  12%
| R will treat numbers like characters if you tell it to. However,
| you will no longer be able to use arithmetic operations on the
| object.

...

  |=========                                                 |  16%
| Assign the value 10 to "myobject".

> myobject <- 10

| Excellent job!

  |============                                              |  20%
| Subtract 2 from "myobject" and call it "result".

> result <- myobject -2

| Your dedication is inspiring!

  |==============                                            |  24%
| Use a function to find the class of "result".

> class(result)
[1] "numeric"

| You nailed it! Good job!

  |================                                          |  28%
| Reassign "myobject" to refer to the the characters '10'.

> myobject <- '10'

| That's correct!

  |===================                                       |  32%
| What is the value of "myobject" - 2?

1: It is undefined
2: 12
3: The same as "result"

Selection: 1

| Perseverance, that's the answer.

  |=====================                                     |  36%
| A vector called "x" with 10 integers from 1 to 100 has been
| included in this lesson.

...

  |=======================                                   |  40%
| Concatenate the first two elements of "x".

> x[c(1,2)]
[1] 76 40

| Keep up the great work!

  |==========================                                |  44%
| Find the maximum value in "x".

> max(x)
[1] 78

| You are amazing!

  |============================                              |  48%
| A vector of data called "world.pop" has been loaded with this
| lesson. The first element is for the year 1950 up to the last
| element for 2010.

...

  |==============================                            |  52%
| "world.pop" is a numeric vector so we can perform arithmetic
| operations on it.

...

  |================================                          |  56%
| Divide each element of "world.pop" by 1000 and call the result
| "pop.million".

> pop.million <- world.pop /1000

| Excellent work!

  |===================================                       |  60%
| Included in this lesson is a CSV data file called "data.csv". For
| convenience, the file path to "data.csv" is called "data_path".

...

  |=====================================                     |  64%
| Find the value of "data_path".

> data_path
[1] "/Library/Frameworks/R.framework/Versions/3.6/Resources/library/swirl/Courses/qss-swirl/INTRO2/data.csv"

| Great job!

  |=======================================                   |  68%
| Using "data_path" as the path, read the content of the data file
| and call it "df".

> df <- read.csv(data_path)

| You are really on a roll!

  |==========================================                |  72%
| A data frame object called "UNpop" has already been included in
| this lesson.

...

  |============================================              |  76%
| What are the dimensions of "UNpop"?

> dim(UNpop)
[1] 7 2

| Excellent job!

  |==============================================            |  80%
| Extract the variable "world.pop" from the "UNpop" data frame.

> UNpop$world.pop
[1] 2525779 3026003 3691173 4449049 5320817 6127700 6916183

| You got it!

  |=================================================         |  84%
| Use indexing and/or the $ operator to look at the last four
| observations of the "year" variable from the "UNpop" data frame.

> UNpop$year[4:7]
[1] 1980 1990 2000 2010

| Perseverance, that's the answer.

  |===================================================       |  88%
| Notice that you have to quote the name of the variable if you
| index into "UNpop", but not if you use the dollar sign.

...

  |=====================================================     |  92%
| R uses a special character to denote comments. Use the "print()"
| function to write 'X starts every comment'. Replace X with the
| appropriate character.

> print('# starts every comment')
[1] "# starts every comment"

| Keep working like that and you'll get there!

  |========================================================  |  96%
| What would you type to load the R package "utils"?

> library("utils")

| That's the answer I was looking for.

  |==========================================================| 100%
| You've successfully completed part 2 of the Intro course!
