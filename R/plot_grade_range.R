

#' Plot grade range
#'
#' @param completed_ects the number of ECTS credits already completed
#' @param current_grade the current grade average
#' @param remaining_ects the number of ECTS credits remaining to complete
#' @param top_grade the best possible grade
#' @param worst_grade the worst possible grade
#'
#' @return a ggplot2 object
#' @export
#'
#' @examples
#'
#' plot_grade_range(30, 1.5, 90)
#'
plot_grade_range <- function(completed_ects, current_grade, remaining_ects,
                             top_grade = 1, worst_grade = 5) {

  # remaining_ects <- program_ects - completed_ects
  program_ects <- completed_ects + remaining_ects

  grades <- calculate_grade_range(completed_ects, current_grade, remaining_ects, 1, 5)

  plt_data <- data.frame(completed_ects = completed_ects,
                         current_grade = current_grade,
                         program_ects = program_ects,
                         grades_high = grades[1],
                         grades_low = grades[2]
                         )

  ylims <- c( min(c(top_grade, worst_grade)), max(c(top_grade, worst_grade)) )


  ggplot(data = plt_data) +
    scale_x_continuous(
      limits = c(0, program_ects),
      breaks = seq(0, program_ects, 30)
    ) +
    scale_y_continuous(
      limits = ylims
    ) +
    geom_segment(aes(x = completed_ects, y = current_grade,
                     xend = program_ects, yend = grades_high),
                 color = "green") +
    geom_segment(aes(x = completed_ects, y = current_grade,
                     xend = program_ects, yend = grades_low),
                 color = "red") +
    annotate("polygon",
             x = c(plt_data$completed_ects,
                   plt_data$program_ects,
                   plt_data$program_ects,
                   plt_data$completed_ects),
             y = c(plt_data$current_grade,
                   plt_data$grades_low,
                   plt_data$grades_high,
                   plt_data$current_grade),
             alpha = 0.2) +
    theme_bw() +
    geom_hline(yintercept = 1, color = "blue", linetype = "dashed") +
    labs(title = "Grade range",
         x = "ECTS credits",
         y = "Grade\nAverage",
         caption = stringr::str_wrap("The shaded region represents the range of all possible grade averages that can be achieved based on the current grade average and the number of ECTS credits already completed and the amount remaining to complete. The red line indicates the worst possible scenario i.e. obtaining 5s in all classes while the green line indicates the best possible scenario i.e. obtaining 1s in all classes. The blue dashed line represents the highest passing grade of 1.0 on the German scale.", width = 130
           )) +
    theme(
      plot.title = element_text(hjust = 0.5),
      axis.title = element_text(size = 12),
      axis.title.y = element_text(angle = 0, vjust = 0.5),
      plot.caption = element_text(hjust = 0)
    )

}



