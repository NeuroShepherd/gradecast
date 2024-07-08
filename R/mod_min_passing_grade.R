#' min_passing_grade UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_min_passing_grade_ui <- function(id){
  ns <- NS(id)
  tagList(
    numericInput(ns("min_passing_grade"), "Min Grade",
                 value = 5, min = 1, max = 100, step = 0.1)
  )
}

#' min_passing_grade Server Functions
#'
#' @noRd
mod_min_passing_grade_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    return(reactive(input$min_passing_grade))

  })
}

## To be copied in the UI
# mod_min_passing_grade_ui("min_passing_grade_1")

## To be copied in the server
# mod_min_passing_grade_server("min_passing_grade_1")
