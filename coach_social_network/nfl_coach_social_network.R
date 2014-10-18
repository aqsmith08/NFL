# Load the igraph package
library(igraph)

# Load the data
coaches <- read.csv("nfl_coach_network.csv", header = T)

# See the column headers
names(coaches)
# [1] "team_initials" "team_city" "year" "coach1" "coach2" 

# Get the data into a matrix
coaches_matrix <- as.matrix(coaches)

# Parse out the coach1 and coach2 columns
coaches_network <- coaches[4:5]

network <- graph.data.frame(coaches_network, directed = F)

# Size of the vertices
V(network)$size <- 1

# Adjust margins
par(mai = c(0, 0, .5 ,0))

# Create visualization
plot(network, 
     layout = layout.fruchterman.reingold,
     main = "NFL Coach Social Network (since 2000)",
     vertex.label.dist = .25, 
     vertex.label.font = 1, 
     vertex.label.cex = 0,
     vertex.color = "red")
