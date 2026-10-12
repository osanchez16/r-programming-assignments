# Assignment 7
# Omar Sanchez

# Load and inspect data
data("mtcars")
head(mtcars)
str(mtcars)
class(mtcars)
typeof(mtcars)

# Generic functions
print(head(mtcars))
summary(mtcars)

# These use print.data.frame and summary.data.frame.

# S3 object
s3_obj <- list(name = "Omar", age = 25, GPA = 3.5)
class(s3_obj) <- "student_s3"

print.student_s3 <- function(x, ...) {
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
  invisible(x)
}

print(s3_obj)
s3_obj$name
s3_obj$GPA

class(s3_obj)
is.object(s3_obj)
isS4(s3_obj)
typeof(s3_obj)

# No summary.student_s3 method, so R uses summary.default.
summary(s3_obj)

# S4 object
library(methods)

setClass(
  "student_s4",
  slots = c(name = "character", age = "numeric", GPA = "numeric")
)

s4_obj <- new("student_s4", name = "Omar", age = 25, GPA = 3.5)

setMethod("show", "student_s4", function(object) {
  cat("Name:", object@name, "\n")
  cat("Age:", object@age, "\n")
  cat("GPA:", object@GPA, "\n")
})

show(s4_obj)
s4_obj@name
s4_obj@GPA

class(s4_obj)
isS4(s4_obj)
typeof(s4_obj)
slotNames(s4_obj)

# Compare storage types
typeof(25)
typeof(25L)
mode(25)
mode(25L)

# Not being S4 does not automatically make an object S3.
isS4(25)
is.object(25)
