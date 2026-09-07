# r-programming-assignments
# Omar Sanchez
#LIS6371.001F26
#Repository for R Programming Assignments
# LIS 6371 - Assignment 2

This assignment evaluates a user-defined mean function in R and corrects errors involving mismatched variable names.

## Corrected Function

```r
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

myMean(assignment2)
#Blog Link https://www.blogger.com/blog/post/edit/7491998236395229028/1275882447718015504
