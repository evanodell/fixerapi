

#' fixerapi: an R client for the fixer.io currency api
#'
#'
#' @description The \href{https://fixer.io}{fixer.io} API provides real-time
#' exchange rates for 170 currencies, covering 1999 to the present.
#' \href{https://fixer.io}{fixer.io} requires an account and a private key,
#' and most features require a \href{https://fixer.io/product}{paid account}.
#' See the \href{https://fixer.io/documentation}{full API documentation} for
#' more details on account features and pricing.
#'
#'
#' @docType package
#' @name fixerapi
#' @importFrom jsonlite fromJSON
#' @importFrom tibble enframe as.tibble
#' @importFrom tidyr unnest_
NULL

# Checking for API key on package load
.onLoad <- function(libname, pkgname) {
  if (is.null(getOption("fixer.API.key"))) {
    key <- Sys.getenv("FIXER_API_KEY")
    if (key != "") options("fixer.API.key" = key)
  }

  act_type <- Sys.getenv("FIXER_ACT_TYPE")
  if (tolower(act_type) %in% c("free", "paid")){
    Sys.setenv(FIXER_ACT_TYPE = act_type)
  }

  invisible()
}
