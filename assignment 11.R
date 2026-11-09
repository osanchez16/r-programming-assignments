# Omar Sanchez
# LIS 6371 - Assignment 11: Debugging and Defensive Programming

# Check one column using R's default quartiles and the 1.5 * IQR rule.
tukey.outlier <- function(x) {
  quartiles <- quantile(x, probs = c(0.25, 0.75), names = FALSE)
  iqr <- quartiles[2] - quartiles[1]
  lower <- quartiles[1] - 1.5 * iqr
  upper <- quartiles[2] + 1.5 * iqr
  x < lower | x > upper
}

# Original function from the assignment.
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

cat(R.version.string, "\n\n")
cat("Original function:\n")

# Catch the original error so the corrected version can run below.
original_error <- try(tukey_multiple(test_mat), silent = TRUE)
if (inherits(original_error, "try-error")) {
  cat(as.character(original_error))
} else {
  print(original_error)
}

# The fix is & instead of &&, since each column contains several values.
corrected_tukey <- function(x) {
  if (!is.matrix(x) || !is.numeric(x)) {
    stop("x must be a numeric matrix.", call. = FALSE)
  }
  if (nrow(x) == 0L || ncol(x) == 0L) {
    stop("x must have at least one row and one column.", call. = FALSE)
  }
  if (any(!is.finite(x))) {
    stop("x must contain only finite values (no NA, NaN, or Inf).",
         call. = FALSE)
  }

  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

cat("\nCorrected function:\n")
result <- corrected_tukey(test_mat)
print(result)
print(length(result))
print(is.logical(result))

stopifnot(is.logical(result), length(result) == nrow(test_mat), !anyNA(result))

# Row 10 is an outlier in both columns. Row 9 is only an outlier in column 1.
known_mat <- cbind(c(1:8, 100, 100), c(1:9, 100))
cat("\nKnown outlier check:\n")
known_result <- corrected_tukey(known_mat)
print(known_result)
print(which(known_result))
stopifnot(identical(which(known_result), 10L))

# These examples should produce informative errors.
cat("\nCharacter matrix check:\n")
tryCatch(
  corrected_tukey(matrix(c("a", "b", "c", "d"), nrow = 2)),
  error = function(e) cat("Error:", conditionMessage(e), "\n")
)

cat("\nMissing value check:\n")
missing_mat <- test_mat
missing_mat[1, 1] <- NA_real_
tryCatch(
  corrected_tukey(missing_mat),
  error = function(e) cat("Error:", conditionMessage(e), "\n")
)

cat("\nEmpty matrix check:\n")
tryCatch(
  corrected_tukey(matrix(numeric(0), nrow = 0, ncol = 2)),
  error = function(e) cat("Error:", conditionMessage(e), "\n")
)
