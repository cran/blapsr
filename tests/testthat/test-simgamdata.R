context("Check inputs of simgamdata routine")

# Check setting is either 1 or 2

test_that("Wrong setting", {
  expect_error(
    simgamdata(setting = 0, n = 150, dist = "poisson", scale = 0.3)
  )
})
