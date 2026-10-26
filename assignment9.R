# Assignment 9 - Omar Sanchez
# Base graphics, lattice, and ggplot2

# install.packages(c("lattice", "ggplot2"))

library(lattice)
library(ggplot2)

# mtcars in the Rdatasets collection.
data("mtcars", package = "datasets")
head(mtcars)

car_data <- mtcars

# Cylinder count will be used to group the cars.
car_data$cyl <- factor(car_data$cyl)
summary(car_data)

dir.create("assignment9_plots", showWarnings = FALSE)

# 1. Base graphics
# Start with a plot, then add the title and regression line.
# pch controls the point shape, and cex controls its size.

png("assignment9_plots/base_scatter.png",
    width = 1200, height = 800, res = 150)

plot(car_data$wt, car_data$mpg,
     xlab = "Weight (1,000 lbs)",
     ylab = "Fuel Economy (US mpg)",
     pch = 19,
     cex = 1.2,
     col = "steelblue")

title(main = "Base R: Weight and Fuel Economy")

abline(lm(mpg ~ wt, data = car_data),
       col = "firebrick", lwd = 2, lty = 2)

legend("topright",
       legend = c("Cars", "Overall linear fit"),
       col = c("steelblue", "firebrick"),
       pch = c(19, NA),
       lty = c(NA, 2),
       lwd = c(NA, 2),
       bty = "n")

dev.off()

# A histogram shows the distribution of one numeric variable.

png("assignment9_plots/base_histogram.png",
    width = 1200, height = 800, res = 150)

hist(car_data$mpg,
     breaks = seq(10, 35, by = 5),
     main = "Base R: Distribution of Fuel Economy",
     xlab = "Fuel Economy (US mpg)",
     ylab = "Number of Cars",
     col = "lightblue",
     border = "white")

dev.off()

# 2. Lattice graphics
# The formula is y ~ x | group.
# Conditioning on cyl creates a separate panel for each group.
# type = c("p", "r") adds points and a regression line.

lattice_scatter <- xyplot(
  mpg ~ wt | cyl,
  data = car_data,
  main = "Lattice: Weight and Fuel Economy by Cylinders",
  xlab = "Weight (1,000 lbs)",
  ylab = "Fuel Economy (US mpg)",
  layout = c(3, 1),
  type = c("p", "r"),
  pch = 19,
  col = "steelblue",
  col.line = "firebrick",
  lwd = 2
)

print(lattice_scatter)

# Lattice creates a trellis object.
# Use print() to draw the object when saving it from a script.
png("assignment9_plots/lattice_scatter.png",
    width = 1500, height = 800, res = 150)
print(lattice_scatter)
dev.off()

# Compare the fuel economy distributions across cylinder groups.

lattice_boxplot <- bwplot(
  mpg ~ cyl,
  data = car_data,
  main = "Lattice: Fuel Economy by Cylinder Count",
  xlab = "Number of Cylinders",
  ylab = "Fuel Economy (US mpg)",
  fill = "lightblue"
)

print(lattice_boxplot)

png("assignment9_plots/lattice_boxplot.png",
    width = 1200, height = 800, res = 150)
print(lattice_boxplot)
dev.off()

# 3. ggplot2
# aes() maps variables to position and color.
# Add points, fitted lines, labels, and a theme with +.

gg_scatter <- ggplot(
  car_data,
  aes(x = wt, y = mpg, color = cyl)
) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_color_manual(
    values = c("4" = "steelblue",
               "6" = "darkorange",
               "8" = "darkgreen")
  ) +
  labs(
    title = "ggplot2: Weight and Fuel Economy",
    x = "Weight (1,000 lbs)",
    y = "Fuel Economy (US mpg)",
    color = "Cylinders"
  ) +
  theme_minimal()

print(gg_scatter)

ggsave("assignment9_plots/ggplot_scatter.png",
       plot = gg_scatter,
       width = 8, height = 5, dpi = 150,
       bg = "white")

# Faceting separates the histogram into cylinder groups.
# Keep the bin width and axis scales consistent across panels.

gg_histogram <- ggplot(car_data, aes(x = mpg)) +
  geom_histogram(
    binwidth = 5,
    boundary = 10,
    closed = "right",
    fill = "steelblue",
    color = "white"
  ) +
  facet_wrap(~ cyl, nrow = 1) +
  labs(
    title = "ggplot2: Fuel Economy Distribution by Cylinders",
    x = "Fuel Economy (US mpg)",
    y = "Number of Cars"
  ) +
  theme_minimal()

print(gg_histogram)

ggsave("assignment9_plots/ggplot_histogram.png",
       plot = gg_histogram,
       width = 10, height = 5, dpi = 150,
       bg = "white")

# Summary to help interpret the plots
aggregate(mpg ~ cyl, data = car_data, FUN = mean)

# The base scatter plot has one overall fitted line.
# Lattice and ggplot2 show separate fits for each cylinder group.

# Location of the six saved images
normalizePath("assignment9_plots")
