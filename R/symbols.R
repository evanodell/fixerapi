



#' Currency symbols
#'
#' Returns a tibble with the symbol and name of all currencies available
#' through the Fixer API.
#'
#' @export
fixer_symbols <- function(){

  query <- paste0(fixer_url, "symbols?access_key=", fixer_api_key())

  symbols <- fromJSON(query, flatten = TRUE)

  if(!symbols$success) {

    message(paste0("Error code: ", symbols$error$code))
    message(paste0("Error type: ", symbols$error$type))
    message(symbols$error$info)

    stop(call. = FALSE)

  }

  s <- tibble::enframe(symbols$symbols)

  s$value <- as.character(s$value)

  s

}
