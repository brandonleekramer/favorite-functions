# set function for collapsing edgelists

collapse_edge_weights <- function(wtd_edgelist, analysis_year){
  library(igraph)
  library(tidyverse)
  wtd_edgelist <- wtd_edgelist %>%
    rename(from = country1, to = country2, weight = repo_wts) %>%
    filter(year == analysis_year) %>% select(-year)
  directed_graph <- graph.data.frame(wtd_edgelist, directed = TRUE)
  undirected_wtd_graph <- as.undirected(directed_graph, mode = "collapse", 
                                        edge.attr.comb = "sum")
  collapsed_wtd_edgelist <- as.tibble(as_data_frame(undirected_wtd_graph))
  collapsed_wtd_edgelist
}

# create collaboration matrices for all years

oss_intl_collaborations_2008 <- as.data.frame(
  get.adjacency(graph.data.frame(collapse_edge_weights(ctr_edgelist, "2008")), 
                sparse = FALSE, attr='weight')) %>%
  rownames_to_column(., var = "Country")