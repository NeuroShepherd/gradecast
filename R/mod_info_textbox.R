#' info_textbox UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_info_textbox_ui <- function(id){
  ns <- NS(id)
  tagList(
    textOutput(ns("info_textbox"))
  )
}

#' info_textbox Server Functions
#'
#' @noRd
mod_info_textbox_server <- function(id, min_passing_grade, max_passing_grade,
                                    caption_width = 150, run_button){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    text <- eventReactive(run_button(), ignoreNULL = FALSE, {
      caption_builder(
        min_passing_grade = min_passing_grade(),
        max_passing_grade = max_passing_grade(),
        caption_width = caption_width,
        show_caption = TRUE
        )
    })

    output$info_textbox <- renderText({
      text()
    })

  })
}

## To be copied in the UI
# mod_info_textbox_ui("info_textbox_1")

## To be copied in the server
# mod_info_textbox_server("info_textbox_1")
