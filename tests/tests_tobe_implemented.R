data_model <- tibble(
  continuous = rnorm(100) + 1:100,
  categorical = factor(rep(letters[1:5], each = 20), ordered = TRUE)
)

perc_diff(data_model, categorical, continuous)
perc_calculator(data_model, categorical, continuous)


data_model <- tibble(
  continuous = rnorm(100) + 1:100,
  categorical = factor(rep(letters[1:4], each = 25), ordered = TRUE)
)

perc_diff(data_model, categorical, continuous)
perc_calculator(data_model, categorical, continuous)

data_model <- smoking_data
categorical_var <- "smoke"
continuous_var <- "pulse_rate"
weights <- NULL

perc_diff(data_model, smoke, pulse_rate)
perc_calculator(data_model, smoke, pulse_rate)

mtcars %>%
  mutate(gear = factor(gear, ordered = TRUE)) %>%
  as_tibble() %>%
  perc_diff(gear, drat)
