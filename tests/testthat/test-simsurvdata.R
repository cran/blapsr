context("Check inputs of simsurvdata routine")

# Check that the Weibull parameters are positive

test_that("a and b are positive", {
  expect_error(
    simsurvdata(a = -2, b = 1, n = 100, betas = c(0.2, 0.5), censperc = 20)
    )
  expect_error(
    simsurvdata(a = 1, b = 0, n = 100, betas = c(0.2, 0.5), censperc = 20)
    )
})

# Check that the betas are within range

test_that("Check that betas are within -1 and 1", {
  expect_error(
    simsurvdata(a = 0.3, b = 1, n = 100, betas = c(-1.3, 0.5), censperc = 20)
  )
  expect_error(
    simsurvdata(a = 1, b = 2, n = 100, betas = c(0.2, 1.5), censperc = 20)
  )
})

# Check that the censoring percentage is correctly specified

test_that("Check that censperc is between 0 and 100", {
  expect_error(
    simsurvdata(a = 0.3, b = 1, n = 100, betas = c(0.3, 0.5), censperc = -2)
  )
  expect_error(
    simsurvdata(a = 1, b = 2, n = 100, betas = c(0.2, 0.8), censperc = 101)
  )
})







