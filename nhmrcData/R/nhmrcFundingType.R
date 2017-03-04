#' NHMRC Expenditure by Funding Type.
#'
#' Summary of expenditure by funding type and year.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/grants/dataset/2015/2._summary_tables_2000_-_2015.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{calendar_year}{Calendar year}
#' \item{support}{Type of funding}
#' \item{value}{Expenditure for funding type}
#' }
#' @examples
#'   nhmrcFundingType %>% glimpse()
"nhmrcFundingType"
