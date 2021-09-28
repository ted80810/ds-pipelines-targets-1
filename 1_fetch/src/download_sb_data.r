
  library(dplyr)
  library(readr)
  library(stringr)
  library(sbtools)
  library(whisker)
  
  fetch_data <- function(item_id, filepath_out) {
    #create directory
    project_output_dir <- dirname(filepath_out)
    dir.create(project_output_dir, showWarnings = FALSE)
    
    
    # Get the data from ScienceBase
    item_file_download(item_id, names = filename, destinations = filepath_out, overwrite_file = TRUE)
  }
