

base_util <- function(base) {
  act <- Sys.getenv("FIXER_ACT_TYPE")

  if (!identical(act, "free") || identical(act, "")) {
    base_query <- paste0("&base=", base)
  } else {
    base_query <- ""
    warning("Currency base only available on paid plans.")
  }

  base_query
}
