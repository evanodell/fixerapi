

#' Set account type
#'
#' Paid accounts have access to additional features. \code{fixerrr} uses this
#' information to activate paid features like SSL encryption and prevent API
#' calls that are not allowed by a users account type.
#'
#' @param type fixer.io account type. Accepts one of \code{"free"},
#' \code{"basic"}, \code{"pro"} or \code{"plus"}.
#'
#' @export
#'
fixer_account_type <- function(type = c("free", "basic", "pro", "plus")) {
  if (tolower(type) %in% c("free", "basic", "pro", "plus") &&
    length(type) == 1) {
    Sys.setenv(FIXER_ACT_TYPE = type)
  } else {
    message('Please select one of "free", "basic", "pro" or "plus".')
  }
}
