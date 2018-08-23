

date_check <- function(start_date, end_date) {
  if (missing(start_date) || missing(end_date)) {
    stop("Values for `start_date` and `end_date` parameters must be included",
      call. = FALSE
    )
  }

  if (as.numeric(as.Date(end_date) - as.Date(start_date)) > 365) {
    stop("Only 365 days of data can be returned at one time",
      call. = FALSE
    )
  }

  date_query <- paste0("&start_date=", as.Date(start_date),
                       "&end_date=", as.Date(end_date))

  date_query
}
