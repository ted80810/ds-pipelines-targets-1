library(targets)
source('code.R')
tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))
list(
  # Get the data from ScienceBase
  tar_target(
    model_RMSEs_csv,
    fetch_data(project_output_dir = "1_fetch/out/model_RMSEs.csv"),
    format = "file"
  ), 
  # Prepare the data for plotting
  tar_target(
    eval_data,
    process_data(project_input_dir = model_RMSEs_csv),
  ),
  # Create a plot
  tar_target(
    model_plot_png,
    plot_data(project_output_dir = "3_visualize/out/figure_1.png", data = eval_data), 
    format = "file"
  ),
  # Save the processed data
  tar_target(
    model_summary_results_csv,
    save_data(eval_data, project_output_dir = "2_process/out/model_summary_results.csv"), 
    format = "file"
  ),
  # Save the model diagnostics
  tar_target(
    model_diagnostic_text_txt,
    generate_model_diagnostics(project_output_dir = "2_process/out/model_diagnostic_text.txt", data = eval_data), 
    format = "file"
  )
)