context("Check inputs of cubicbs routine")

# Check that lower < upper

test_that("lower bound is smaller than upper bound", {
  expect_error(
    cubicbs(x=runif(20,0,1), lower=5, upper=2, K=20)
  )
})

# Check error when K<=3

test_that("K not large enough", {
  expect_error(
    cubicbs(x=runif(20,0,1), lower=0, upper=2, K=3)
  )
})

