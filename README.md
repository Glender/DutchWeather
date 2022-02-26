
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DutchWeather

    #> ✓ Setting active project to '/home/glenn/Documents/Github/DutchWeather'

[![](https://img.shields.io/badge/devel%20version-0.0.0.9000-purple.svg)](https://github.com/Glender/DutchWeather)
[![CodeFactor](https://www.codefactor.io/repository/github/rossellhayes/ipa/badge)](https://www.codefactor.io/repository/github/rossellhayes/ipa)
[![](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
[![R build
status](https://github.com/rossellhayes/ipa/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/ipa/actions)
[![](https://codecov.io/gh/rcannood/princurve/branch/master/graph/badge.svg)](https://codecov.io/gh/rcannood/princurve)
[![](https://img.shields.io/github/languages/code-size/Glender/DutchWeather.svg)](https://github.com/Glender/DutchWeather)

The goal of DutchWeather is to provide easy to use functions to download
weather statistics from the KNMI website.

## :arrow\_double\_down: Installation

Assuming the devtools package is installed correctly, you can install
the development version of DutchWeather with:

``` r
# install.packages("devtools")
devtools::install_github("Glender/DutchWeather")
```

## :sunny: :umbrella: :cloud: :eyeglasses: Example

Suppose you want to download some daily weahter statistics for research
purposes:

``` r
library(DutchWeather)
## get daily weather data from the KNMI website
data <- get_daily_zipdata(station_id = 260)

# show bottem rows
tail(data)
#> # A tibble: 6 x 41
#>   `# STN` YYYYMMDD   DDVEC FHVEC    FG   FHX  FHXH   FHN  FHNH   FXX  FXXH    TG
#>     <int> <date>     <int> <int> <int> <int> <int> <int> <int> <int> <int> <int>
#> 1     260 2022-02-20   230    73    80   120    20    30     3   230    20    82
#> 2     260 2022-02-21   275    67    75   100    13    40    22   200     9    65
#> 3     260 2022-02-22   246    41    47    70    13    30     2   140    17    71
#> 4     260 2022-02-23   221    44    47    70    13    20     8   140    15    80
#> 5     260 2022-02-24   226    47    57    90    12    30    20   170    12    62
#> 6     260 2022-02-25   266    35    40    60     5    10    21   140    11    47
#> # … with 29 more variables: TN <int>, TNH <int>, TX <int>, TXH <int>,
#> #   T10N <int>, T10NH <int>, SQ <int>, SP <int>, Q <int>, DR <int>, RH <int>,
#> #   RHX <int>, RHXH <int>, PG <int>, PX <int>, PXH <int>, PN <int>, PNH <int>,
#> #   VVN <int>, VVNH <int>, VVX <int>, VVXH <int>, NG <int>, UG <int>, UX <int>,
#> #   UXH <int>, UN <int>, UNH <int>, EV24 <int>
```

## :speech\_balloon: Help

The documentation of all functions can be accessed by `?<function-name>`
or navigate via the package documentation help page `?DutchDayDummies`.

    # For example:
    ?get_daily_zipdata
