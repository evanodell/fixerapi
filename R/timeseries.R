
#' Exchange rate time series
#'
#' @param start_date The start date of requested timeseries.
#' @param end_date The end date of requested timeseries.
#' @inheritParams fixer_latest
#'
#' @export
#'
fixer_timeseries <- function(start_date, end_date,
                             base = "EUR", symbols = NULL) {
  if (missing(start_date) || missing(end_date)) {
    stop("Values for `start_date` and `end_date` parameters must be included",
      call. = FALSE
    )
  }

  if(as.numeric(as.Date(end_date) - as.Date(start_date)) > 365) {
    stop("Only 365 dats of data can be returned at one time",
         call. = FALSE
    )
  }

  base_query <- base_util(base)

  symbols_query <- symbols_util(symbols)

  query <- paste0(
    fixer_url, "timeseries?access_key=", fixer_api_key(),
    "&start_date=", start_date, "&end_date=", end_date,
    base_query, symbols_query
  )


}
