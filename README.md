
perccalc
========

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/perccalc)](http://cran.r-project.org/package=perccalc) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/cimentadaj/perccalc?branch=master&svg=true)](https://ci.appveyor.com/project/cimentadaj/perccalc)

Overview
--------

Reardon (2011) introduced a very interesting concept in which he calculates percentile differences from ordered categorical variables. He explains his procedure very much in detail in the appendix of the book chapter but no formal implementation has been yet available on the web. With this package I introduce two functions that apply the procedure.

The package has two main functions:

-   `perc_diff`, for calculating percentile differences
-   `perc_dist`, for calculating scores for all percentiles

Installation
------------

You can install and load the package with these commands:

``` r
devtools::install_github("cimentadaj/perccalc") # for development version
# or
install.packages("perccalc") # for stable version
library(perccalc)
```

Usage
-----

Suppose we have a dataset with one continuous variable and one categorical variable:

``` r
library(tidyverse)

df <-
  tibble(
    continuous = rnorm(100) + 1:100,
    categorical = rep(letters[1:5], each = 20) %>% factor(ordered = TRUE),
    wt = rnorm(100, mean = 5)
  )
```

Note that the categorical variable has to be an ordered factor (this is a requirement of both functions). For example, `perc_diff` calculates percentile differences using both variables.

``` r
perc_diff(df, categorical, continuous, percentiles = c(90, 10))
#> difference         se 
#> 80.1770518  0.2290125
```

You can optionally add weights with the `weights` argument.

``` r
perc_diff(df, categorical, continuous, weights = wt, percentiles = c(90, 10))
#> difference         se 
#> 79.5660193  0.5970977
```

On the other hand, the `perc_dist` (short for percentile distribution) allows you to estimate the score for every percentile.

``` r
perc_dist(df, categorical, continuous) %>%
  head()
#>   percentile estimate  std.error
#> 1          1 1.033228 0.03524072
#> 2          2 2.065759 0.06884538
#> 3          3 3.097595 0.10084844
#> 4          4 4.128739 0.13128434
#> 5          5 5.159192 0.16018757
#> 6          6 6.188957 0.18759263
```

This function also allows the use of weights. For an example with a a real-world dataset, please see the vignette example.

All the intelectual ideas come from Sean Reardon. The R implemention is my own work.

-   Reardon, Sean F. "The widening academic achievement gap between the rich and the poor: New evidence and possible explanations." Whither opportunity (2011): 91-116.
