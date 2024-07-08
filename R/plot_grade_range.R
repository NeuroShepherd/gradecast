#' Plot grade range
#'
#' @param completed_ects the number of ECTS credits already completed
#' @param current_grade the current grade average
#' @param remaining_ects the number of ECTS credits remaining to complete
#' @param max_passing_grade the best possible grade
#' @param min_passing_grade the worst possible grade
#' @param show_caption whether or not to display the text caption
#' @param caption_width text width for the caption. default 150
#'
#' @return a ggplot2 object
#' @export
#'
#' @importFrom rlang .data
#'
#' @examples
#'
#' # On the German scale
#' plot_grade_range(30, 1.5, 90)
#'
#'
#' # Now the same plot, but on the American scale and converting the grades.
#' # Note the `.` in the `plot_grade_range` function call. This is a placeholder
#' # for the result of the previous function call.
#'
#' convert_to_freedom_units(1.5) %>%
#'   plot_grade_range(30, ., 90, max_passing_grade = 4, min_passing_grade = 1)
#'
plot_grade_range <- function(completed_ects, current_grade, remaining_ects,
                             max_passing_grade = 1, min_passing_grade = 5,
                             show_caption = T, caption_width = 150) {
  program_ects <- completed_ects + remaining_ects

  grades <- calculate_grade_range(
    completed_ects,
    current_grade,
    remaining_ects,
    max_passing_grade = max_passing_grade,
    min_passing_grade = min_passing_grade
  )

  plt_data <- data.frame(
    completed_ects = completed_ects,
    current_grade = current_grade,
    program_ects = program_ects,
    grades_high = grades["best_outcome"],
    grades_low = grades["worst_outcome"]
  )

  ylims <- c(min(c(max_passing_grade, min_passing_grade)), max(c(max_passing_grade, min_passing_grade)))


  caption_text <- caption_builder(
    min_passing_grade = min_passing_grade,
    max_passing_grade = max_passing_grade,
    caption_width = caption_width,
    show_caption = show_caption
  )


  ggplot2::ggplot(data = plt_data) +
    ggplot2::scale_x_continuous(
      limits = c(0, program_ects),
      breaks = seq(0, program_ects, 30)
    ) +
    ggplot2::scale_y_continuous(
      limits = ylims
    ) +
    ggplot2::geom_segment(
      ggplot2::aes(
        x = .data$completed_ects, y = .data$current_grade,
        xend = .data$program_ects, yend = .data$grades_high
      ),
      color = "green"
    ) +
    ggplot2::geom_segment(
      ggplot2::aes(
        x = .data$completed_ects, y = .data$current_grade,
        xend = .data$program_ects, yend = .data$grades_low
      ),
      color = "red"
    ) +
    ggplot2::annotate("polygon",
      x = c(
        plt_data$completed_ects,
        plt_data$program_ects,
        plt_data$program_ects,
        plt_data$completed_ects
      ),
      y = c(
        plt_data$current_grade,
        plt_data$grades_low,
        plt_data$grades_high,
        plt_data$current_grade
      ),
      alpha = 0.2
    ) +
    ggplot2::theme_bw() +
    ggplot2::geom_hline(yintercept = max_passing_grade, color = "blue", linetype = "dashed") +
    ggplot2::labs(
      title = "Grade range",
      x = "ECTS credits",
      y = "Grade\nAverage",
      caption = caption_text
    ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5),
      axis.title = ggplot2::element_text(size = 12),
      axis.title.y = ggplot2::element_text(angle = 0, vjust = 0.5),
      plot.caption = ggplot2::element_text(hjust = 0)
    )
}
