
#' Fixer API Key
#'
#' [fixer.io](https://fixer.io/) requires an API key, which is saved as an
#' environmental variable. In interactive mode, using `fixer_api_key`
#' will prompt you to enter an API key. You can also use
#' `Sys.setenv(FIXER_API_KEY = <key>)` to set the API key.
#'
#' By default `fixerapi` will look for the environment variable
#'   `FIXER_API_KEY` when the package is loaded.
#'
#' @param force If `TRUE`, resets the API key and requires a new key to
#' be provided, even if one already exists. If `FALSE` and an API key
#' already exists, that key will be printed to the console. If no key exists,
#' you will be prompted to enter a key regardless of the value of
#' `force`. Defaults to `FALSE`.
#'
#' @export
fixer_api_key <- function(force = FALSE) {
  if (!force) {
    key <- Sys.getenv("FIXER_API_KEY")
    if (key != "") {
      #message("Updating FIXER_API_KEY environment variable...")
      options("fixer.API.key" = key)
      print(key)
    } else {
      warning("Couldn't find environment variable 'FIXER_API_KEY'")
    }
  } else {

  if (interactive()) {
    key <- readline("Please enter your API key and press enter: ")
  } else {
    cat("Please enter your API key and press enter: ")
    key <- readLines(con = "stdin", n = 1)
  }

  message("Couldn't find environment variable FIXER_API_KEY")
  message("Please enter your API key and press enter:")
  key <- readline(": ")

  if (identical(key, "")) {
    stop("Fixer API key entry failed", call. = FALSE)
  }

  message("Updating FIXER_API_KEY environment variable...")
  options("fixer.API.key" = key)
  invisible()

  }
}



