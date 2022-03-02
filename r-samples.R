# The series of data visualization examples here follow exercises found on R 
# for Data Science book

library(tidyverse)

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

# Aesthetic mapping--adding color to differentiate categorical data, class
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




