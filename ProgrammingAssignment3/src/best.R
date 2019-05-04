source('utils.R')

best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  # 2: Name
  # 7: state
  
  if (!(state %in% data[[7]])) {
    stop("invalid state")
  }
  
  outcome_index <- get_outcome_index(outcome)
  
  data[, outcome_index] <- as.numeric(data[, outcome_index])
  
  data <- data[
    which(data[, 7] == state), 
  ]
  
  data <- data[
    complete.cases(data[, outcome_index]), 
  ]
  
  
  data <- data[
    order(data[, outcome_index], data[, 2]),
  ]
  
  data[1, 2]
}
