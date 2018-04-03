




#' Latest currency data available
#'
#' Returns a tibble with the most recently available currency conversion data
#' available from the Fixer API
#'
#' @param base The base currency to index other currencies against.
#' Defaults to \code{"EUR"}. Can only be changed with paid plans.
#' @param symbols The symbols of currencies to return. Defaults to \code{NULL}
#' and returns all available currencies. See \code{\link{fixer_symbols}} for
#' details on symbol options.
#' @export
#'

fixer_latest <- function(base = "EUR", symbols = NULL) {
  base_query <- paste0("&base=", base)

  symbols_query <- ifelse(!is.null(symbols),
    paste0(
      "&symbols=",
      paste0(symbols, collapse = ",")
    ), ""
  )

  query <- paste0(fixer_url, "latest?access_key=", fixer_api_key(), base_query)

  df <- jsonlite::fromJSON(query)

  df <- success_check(df)

  rates <- enframe(df$rates)

  rates$value <- as.numeric(rates$value)

  rates

  }
