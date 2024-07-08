

caption_builder <- function(min_passing_grade, max_passing_grade, caption_width = 150, show_caption = TRUE) {

  cap <- glue::glue("The shaded region represents the range of all possible grade averages that can be achieved based on three factors: 1) the current grade average or GPA, 2) the number of ECTS credits already completed, 3) and the amount of remaining ECTS to complete.\n\nThe red line indicates the worst possible scenario i.e. obtaining {min_passing_grade}s in all classes while the green line indicates the best possible scenario i.e. obtaining {max_passing_grade}s in all classes. The blue dashed line represents the highest passing grade, a 1.0 and a 4.0 on the common German and American scales, respectively.") %>%
    stringr::str_wrap(width = caption_width)

  caption_text <- if (show_caption) cap else NULL

  return(caption_text)
}
