test_that("conversion from German to US works", {
  expect_vector(convert_to_freedom_units(1:5))
  expect_length(convert_to_freedom_units(1:5), 5)


  expect_equal(convert_to_freedom_units(1), 4)
  expect_equal(convert_to_freedom_units(2), 3)
  expect_equal(convert_to_freedom_units(3), 2)
  expect_equal(convert_to_freedom_units(4), 1)
  expect_equal(convert_to_freedom_units(5), 0)
  expect_equal(convert_to_freedom_units(1:5), 4:0)
})


test_that("conversion from German to custom US functions", {
  suppressWarnings(convert_to_freedom_units(1:5, max_passing_grade = 4, min_passing_grade = 2))
  suppressWarnings(expect_length(convert_to_freedom_units(1:5, max_passing_grade = 4, min_passing_grade = 2), 5))
})

test_that("check function assertions", {
  expect_error(
    convert_to_freedom_units(0),
    "grades must be between 1.0 and 5.0 for the Bavarian formula to work."
  )
  expect_error(
    convert_to_freedom_units(6),
    "grades must be between 1.0 and 5.0 for the Bavarian formula to work."
  )
  expect_error(
    convert_to_freedom_units(1:5, max_passing_grade = 2, min_passing_grade = 4),
    "max_passing_grade must be greater than min_passing_grade"
  )
})

test_that("check warning", {
  expect_warning(convert_to_freedom_units(1:5, max_passing_grade = 3, min_passing_grade = 2), "The maximum passing grade and the minimum passing grade should almost always be 4 and 1, respectively, in the US grading system. Are you sure this should be changed?")
})
