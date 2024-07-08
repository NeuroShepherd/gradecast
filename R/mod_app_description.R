#' app_description UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_app_description_ui <- function(id) {
  ns <- NS(id)
  tagList(
    "Have you ever looked at your current Notendurchschnitt (Grade Point Average or GPA), and wondered how much you can improve your grades by the of your program? (Alternatively: do you want to estimate how much you can slack off and still pass your program?) Then this app is for you! Just input how much of your program you've already completed (Completed ECTS), your current grades (Current Grades) and how much of your program remains (Remaining ECTS).",
    "The app creates a forecast of your final GPA based on your current grades and the grades you might receive in the future. The outcomes are bounded by the maximum and minimum passing grades of your program; that is, the bounds of the forecast assume that you will receive the maximum (green) or minimum (red) possible grade for your remaining courses."
  )
}

#' app_description Server Functions
#'
#' @noRd
mod_app_description_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_app_description_ui("app_description_1")

## To be copied in the server
# mod_app_description_server("app_description_1")
