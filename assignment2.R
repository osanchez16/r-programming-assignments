# LIS 6371 - Assignment 2
# Omar Sanchez

# Create the assignment2 vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Original function provided in the assignment
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}

# Test original function
myMean(assignment2)

# Corrected function
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

# Test corrected function
myMean(assignment2)

# Compare against R's built-in mean function
mean(assignment2)