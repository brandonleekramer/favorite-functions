
# recoding strings using tidyverse, data.table and tidytable  

# most basic version 
new_df <- existing_df %>%
  as.data.table() %>%
  dt_mutate(new_col = ifelse(test = str_detect(string = term, 
                             new_colpattern = "\\b(test|string)\\b"), 
                             yes = "matches", no = "does_not"))

# setting strings before (when tons of strings)
library("tidyverse")
library("data.table")
test_string <- "\\b(?i)(test|string)\\b"
new_df <- existing_df %>%
  as.data.table() %>%
  dt_mutate(new_col = ifelse(test = str_detect(string = term, 
                                               pattern = test_string, 
                                               yes = 1, no = 0))

# simplified version for aesthetic purposes using tidytable 
library("tidytable")
new_df <- existing_df %>%
  mutate.(new_col = ifelse(str_detect(term, test_string, 1, 0))

# adding multiple codes to the same recoded column 
string1 <- "\\b(?i)(string1)\\b"
string2 <- "\\b(?i)(string2)\\b"
string3 <- "\\b(?i)(string3)\\b"
users_gh_cc <- data.table(oss_data) %>%
  mutate.(recoded_col = ifelse(str_detect(original_col, pattern = string1), 
                               yes = "recoded1", no = "")) %>%
  mutate.(recoded_col = ifelse(str_detect(original_col, pattern = string2),
                               paste("recoded2", recoded_col, sep=","), 
                               no = recoded_col)) %>%
  mutate.(recoded_col = ifelse(str_detect(original_col, pattern = string3),
                               paste("recoded3", recoded_col, sep=","), 
                               no = recoded_col))

# Applied examples 
https://github.com/uva-bi-sdad/oss-2020/blob/master/src/06_ncses-indicators/03_github-to-ctry-code.Rmd
https://github.com/brandonleekramer/diversity/blob/master/content/analyses/hypothesis1.Rmd
