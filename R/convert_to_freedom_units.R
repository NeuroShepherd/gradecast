#' Convert grades to freedom units
#'
#' This function takes a vector of grade on the German scale and converts them
#' to the "freedom units" scale i.e. to the equivalent American GPA scale. This
#' calculation makes use of the so-called "Bavarian formula."
#'
#' @param grades a vector of grades
#' @param max_passing_grade the maximum passing grade score
#' @param min_passing_grade the minimum passing grade score
#'
#' @return a vector of grades in "freedom units"
#' @export
#'
#' @examples
#'
#' convert_to_freedom_units(grades = c(1.3, 2.8))
#'
convert_to_freedom_units <- function(grades, max_passing_grade = 4, min_passing_grade = 1) {
  # Convert grades to freedom units
  freedom_units <- 1 + ((max_passing_grade - grades) / (max_passing_grade - min_passing_grade)) * 3

  return(freedom_units)
}
