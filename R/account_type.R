

#' Set account type
#'
#' @description Paid accounts have access to additional features.
#' \code{fixerapi} uses this information to activate SSL encryption.
#'
#' @description The \href{https://fixer.io/}{fixer.io} API still checks the
#' account type when receiving requests, so setting you account type here only
#' forces HTTPS instead of HTTP. If you have a paid account but do not set
#' your account status you will not be able to use the HTTPS connection but
#' there will be no other affect on your usage of the API.
#'
#' @param type Your \href{https://fixer.io/}{fixer.io} account type. Accepts
#' one of \code{"free"} or \code{"paid"}.
#'
#' @export
#'
fixer_account_type <- function(type = c("free", "paid")) {

  act_type <- Sys.getenv("FIXER_ACT_TYPE")
  if (identical(act_type, type)) return(act_type)

  if (tolower(type) %in% c("free", "paid") &&
    length(type) == 1) {
    Sys.setenv(FIXER_ACT_TYPE = type)
  } else {
    stop('Please use "free" or "paid".', call. = FALSE)
  }
}
