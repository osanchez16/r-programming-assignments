# Assignment #4: Visualizing and Interpreting Hospital Patient Data

# 1. Data Preparation and Cleaning
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision,
  stringsAsFactors = FALSE
)

# Inspect the original data
summary(df_hosp)

# Remove rows containing NA values
df_hosp <- na.omit(df_hosp)

# Check the cleaned data
summary(df_hosp)
print(df_hosp)

# 2A. Side-by-Side Boxplots

png("BP_by_First_MD_Assessment.png", width = 800, height = 600)
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good", "Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment"
)
dev.off()

png("BP_by_Second_MD_Assessment.png", width = 800, height = 600)
boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment"
)
dev.off()

png("BP_by_Final_Decision.png", width = 800, height = 600)
boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision"
)
dev.off()

# 2B. Histograms

png("Histogram_Visit_Frequency.png", width = 800, height = 600)
hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)
dev.off()

png("Histogram_Blood_Pressure.png", width = 800, height = 600)
hist(
  df_hosp$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)
dev.off()
