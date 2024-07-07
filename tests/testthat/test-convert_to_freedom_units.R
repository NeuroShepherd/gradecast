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
  expect_vector(convert_to_freedom_units(1:5, max_passing_grade = 4, min_passing_grade = 2))
  expect_length(convert_to_freedom_units(1:5, max_passing_grade = 4, min_passing_grade = 2), 5)
})
