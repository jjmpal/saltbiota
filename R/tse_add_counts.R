#'
#'
#' @param
#'
#' @return
#'
#' @export
tse_add_counts <- function(.data, file = "data/FR02_read_counts_table") {
  stopifnot(!missing(.data), file.exists(file))

  df_counts <- readr::read_tsv(file,
                             col_names = c("Barcode", "total_read_count"),
                             show_col_types = FALSE,
                             progress = FALSE)

  new_data <-  tse_meta(.data) %>%
    dplyr::left_join(df_counts, by = "Barcode") %>%
    tibble::column_to_rownames(var = "rownames") %>%
    S4Vectors::DataFrame()
  SummarizedExperiment::colData(.data) <- new_data
  .data
}
