#' final_grade_display UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_final_grade_display_ui <- function(id){
  ns <- NS(id)
  tagList(
    bslib::layout_columns(
      fill = FALSE,
      uiOutput(ns("best_outcome")),
      uiOutput(ns("worst_outcome"))
    )
  )
}

#' final_grade_display Server Functions
#'
#' @noRd
mod_final_grade_display_server <- function(id, completed_ects, current_grade, remaining_ects,
                                           max_passing_grade, min_passing_grade, run_button){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    parameters <- reactive({
      list(
        completed_ects = completed_ects(),
        current_grade = current_grade(),
        remaining_ects = remaining_ects(),
        max_passing_grade = max_passing_grade(),
        min_passing_grade = min_passing_grade()
      )
    })

    vals <- eventReactive(run_button(), ignoreNULL = FALSE, {
      calculate_grade_range(
        completed_ects = parameters()$completed_ects,
        current_grade = parameters()$current_grade,
        remaining_ects = parameters()$remaining_ects,
        max_passing_grade = parameters()$max_passing_grade,
        min_passing_grade = parameters()$min_passing_grade
      ) %>%
        round(2)
    })

    output$best_outcome <- renderUI({
      bslib::value_box(
        title = "Your Best Possible Final Grade",
        value = vals()["best_outcome"],
        showcase = bsicons::bs_icon("emoji-laughing")
      )
    })

    output$worst_outcome <- renderUI({
      bslib::value_box(
        title = "Your Worst Possible Final Grade",
        value = vals()["worst_outcome"],
        showcase = bsicons::bs_icon("emoji-frown")
      )
    })

  })
}

## To be copied in the UI
# mod_final_grade_display_ui("final_grade_display_1")

## To be copied in the server
# mod_final_grade_display_server("final_grade_display_1")
