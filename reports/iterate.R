
library(rmarkdown)
library(stringr)
library(tidyverse)

# create an index
# index <- c("Aberdeen",  "Biloxi", "Boulder")
index <- c('Alameda', 'Contra Costa', 'Fresno', 'Imperial', 'Los Angeles',
           'Madera', 'Marin', 'Merced', 'Monterey',
            'Napa', 'Orange', 'Riverside',
           'Sacramento', 'San Benito', 'San Bernardino', 'San Diego',
           'San Francisco', 'San Joaquin', 'San Mateo', 'Santa Barbara',
           'Santa Clara', 'Santa Cruz', 'Sonoma',
           'Stanislaus', 'Tulare')
##TODO fix 'Monterey-Salinas Transit District',  'Sonoma/Marin'
# index <- c('Alameda')
# index <- c('Stanislaus', 'Tulare') 

# # create a data frame with parameters and output file names
# runs <- tibble(
#                  filename = str_c(index, ".pdf"),             # creates a string with output file names in the form <index>.pdf
#                    params = map(index, ~list(parameter1 = .)))  # creates a nest list of parameters for each object in the index

# create a data frame with parameters and output file names
runs <- tibble(
                 filename = str_c(index, ".pdf"),             # creates a string with output file names in the form <index>.pdf
                   params = map(index, ~list(county = .)))  # creates a nest list of parameters for each object in the index

# iterate render() along the tibble of parameters and file names
runs %>%
    select(output_file = filename, params) %>%
      pwalk(rmarkdown::render, input = "simple-factsheet.Rmd", output_dir = "factsheets")
