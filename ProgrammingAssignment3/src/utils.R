get_outcome_index <- function(outcome) {
  outcome_index <- 0
  switch(outcome,
         'heart attack'={
           outcome_index = 11
         },
         'heart failure'={
           outcome_index = 17
         },
         'pneumonia'={
           outcome_index = 23
         })
  if (outcome_index == 0) {
    stop("invalid outcome")
  }
  outcome_index
}