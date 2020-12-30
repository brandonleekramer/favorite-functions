

value_by_team <- function(input_data, teams_col, value_col, fppg_col, players_col){
  
  library("tidyverse")
  
  teams_col <- enquo(teams_col)
  value_col <- enquo(value_col)
  fppg_col <- enquo(fppg_col)
  players_col <- enquo(players_col)
  
  input_data <- input_data %>% 
    filter(!!(teams_col) != "FA") %>% 
    group_by(!!(teams_col)) %>% 
    top_n(!!(players_col), wt = !!(fppg_col)) %>% 
    summarize(team_value = sum(!!(value_col))) %>% 
    arrange(-team_value)
  
  input_data
}