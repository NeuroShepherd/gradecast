#' remaining_ects UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_remaining_ects_ui <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("remaining_ects"), "Remaining ECTS",
      value = 120, min = 0, step = 1
    )
  )
}

#' remaining_ects Server Functions
#'
#' @noRd
mod_remaining_ects_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    return(reactive(input$remaining_ects))
  })
}

## To be copied in the UI
# mod_remaining_ects_ui("remaining_ects_1")

## To be copied in the server
# mod_remaining_ects_server("remaining_ects_1")
