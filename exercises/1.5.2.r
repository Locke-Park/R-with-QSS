# 1.5.2 UNDERSTANDING WORLD POPULATION DYNAMICS
# 2020.12.09
# Sehoon Park

# 파일을 가져옵니다. 
setwd("~/Documents/qss/Rpractice/EX1.5.2/UNDERSTANDING WORLD POPULATION DYNAMICS")
getwd()
kenya.pop <- read.csv("Kenya.csv")
sweden.pop <- read.csv("Sweden.csv")
World.pop <- read.csv("World.csv")

# CBR 함수를 만듭니다.
CBR <- function(x){
  x[,"py.total"] <- x$py.men + x$py.women
  pop.early <- x[x$period == "1950-1955",]
  pop.late <- x[x$period == "2005-2010",]
  cbr.early <- sum(pop.early$births) / sum(pop.early$py.total)
  cbr.late <- sum(pop.late$births) / sum(pop.late$py.total)
  cbr.totalperiod <- c(cbr.early, cbr.late)
  names(cbr.totalperiod) <- c("1950-1955", "2005-2010")
  return(cbr.totalperiod*100)
}

# CBR 함수를 이용해 스웨덴의 기간별 출생률을 출력해봅시다. 
CBR(sweden.pop)

# 결과값
#1950-1955 2005-2010 
# 1.539614  1.192554 
