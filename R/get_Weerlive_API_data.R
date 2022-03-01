#' Get real time data from the Weerlive.nl API
#'
#' Don't forget to get your API acces key by visiting http://weerlive.nl/.
#'
#' @param key Int. Your API key
#' @param locatie Character. Your location written in dutch. Default: "Amsterdam"
#' @param base Character.
#'
#' @return
#' @export
get_Weerlive_API_data <- function(
  key,
  locatie="Amsterdam",
  base="https://weerlive.nl/api/json-data-10min.php?key=%1.0f&locatie=%s"
){
  # control correct input
  stopifnot(is.numeric(key) && is.character(locatie))

  # create url to acces the WeerLive.nl API
  url <- sprintf(base, key, locatie)

  # acces API and transform data
  data <- httr::GET(url)
  raw_content <- base::rawToChar(data$content)

  # return as tibble dataframe
  df <- tibble::as_tibble(
    jsonlite::fromJSON(raw_content)$liveweer
  )
  return(df)
}
