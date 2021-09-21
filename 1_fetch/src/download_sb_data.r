
  library(dplyr)
  library(readr)
  library(stringr)
  library(sbtools)
  library(whisker)
  
  fetch_data <- function() {
    project_output_dir <- '1_fetch/out'
    #create directory
    dir.create(project_output_dir)
    
    
    # Get the data from ScienceBase
    mendota_file <- file.path(project_output_dir, 'model_RMSEs.csv')
    item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
  }
