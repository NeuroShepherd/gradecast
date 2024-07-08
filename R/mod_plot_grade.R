#' calculate_grade_range UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plot_grade_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotOutput(ns("grade_plot"))
  )
}

#' calculate_grade_range Server Functions
#'
#' @noRd
mod_plot_grade_server <- function(id, completed_ects, current_grade, remaining_ects,
                                  max_passing_grade, min_passing_grade, run_button) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # browser()

    parameters <- reactive({
      list(
        completed_ects = completed_ects(),
        current_grade = current_grade(),
        remaining_ects = remaining_ects(),
        max_passing_grade = max_passing_grade(),
        min_passing_grade = min_passing_grade()
      )
    })

    plot_obj <- eventReactive(run_button(), ignoreNULL = FALSE, {
      plot_grade_range(
        completed_ects = parameters()$completed_ects,
        current_grade = parameters()$current_grade,
        remaining_ects = parameters()$remaining_ects,
        max_passing_grade = parameters()$max_passing_grade,
        min_passing_grade = parameters()$min_passing_grade
      )
    })

    output$grade_plot <- renderPlot({
      plot_obj()
    })
  })
}

## To be copied in the UI
# mod_plot_grade_ui("plot_grade_1")

## To be copied in the server
# mod_plot_grade_server("plot_grade_1")
