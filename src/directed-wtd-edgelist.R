# Social Network Analysis Short Cuts 

# Situation 1: You have a directed, weighted edgelist that you want to collapse into a undirected, weighted edgelist. This requires collapsing two rows together without losing the weight information. For example, if you are working with a country collaboration network and have US->UK with a weight of 2000 in addition to UK->US with a weight of 1400, you'll want one row of US<->UK with a weight of 3400. There may be an easier way, but the only way I have found so far is to (1) simplify the network while simultanously collapsing the edges with igraph, (2) converting that igraph object to a matrix, and (3) melting the matrix into a weighted edgelist again.  

raw_edgelist <- as.data.frame(c("USA","UK"))
raw_edgelist[2] <- as.data.frame(c("UK","USA"))
raw_edgelist[3] <- as.data.frame(c(2000,1400))
colnames(raw_edgelist) <- c("country1", "country2", "weight")

network_data <- simplify(graph.data.frame(raw_edgelist, directed = FALSE), 
                         remove.loops = FALSE, 
                         edge.attr.comb = igraph_opt("edge.attr.comb"))
is_weighted(network_data)

temp_matrix <- as.matrix(as_adjacency_matrix(network_data, type = "lower", attr = "weight", sparse = T))
final_edgelist <- melt(temp_matrix)
final_edgelist %>% arrange(-value)

# References 

# https://davetang.org/muse/2017/03/16/matrix-to-adjacency-list-in-r/