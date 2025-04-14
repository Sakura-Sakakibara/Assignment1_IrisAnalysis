## Intermediate R 
## 20250414 
## Assignment 1 - Iris Analysis


## 3. Installing and Initializing Packages:
## Install the tidyverse package 
install.packages("tidyverse")

## Load the tidyverse library
library(tidyverse)

## Install additional packages if needed.

## Save the state of your library.
install.packages("renv")
renv::init()


## 4.  Loading and Exploring Data:
## Load the Iris dataset 
data(iris)

##Explore the structure of the dataset using functions like head(), summary(), and str()
# View first few rows
head(iris)

# Summary statistics
summary(iris)

# Structure of the dataset
str(iris)


## 5. Data Manipulation: https://kelseyandersen.github.io/NetworksPlantPathology/APS2018_Tidyverse.html
# create tibble format table
df <- tbl_df(iris) 
df

# Filter rows with filter()
# here df is the object where we had store our tibble data
# yes, you need to use ==
filter(df, Species == "versicolor")

# Comparisons
filter(df, Petal.Length > 2)

# Logical operators
filter(df, Petal.Length > 6 & Sepal.Length > 7)

# arrange by sepal length then petal width. Default is ascending order. 
arrange(df, Sepal.Length, Petal.Width)

# allows to arrange in descending order. 
arrange(df, desc(Sepal.Length))

# from iris data, lets select only three columns - Species, Petal width and Petal length
select(df, Species, Petal.Width, Petal.Length)

mutate(df, log.Sepal.length = log(Sepal.Length))

# find mean of peteal length
summarise(df, mean(Petal.Length))

# find mean of petal length for each species
group_by(df, Species) %>% count(n())

df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))



## 6. Data Visualization with ggplot2:
library(ggplot2)
library(dplyr)

# 1) Scatter PLot
scatter_plot <- ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width") + theme_minimal()
# Save scatter plot
ggsave("figures/scatter_plot.png", plot = scatter_plot, width = 6, height = 4)

# 2) Box Plot
box_plot <- ggplot(data=df, aes(x=Species, y=Sepal.Length))
box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)

# Save scatter plot
ggsave("figures/box_plot.png", plot = box_plot, width = 6, height = 4)


# 3) Histogram
histogram <- ggplot(data=df, aes(x=Sepal.Width))

histogram +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width") 

# Save histogram
ggsave("figures/histogram.png", plot = histogram, width = 6, height = 4, dpi = 300)











