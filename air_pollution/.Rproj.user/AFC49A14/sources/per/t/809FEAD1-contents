corr <- function(directory, threshold = 0) {
  data <- numeric()
  for (id_value in 1:332) {
    file_data <- read.csv(paste(directory, "/", formatC(id_value, width=3, flag="0"), ".csv", sep = ""))
    file_data <- file_data[complete.cases(file_data),]
    if (nrow(file_data) > threshold) {
      data = c(data, cor(file_data$sulfate, file_data$nitrate))
    }
  }
  data
}