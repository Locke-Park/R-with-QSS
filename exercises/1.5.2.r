### Contents: Understanding World Population Dynamics
### Date : 2021-12-9
### Name : Sehoon Park


# Set Working Directory and Upload files. 

setwd("~/Documents/qss/Rpractice/EX1.5.2/UNDERSTANDING WORLD POPULATION DYNAMICS")
getwd()
kenya.pop <- read.csv("Kenya.csv")
sweden.pop <- read.csv("Sweden.csv")
world.pop <- read.csv("World.csv")


# Make a function for computing CBR(crude birth rates)
# Results : All of CBR has reduced by the time passed. 

CBR <- function(x){
  x[,"py.total"] <- x$py.men + x$py.women
  pop.early <- x[x$period == "1950-1955",]
  pop.late <- x[x$period == "2005-2010",]
  cbr.early <- sum(pop.early$births) / sum(pop.early$py.total) * 1000
  cbr.late <- sum(pop.late$births) / sum(pop.late$py.total) * 1000
  cbr.totalperiod <- c(cbr.early, cbr.late)
  names(cbr.totalperiod) <- c("1950-1955", "2005-2010")
  return(cbr.totalperiod)
}
data.frame(CBR(kenya.pop), CBR(sweden.pop), CBR(world.pop))



# Make a fucntion for computing ASFR

ASFR <-function(x){
  #1950-1955 period data
  early.birth <- x$births[4:10]
  early.pywomen_asfr <- x$py.women[4:10]
  early.asfr <- floor(early.birth /early.pywomen_asfr *1000)
  names(early.asfr) <- x$age[4:10]
  #2005-2010 period data
  late.birth <- x$births[19:25]
  late.pywomen_asfr <- x$py.women[19:25]
  late.asfr <- floor(late.birth /late.pywomen_asfr *1000)
  names(late.asfr) <- x$age[19:25]
  return(data.frame(early.asfr, late.asfr))
}
ASFR(kenya.pop)
ASFR(sweden.pop)
ASFR(world.pop)

data.frame(ASFR(kenya.pop),ASFR(sweden.pop),ASFR(world.pop))



# Make a TFR function.

TFR <-function(x){
  early.country.asfr <-ASFR(x)[1:7,1]
  early.tfr <-sum(early.country.asfr) * 5
  late.country.asfr <-ASFR(x)[1:7,2]
  late.tfr <-sum(late.country.asfr) * 5
  return(c(early.tfr,late.tfr))
}
TFR(kenya.pop)
TFR(sweden.pop)
TFR(world.pop)



# Make a CDR function. 

CDR <- function(x){
  x[,"py.total"] <- x$py.men + x$py.women
  pop.early <- x[x$period == "1950-1955",]
  pop.late <- x[x$period == "2005-2010",]
  cdr.early <- sum(pop.early$deaths) / sum(pop.early$py.total)
  cdr.late <- sum(pop.late$deaths) / sum(pop.late$py.total)
  cdr.totalperiod <- c(cdr.early, cdr.late)
  names(cdr.totalperiod) <- c("1950-1955", "2005-2010")
  return(cdr.totalperiod*1000)
}
data.frame(CDR(kenya.pop), CDR(sweden.pop), CDR(world.pop))



# Make a ASDR function 

ASDR <-function(x){
  x[,"py.total"] <- x$py.men + x$py.women
  #1950-1955 period data
  early.death <- x$death[1:15]
  early.pytotal.asdr <- x$py.total[1:15]
  early.asdr <- floor(early.death /early.pytotal.asdr *1000)
  names(early.asdr) <- x$age[1:15]
  #2005-2010 period data
  late.death <- x$death[16:30]
  late.pytotal.asdr <- x$py.total[16:30]
  late.asdr <- floor(late.death /late.pytotal.asdr *1000)
  names(late.asdr) <- x$age[16:30]
  return(data.frame(early.asdr, late.asdr))
}
ASDR(kenya.pop)
ASDR(sweden.pop)
ASDR(world.pop)

# Make a counterfactual CDR (Kenya and Sweden)

ASDR(kenya.pop)$early.asdr
#P <- py.total / sum(py.total)

Counter.CDR <- function(x,y){
  y[,"py.total"] <- y$py.men + y$py.women
  P <- y$py.total / sum(y$py.total)
  counter.cdr.early <- sum(ASDR(x)$early.asdr / P[1:15])
  counter.cdr.late <- sum(ASDR(x)$late.asdr / P[16:30])
  return(data.frame(counter.cdr.early,counter.cdr.late))
}
Counter.CDR(kenya.pop,sweden.pop)
CDR(kenya.pop)
