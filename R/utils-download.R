


# generic download function
fixer_download <- function(query) {

  df <- jsonlite::fromJSON(paste0(fixer_url, query))

  df <- success_check(df)

  df

}
