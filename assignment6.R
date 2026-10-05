# Assignment 6: Matrix Operations and Construction
# Omar Sanchez

# Task 1: Matrix addition and subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

print(A)
print(B)

print(A + B)
print(A - B)

# Task 2: Create a diagonal matrix
D <- diag(c(4, 1, 2, 3))
print(D)

# Task 3: Construct the 5 x 5 matrix
# Start with the diagonal, then fill the first row and column
M <- diag(rep(3, 5))
M[1, 2:5] <- 1
M[2:5, 1] <- 2

print(M)
