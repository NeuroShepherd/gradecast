#' completed_ects UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_completed_ects_ui <- function(id){
  ns <- NS(id)
  tagList(
    numericInput(ns("completed_ects"), "Completed ECTS", value = 0)
  )
}

#' completed_ects Server Functions
#'
#' @noRd
mod_completed_ects_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    return(reactive(input$completed_ects))

  })
}

## To be copied in the UI
# mod_completed_ects_ui("completed_ects_1")

## To be copied in the server
# mod_completed_ects_server("completed_ects_1")
