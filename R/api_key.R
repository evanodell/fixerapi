
#' Fixer API Key
#'
#'
#' @param force If TRUE, resets the API key and requires a
#' new key to be provided.
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
