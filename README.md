# r-programming-assignments
# Omar Sanchez
#LIS6371.001F26
#Repository for R Programming Assignments
# LIS 6371 


Assignment 2

This assignment evaluates a user-defined mean function in R and corrects errors involving mismatched variable names.

## Corrected Function

```r
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}

myMean(assignment2)
#Blog Link https://www.blogger.com/blog/post/edit/7491998236395229028/1275882447718015504

Assignment 3

This assignment analyzes a small set of 2016 poll data using R. I created a data frame from candidate names and ABC and CBS poll values, inspected the data using str() and head(), calculated summary statistics, and added a column showing the difference between the two polls. I also created a bar chart with ggplot2 to compare the poll results visually. The assignment also discusses the limitations of using made-up data and how real polling data should be validated before drawing conclusions.

Blog post: [Analyzing 2016 Poll Data in R](https://www.blogger.com/blog/post/edit/7491998236395229028/4811437798620748381)
