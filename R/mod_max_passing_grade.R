#' max_passing_grade UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_max_passing_grade_ui <- function(id){
  ns <- NS(id)
  tagList(
    numericInput(ns("max_passing_grade"), "Max Passing Grade",
                 value = 1, min = 1, max = 100, step = 0.1)
  )
}

#' max_passing_grade Server Functions
#'
#' @noRd
mod_max_passing_grade_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    return(reactive(input$max_passing_grade))

  })
}

## To be copied in the UI
# mod_max_passing_grade_ui("max_passing_grade_1")

## To be copied in the server
# mod_max_passing_grade_server("max_passing_grade_1")
