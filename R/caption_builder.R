

#' Caption builder
#'
#' Builds the text caption for the grade range plot. The caption can be optionally turned off on the ggplot2 object which is useful when the text is not needed or rendered well on the image file. Instead, the Shiny app creates a separate text box for the caption.
#'
#' @param min_passing_grade the worst possible grade
#' @param max_passing_grade the best possible grade
#' @param caption_width text width for the caption. default 150
#' @param show_caption whether or not to display the text caption
#'
#' @return a character string
#' @export
#'
#' @examples
#'
#' caption_builder(min_passing_grade = 5, max_passing_grade = 1)
#'
caption_builder <- function(min_passing_grade, max_passing_grade, caption_width = 150, show_caption = TRUE) {

  assertthat::assert_that(
    is.numeric(min_passing_grade),
    is.numeric(max_passing_grade),
    is.numeric(caption_width),
    msg = "inputs must be a numeric value"
  )

  assertthat::assert_that(
    is.logical(show_caption),
    msg = "show_caption must be a logical value"
  )

  cap <- glue::glue("The shaded region represents the range of all possible grade averages that can be achieved based on three factors: 1) the current grade average or GPA, 2) the number of ECTS credits already completed, and 3) the amount of remaining ECTS.\n\nThe red line indicates the worst possible scenario i.e. obtaining {min_passing_grade}s in all classes while the green line indicates the best possible scenario i.e. obtaining {max_passing_grade}s in all classes. The blue dashed line represents the highest passing grade.") %>%
    stringr::str_wrap(width = caption_width)

  caption_text <- if (show_caption) cap else NULL

  return(caption_text)
}
