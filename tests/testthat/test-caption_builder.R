
test_that("check caption_builder null", {
  expect_equal(
    caption_builder(
      min_passing_grade = 5,
      max_passing_grade = 1,
      caption_width = 100,
      show_caption = FALSE
    ),
    NULL)
})

test_that("check caption_builder not null", {
  expect_equal(
    caption_builder(
      min_passing_grade = 5,
      max_passing_grade = 1,
      caption_width = 100,
      show_caption = TRUE
    ),
    stringr::str_wrap("The shaded region represents the range of all possible grade averages that can be achieved based on three factors: 1) the current grade average or GPA, 2) the number of ECTS credits already completed, and 3) the amount of remaining ECTS.\n\nThe red line indicates the worst possible scenario i.e. obtaining 5s in all classes while the green line indicates the best possible scenario i.e. obtaining 1s in all classes. The blue dashed line represents the highest passing grade.",
  width = 100)
  )
})


test_that("check caption_builder type", {
  expect_error(
    caption_builder(
      min_passing_grade = "5",
      max_passing_grade = 1,
      caption_width = 100,
      show_caption = TRUE
    ),
    "inputs must be a numeric value"
  )

  expect_error(
    caption_builder(
      min_passing_grade = 5,
      max_passing_grade = "1",
      caption_width = 100,
      show_caption = TRUE
    ),
    "inputs must be a numeric value"
  )

  expect_error(
    caption_builder(
      min_passing_grade = 5,
      max_passing_grade = 1,
      caption_width = "100",
      show_caption = TRUE
    ),
    "inputs must be a numeric value"
  )
})

test_that("check caption_builder logical", {
  expect_error(
    caption_builder(
      min_passing_grade = 5,
      max_passing_grade = 1,
      caption_width = 100,
      show_caption = "TRUE"
    ),
    "show_caption must be a logical value"
  )
})
