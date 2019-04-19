pollutantmean <- function(directory, pollutant, id = 1:332) {
  csv_file_names <- paste(directory, "/", formatC(id, width=3, flag="0"), ".csv", sep = "")
  pollutant_values <- numeric()
  for (file_name in csv_file_names) {
    file_data <- read.csv(file_name)[[pollutant]]
    pollutant_values <- c(pollutant_values, file_data[!is.na(file_data)])
  }
  sum(pollutant_values)/length(pollutant_values)
}