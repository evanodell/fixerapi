

#' Convert currencies
#'
#' @description Convert from one currency to another, on a given date or
#' using the latest available exchange rates.
#'
#' @description Currency conversion is available on all paid plans.
#'
#' @param from Symbol of currency to convert from.
#' @param to Symbol of currency to convert to.
#' @param amount The numeric value of the `from` currency to convert.
#' Defaults to 1, and accepts integers greater than 0 and less than 100000.
#' @param date Optional variable. A date in YYYY-MM-DD format, or any value
#' that can be coerced to YYYY-MM-DD format with `as.Date()`.
#' Defaults to `NULL`, which returns the latest conversion data.
#'
#' @return A list containing the value of the conversion, the exchange rate
#' and the date and time of the currency conversion.
#' @export
#'
#' @examples \dontrun{
#'
#' x <- fixer_convert(from = "GBP", to = "JPY", amount = 25)
#'
#' y <- fixer_convert(from = "GBP", to = "JPY",
#'                    amount = 25, date = "2018-05-05")
#'
#' }

fixer_convert <- function(from, to, amount = 1, date = NULL) {
  if (missing(from) || missing(to)) {
    stop("Values for the `from` and `to` parameters must be included",
      call. = FALSE
    )
  }

  if (as.numeric(amount) >= 100000) {
    stop("The conversion end point only works for values under 100,000.",
      call. = FALSE
    )
  }

  if (as.numeric(amount) <= 0) {
    stop("The conversion end point only works for values greater than 0.",
      call. = FALSE
    )
  }

  date_query <- ifelse(is.null(date), "", paste0("&date=", as.Date(date)))

  query <- paste0(
    "convert?access_key=", getOption("fixer.API.key"),
    "&from=", from, "&to=", to, "&amount=", amount, date_query
  )

  df <- fixer_download(query)

  df$info$timestamp <- as.POSIXct(df$info$timestamp,
    origin = "1970-01-01",
    tz = Sys.timezone()
  )

  df
}
