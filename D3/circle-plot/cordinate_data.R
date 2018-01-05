library(jsonlite)
# get coordinates for circle area plot
x <- 1:21
y <- 1:34
# define the categories
category <- c(rep("transplant", 226), rep("died", 16), rep("removed", 45), rep("waiting", 427))
# enumerate all combinations of the x and y coordinates
data <- expand.grid(x, y)
# combine categories and coordinate data
data <- cbind(data, category)
colnames(data) <- c("x", "y", "category")

write_json(toJSON(data, "rows"), "coordinate_data.json")
