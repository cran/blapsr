context("Check inputs of simcuredata routine")

# Error if wrong cure setting

test_that("cure setting", {
  expect_error(
    simcuredata(n = 300, censor = "Weibull", cure.setting = 3, KapMeier = TRUE)
  )
})
