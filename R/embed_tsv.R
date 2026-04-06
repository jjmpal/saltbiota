#'
#'
#' @param
#'
#' @return
#'
#' @export

embed_tsv <- function(obj, name) {
  if (!knitr::is_latex_output() && !knitr::is_html_output()) {
    return(invisible(NULL))
  }

  stopifnot(!missing(obj), !missing(name))
  tmp <- tempfile(fileext = ".tsv")
  file <- stringr::str_replace_all(name, c(" " = "_", "$" = ".tsv"))
  readr::write_tsv(obj, tmp)
  ret <- xfun::embed_file(tmp, name = file, text = name)
  unlink(tmp)
  ret
}
