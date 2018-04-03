
act <- Sys.getenv("FIXER_ACT_TYPE")

fixer_url <- ifelse(identical(act, "free") || identical(act, ""),
  "http://data.fixer.io/api/", "https://data.fixer.io/api/"
)
