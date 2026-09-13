# Assignment #3 - Analyzing 2016 Poll Data

# Create vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)

CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine vectors into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect the data frame
str(df_polls)
head(df_polls)

# Summary statistics for ABC poll
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

# Summary statistics for CBS poll
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

# Difference between CBS and ABC polls
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# View completed data frame
df_polls

# install.packages("ggplot2")

library(ggplot2)

# Convert data to long format for the chart
poll_plot_data <- data.frame(
  Name = rep(df_polls$Name, 2),
  Poll = rep(c("ABC", "CBS"), each = nrow(df_polls)),
  Support = c(df_polls$ABC_poll, df_polls$CBS_poll)
)

# Create bar chart
poll_chart <- ggplot(
  poll_plot_data,
  aes(x = Name, y = Support, fill = Poll)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Comparison of ABC and CBS Poll Data",
    x = "Candidate",
    y = "Poll Value",
    fill = "Poll"
  ) +
  theme_minimal()

# Display chart
poll_chart

# Save chart
ggsave(
  "assignment_3_poll_chart.png",
  plot = poll_chart,
  width = 8,
  height = 5
)
