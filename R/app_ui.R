#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bslib::page_sidebar(
      title = "gradecast",
      fillable = TRUE,
      sidebar = bslib::sidebar(
        title = "Data Input",
        mod_completed_ects_ui("completed_ects_1"),
        mod_current_grade_ui("current_grade_1"),
        mod_remaining_ects_ui("remaining_ects_1"),
        mod_max_passing_grade_ui("max_passing_grade_1"),
        mod_min_passing_grade_ui("min_passing_grade_1"),
        mod_run_button_ui("run_button_1")
      ),
      bslib::card(
        min_height = 250,
        bslib::card_header("App Info"),
        mod_app_description_ui("app_description_1")
      ),
      bslib::card(
        min_height = 250,
        bslib::card_header("Final Grade"),
        mod_final_grade_display_ui("final_grade_display_1")
      ),
      bslib::card(
        min_height = 600,
        bslib::card_header("Grade Forecasts"),
        mod_plot_grade_ui("plot_grade_1")
      ),
      bslib::card(
        min_height = 175,
        bslib::card_header("Plot Info"),
        mod_info_textbox_ui("info_textbox_1")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "gradecast"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
