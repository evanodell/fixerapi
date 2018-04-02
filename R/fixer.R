




fixer <- function(base = "EUR", symbols = NULL){

  base_query <- paste0("&base=", base)

  symbols_query <- ifelse(!is.null(symbols),
                          paste0(
                            "&symbols=",
                            paste0(symbols, collapse = ",")
                            ), ""
                          )

  query <- paste0(fixer_url, "latest?access_key=", fixer_api_key(), base_query)


}
