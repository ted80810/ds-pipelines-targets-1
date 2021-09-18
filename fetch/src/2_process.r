get_data <- function() {
  # Get the data from ScienceBase
  mendota_file <- file.path(project_output_dir, 'model_RMSEs.csv')
  item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', destinations = mendota_file, overwrite_file = TRUE)
}
  
    prep_data <- function() {
      # Prepare the data for plotting
      eval_data <- readr::read_csv(mendota_file, col_types = 'iccd') %>%
        filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
        mutate(col = case_when(
          model_type == 'pb' ~ '#1b9e77',
          model_type == 'dl' ~'#d95f02',
          model_type == 'pgdl' ~ '#7570b3'
        ), pch = case_when(
          model_type == 'pb' ~ 21,
          model_type == 'dl' ~ 22,
          model_type == 'pgdl' ~ 23
        ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
    }
    
    