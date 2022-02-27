test_that("does function get_hourly_zipdata work?", {

  # retrieve some data from
  df <- get_hourly_zipdata()

  # is it a dataframe?
  expect_true(is.data.frame(df))

  # correct number of cols?
  nr_of_cols <- length(colnames(df))
  expect_equal(25, nr_of_cols)

  # is the column encoded correctly?
  expect_true(lubridate::is.Date(df$YYYYMMDD))

})

