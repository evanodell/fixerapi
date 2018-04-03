

#' Convert currencies
#'
#' Currency conversion is only available on paid plans.
#'
#' @param from Symbol of currency to convert from.
#' @param to Symbol of currency to convert to.
#' @param amount The numeric value of the \code{from} currency to convert.
#' Defaults to 1.
#' @param date Optional variable. A date in YYYY-MM-DD format, or any value
#' that can be coerced to YYYY-MM-DD format with \code{as.Date()}.
#' Defaults to \code{NULL}, which returns the latest conversion data.
#'
#' @return A list containing the value of the conversion and the exchange rate.
#' @export
#'
#' @examples \dontrun{
#'
#' x <- fixer_convert(from = "GBP", to = "JPY", amount = 25)
#'
#' }
#'

fixer_convert <- function(from, to, amount = 1, date = NULL) {
  if (!identical(act, "free") || identical(act, "")) {
    stop("Currency conversion is only available on paid plans", call. = FALSE)
  }

  if (missing(from) || missing(to)) {
    stop("Values for the `from` and `to` parameters must be included",
      call. = FALSE
    )
  }

  date <- ifelse(is.null(date), "", paste0("&date=", as.Date(date)))

  query <- paste0(
    fixer_url, "convert?access_key=", fixer_api_key(),
    "&from", from, "&to", to, "&amount", amount
  )

  df <- jsonlite::fromJSON(query)

  df
}
