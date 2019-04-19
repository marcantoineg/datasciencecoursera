complete <- function(directory, id = 1:332) {
  data <- data.frame(id = numeric(), nobs = numeric())
  for (id_value in id) {
    file_data <- read.csv(paste(directory, "/", formatC(id_value, width=3, flag="0"), ".csv", sep = ""))
    nobs_data <- nrow(file_data[complete.cases(file_data),])
    data <- rbind(data, data.frame(id = id_value, nobs = nobs_data))
  }
  data
}