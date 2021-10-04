library(targets)
source('1_fetch/src/download_sb_data.r')
source('2_process/src/process_model_data.r')
source('3_visualize/src/plot_model_data.r')
tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))
list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(item_id = '5d925066e4b0c4f70d0d0599', filename = 'me_RMSE.csv', filepath_out = "1_fetch/out/model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    process_data(in_filepath = model_RMSEs_csv),
  ),
  # Create a plot
  tar_target(
    model_plot_png,
    plot_data(filepath_out = "3_visualize/out/figure_1.png", data = eval_data), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    save_data(eval_data, filepath_out = "2_process/out/model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    generate_model_diagnostics(filepath_out = "2_process/out/model_diagnostic_text.txt", data = eval_data), 
    format = "file"
  )
)