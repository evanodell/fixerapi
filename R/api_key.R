
#' Fixer API Key
#'
#' \href{https://fixer.io}{fixer.io} requires an API key, which is saved as an
#' environmental variable. In interactive mode, using \code{fixer_api_key}
#' will prompt you to enter an API key. You can also use
#' \code{Sys.setenv(FIXER_API_KEY = <key>)} to set the API key.
#'
#' @param force If \code{TRUE}, resets the API key and requires a new key to
#' be provided, even if one already exists. If \code{FALSE} and an API key
#' already exists, that key will be printed to the console. If no key exists,
#' you will be prompted to enter a key regardless of the value of
#' \code{force}. Defaults to \code{FALSE}.
#'
#' @export
fixer_api_key <- function(force = FALSE) {
  env <- Sys.getenv("FIXER_API_KEY")
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set environment variable FIXER_API_KEY to your fixer API key",
      call. = FALSE
    )
    message("Use `Sys.setenv(FIXER_API_KEY = <key>)`")
  }

  message("Couldn't find environment variable FIXER_API_KEY")
  message("Please enter your API key and press enter:")
  key <- readline(": ")

  if (identical(key, "")) {
    Sys.unsetenv("FIXER_API_KEY")
    stop("Fixer API key entry failed", call. = FALSE)
  }

  message("Updating FIXER_API_KEY")
  Sys.setenv(FIXER_API_KEY = key)

  key
}
