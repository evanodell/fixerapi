

#' Latest exchange rates
#'
#' @description Returns a tibble with the most recently available currency
#' conversion data available from the Fixer API.
#'
#' @param base The base currency to index other currencies against. Defaults
#' to \code{"EUR"}. Other base currencies are only available on paid plans.
#'
#' @param symbols A character vector of the symbols of currencies to return
#' exchange rates for, or a string for a single currency. Defaults to
#' \code{NULL} and returns all available currencies. See
#' \code{\link{fixer_symbols}} for details on symbol options.
#'
#' @return A tibble with the latest available currency exchange data.
#' @export
#'
#' @examples \dontrun{
#'
#' today <- fixer_latest()
#'
#' today_usd <- fixer_latest(base = "USD")
#'
#' today_symbols <- fixer_latest(base = "USD",
#'                               symbols = c("EUR", "JPY", "CAD"))
#'
#' }

fixer_latest <- function(base = "EUR", symbols = NULL) {
  base_query <- paste0("&base=", base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    fixer_url, "latest?access_key=", fixer_api_key(),
    base_query, symbols_query
  )

  df <- jsonlite::fromJSON(query)

  df <- success_check(df)

  rates <- tibble::enframe(df$rates)

  rates$value <- as.numeric(rates$value)

  rates
}
