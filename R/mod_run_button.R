#' run_button UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_run_button_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(ns("run_button"), "Run")
  )
}

#' run_button Server Functions
#'
#' @noRd
mod_run_button_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    return(reactive(input$run_button))

  })
}

## To be copied in the UI
# mod_run_button_ui("run_button_1")

## To be copied in the server
# mod_run_button_server("run_button_1")
