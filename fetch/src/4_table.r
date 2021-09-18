table_data <- function() {
  # Save the processed data
  readr::write_csv(eval_data, file = file.path(project_output_dir, 'model_summary_results.csv'))
}