
  library(dplyr)
  library(readr)
  library(stringr)
  library(sbtools)
  library(whisker)
  
  fetch_data <- function(project_output_dir) {
    #create directory
    dir.create(project_output_dir, showWarnings = FALSE)
    
    
    # Get the data from ScienceBase
    mendota_file <- file.path(project_output_dir)
    item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  }
