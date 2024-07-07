test_that("calculate grade range works", {
  # Test the function with the default top and worst grades
  expect_equal(calculate_grade_range(120, 3.5, 60), c(best_outcome = 8 / 3, worst_outcome = 12 / 3))

  # Test the function with custom top and worst grades
  expect_equal(calculate_grade_range(120, 3.5, 60, 1, 5), c(best_outcome = 8 / 3, worst_outcome = 12 / 3))

  # Test the function with a negative number of completed ECTS
  expect_error(calculate_grade_range(-1, 3.5, 60), "completed_ects must be >= 0")

  # Test the function with a negative number of remaining ECTS
  expect_error(calculate_grade_range(120, 3.5, -1), "remaining_ects must be >= 0")

  # Test the function with a current grade below the top grade
  expect_error(calculate_grade_range(120, 3.5, 60, 4, 5), "current_grade must be between top_grade and worst_grade")

  # Test the function with a current grade above the worst grade
  expect_error(calculate_grade_range(120, 3.5, 60, 1, 3), "current_grade must be between top_grade and worst_grade")
})
