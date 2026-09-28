# Assignment 5: Matrix Algebra in R
# Omar Sanchez

# Create the matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# Check dimensions: rows, then columns
print("Dimensions of A:")
print(dim(A))

print("Dimensions of B:")
print(dim(B))

# A has 10 rows and 10 columns, so it is square.
# B has 10 rows and 100 columns, so it is not square.

# Calculate the inverse of A
print("Inverse of A:")
invA <- tryCatch(solve(A), error = function(e) e)
print(invA)

# Calculate the determinant of A
print("Determinant of A:")
detA <- tryCatch(det(A), error = function(e) e)
print(detA)

# Calculate the inverse of B
print("Inverse of B:")
invB <- tryCatch(solve(B), error = function(e) e)
print(invB)

# Calculate the determinant of B
print("Determinant of B:")
detB <- tryCatch(det(B), error = function(e) e)
print(detB)

# Discussion:
# A is square, but its columns are linearly dependent.
# This makes A singular, which means it has no inverse.
# Therefore, solve(A) returns an error.
# det(A) can be calculated because A is square.
# Its mathematical determinant is zero.

# B is not square, so solve(B) and det(B) return errors.
# These operations require a square matrix, and an inverse
# also requires the matrix to be nonsingular.

# tryCatch saves the errors so the script can keep running
# and display the results for all four calculations.

# Numerical stability and performance:
# R uses floating-point arithmetic, so rounding can sometimes
# produce a very small determinant instead of exactly zero.
# Nearly singular matrices can give inaccurate inverse results.
# These matrices are small, so computing time is not a major concern.
