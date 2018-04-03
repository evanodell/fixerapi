

symbols_util <- function(symbols) {
  ifelse(!is.null(symbols),
    paste0(
      "&symbols=",
      paste0(symbols, collapse = ",")
    ), ""
  )
}
