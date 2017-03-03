#' NHMRC Expenditure by Grant Subtype.
#'
#' Summary of expenditure by grant subtype and year.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/grants/dataset/2015/2._summary_tables_2000_-_2015.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{year}{Calendar year}
#' \item{main_funding_group}{Type of funding}
#' \item{lower_grant_type}{Grant type}
#' \item{grant_sub_type}{Grant subtype}
#' \item{value}{Expenditure for grant subtype}
#' }
#' @examples
#'   nhmrcGrantSubtype
"nhmrcGrantSubtype"
