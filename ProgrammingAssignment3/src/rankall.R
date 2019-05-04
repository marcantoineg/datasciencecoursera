source('rankhospital.R')

rankall <- function(outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  states <- sort(unique(data[[7]]))
  
  i <- 0
  states_col <- character(length(states))
  names_col <- character(length(states))
  for(state in states) {
    i <- i+1
    states_col[i] <- state
    
    names_col[i] <- rankhospital_no_csv_read(data, state, outcome, num)
  }
  data.frame("hospital" = names_col, "state" = states_col, row.names = states_col)
}