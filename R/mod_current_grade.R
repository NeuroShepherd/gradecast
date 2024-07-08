#' current_grade UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_current_grade_ui <- function(id){
  ns <- NS(id)
  tagList(
    numericInput(ns("current_grade"), "Current Grade", value = 1)
  )
}

#' current_grade Server Functions
#'
#' @noRd
mod_current_grade_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    return(reactive(input$current_grade))

  })
}

## To be copied in the UI
# mod_current_grade_ui("current_grade_1")

## To be copied in the server
# mod_current_grade_server("current_grade_1")
