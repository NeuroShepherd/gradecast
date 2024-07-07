#' Calculate grade range
#'
#' This function calculates the best and worst possible grade averages that can
#' be achieved based on the current grade average, the number of ECTS credits
#' already completed, and the number of remaining ECTS credits to complete.
#'
#' @param completed_ects the number of ECTS credits already completed
#' @param current_grade the current grade average
#' @param remaining_ects the number of ECTS credits remaining to complete
#' @param top_grade the best possible grade
#' @param worst_grade the worst possible grade
#'
#' @return a vector with the best and worst possible grade averages
#' @export
#'
#' @examples
#'
#' calculate_grade_range(120, 3.5, 60)
#' calculate_grade_range(120, 3.5, 60, 1, 5)
#'
calculate_grade_range <- function(completed_ects, current_grade, remaining_ects,
                                  top_grade = 1, worst_grade = 5) {

  grade_min_max <- c(min = min(top_grade, worst_grade), max = max(top_grade, worst_grade))
  assertthat::assert_that(completed_ects >= 0, msg = "completed_ects must be >= 0")
  assertthat::assert_that(remaining_ects >= 0, msg = "remaining_ects must be >= 0")
  assertthat::assert_that(current_grade >= grade_min_max['min'],
                          current_grade <= grade_min_max['max'],
                          msg = "current_grade must be between top_grade and worst_grade")

  # Calculate the weighted min and max grade
  worst_outcome <- (completed_ects * current_grade + remaining_ects * worst_grade) / (completed_ects + remaining_ects)
  best_outcome <- (completed_ects * current_grade + remaining_ects * top_grade) / (completed_ects + remaining_ects)

  # Calculate the grade range
  grade_range <- c(best_outcome = best_outcome, worst_outcome = worst_outcome)

  return(grade_range)
}
