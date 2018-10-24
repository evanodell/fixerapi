

#' Currency symbols
#'
#' Returns a tibble with the symbol and name of all currencies available
#' through the Fixer API.
#'
#' @export
fixer_symbols <- function() {
  query <- paste0(fixer_url, "symbols?access_key=", getOption("fixer.API.key"))

  symbols <- fromJSON(query, flatten = TRUE)

  symbols <- success_check(symbols)

  df <- tibble::enframe(symbols$symbols)

  df$value <- as.character(df$value)

  df
}
