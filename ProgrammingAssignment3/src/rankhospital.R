source('utils.R')

rankhospital <- function(state, outcome, num = 'best') {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  rankhospital_no_csv_read(data, state, outcome, num)
}

rankhospital_no_csv_read <- function(data, state, outcome, num = 'best') {
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
  
  switch(num,
         'best'={
           num <- 1
         },
         'worst'={
           num <- nrow(data)
         })
  if (num > nrow(data)) {
    return(NA)
  }
  
  data[num, 2]
}