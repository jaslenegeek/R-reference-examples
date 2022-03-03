# The series of data visualization examples here follow exercises found on R 
# for Data Science book

library(tidyverse)
library(plyr)

View(mpg)

# Scatter plot of hwy vs displ--this shows the negative correlation between
# engine size and fuel efficiency
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Scatter plot of hwy vs cyl
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))

# Scatter plot of class vs drv--not useful because class is a categorical data
# and is visualizaed better using other chart types
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = class))

############################# AESTHETIC MAPPINGS ###############################

# Adding color to differentiate categorical data, class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# To visualize based on size, we can use this as reference. In this case, this 
# is not advisable because class is an unordered variable.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

## We can also use controls like transparency (alpha) or shape (shape)
# Transparency
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Shape--note that we can only use six shapes at a time
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Sample of specifying color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Mapping continuous variable to color, size, and shape. Note that mapping to
# a shape will throw an error as this is not possible for a continuous variable.
# In this case, mapping to color looks best visually.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cyl)) 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = cyl))

# Mapping to stroke. Default shape used is circle.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cty), color = 'black', 
             shape = 1, size = 2, stroke = 1)

# Mapping color to include condition on displ values (displ < 5). This will 
# change color to differentiate whether condition is TRUE or FALSE.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))

################################# FACETS #######################################

# Faceted plots allow for an easier comparison of data and identification of 
# existing patterns across variables. However, facet is only suggested on 
# variables with limited unique values as the plots may be too cluttered 
# otherwise.

# Facet based on class (variable should be discrete)
# nrow specify the number of rows; we can also specify columns using ncol
# We can also use arguments scales, shrink, as.table, switch, drop, and dir
# to customize the layout of individual panels. 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# Facet based on two variables (drv and cyl). Empty cells (e.g., displ = 5, 
# hwy = 4) mean that no such combination exists in our data.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# Facet in column dimension only.
# Put variable with more unique values in the column for easier comparison.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

# Facet in row dimension only
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

# Similar to facet_wrap, we can specify variable faceted to row or column using
# rows or cols in facet_grid.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cols = vars(cyl))

# Facet on a continuous variable (in this case, displ) is possible but might be
# too much especially if there are too many unique values
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ displ, nrow = 4)

############################ GEOMETRIC OBJECTS #################################

# Explore using different geometric objects to determine which is appropriate
# depending on the data and the goal of your analysis

# Smooth line fitted to data shows correlation better for this data
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Use different line types to differentiate unique values of a variable 
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) 

# We can also superimpose smooth line with scatter plot and differentiate by
# color
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# Smooth line differentiated by color with legend hidden
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

# Sample multiple geom functions
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

# Sample line plot with colors varying per drv. In this case, line plot seems
# to be too rigid to have any valuable insight gleaned from it
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_line(mapping = aes(color = drv))

# Sample box plot with color varying per class
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, fill = class)) + 
  geom_boxplot() +
  scale_fill_brewer(palette = "Dark2")

# Sample histogram for displacement varying per type of drive train
ggplot(data = mpg, mapping = aes(x = displ, fill = drv, color = drv)) + 
  geom_histogram(alpha = 0.5)

# Sample area chart for displacement varying per type of drive train
ggplot(data = mpg, mapping = aes(x = displ, fill = drv, color = drv)) + 
  geom_area(stat = "bin") 
