
## check if account is free
free_check <- function() {
  if (identical(act, "free") || identical(act, "")) {
    warning("Currency conversion is only available on paid plans")
  }
}

## check if account is pro or higher
time_check <- function() {
  if (identical(act, "free") || identical(act, "") || identical(act, "basic")) {
    warning(
      "Time series conversions are only available on\n",
      "professional, professional plus and enterprise plans"
    )
  }
}


flux_check <- function() {
  if (!identical(act, "plus") || !identical(act, "enterprise")) {
    warning(
      "Currency fluctation is only available on\n",
      "professional plus and enterprise plans"
    )
  }
}
