#' NHMRC Expenditure by Broad Research Area.
#'
#' Summary of expenditure by broad research area and year.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/grants/dataset/2015/2._summary_tables_2000_-_2015.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{calendar_year}{Calendar year}
#' \item{basic_research_area}{Basic research area (BRA)}
#' \item{value}{Expenditure for the BRA}
#' }
#' @examples
#'   nhmrcBRA %>% glimpse()
"nhmrcBRA"
