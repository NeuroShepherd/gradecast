#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  completed_ects_1 <- mod_completed_ects_server("completed_ects_1")
  current_grade_1 <- mod_current_grade_server("current_grade_1")
  remaining_ects_1 <- mod_remaining_ects_server("remaining_ects_1")
  max_passing_grade_1 <- mod_max_passing_grade_server("max_passing_grade_1")
  min_passing_grade_1 <- mod_min_passing_grade_server("min_passing_grade_1")
  run_button <- mod_run_button_server("run_button_1")

  mod_plot_grade_server("plot_grade_1",
    completed_ects = completed_ects_1,
    current_grade = current_grade_1,
    remaining_ects = remaining_ects_1,
    max_passing_grade = max_passing_grade_1,
    min_passing_grade = min_passing_grade_1,
    run_button = run_button
  )

  mod_info_textbox_server("info_textbox_1",
    min_passing_grade = min_passing_grade_1,
    max_passing_grade = max_passing_grade_1,
    caption_width = 200,
    run_button = run_button
  )

  mod_final_grade_display_server("final_grade_display_1",
    completed_ects = completed_ects_1,
    current_grade = current_grade_1,
    remaining_ects = remaining_ects_1,
    max_passing_grade = max_passing_grade_1,
    min_passing_grade = min_passing_grade_1,
    run_button = run_button
  )
}
