# Assignment 8 - Omar Sanchez

if (!requireNamespace("plyr", quietly = TRUE)) {
  install.packages("plyr", repos = "https://cloud.r-project.org")
}
library(plyr)

# 1. Import data and calculate average grades by sex
student6 <- read.table(file.choose(), header = TRUE, sep = ",",
                       stringsAsFactors = FALSE)

gender_mean <- ddply(student6, "Sex", summarise,
                     GradeAverage = mean(Grade, na.rm = TRUE))
print(gender_mean)

write.table(gender_mean, file = "gender_mean.txt", sep = "\t",
            row.names = FALSE)

# 2. Filter names containing i or I
i_students <- subset(student6, grepl("i", Name, ignore.case = TRUE))
print(i_students$Name)

write.csv(i_students$Name, file = "i_students.csv",
          row.names = FALSE, quote = FALSE)

# 3. Export the full filtered dataset
write.csv(i_students, file = "i_students_full.csv", row.names = FALSE)

output_files <- c("gender_mean.txt", "i_students.csv", "i_students_full.csv")
print(data.frame(File = output_files, Exists = file.exists(output_files)))
print(getwd())
