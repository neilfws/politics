#' NHMRC Outcomes Gender Rates BS.
#'
#' NHMRC project grants new investigators funding rates basic science.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{year}{Year}
#' \item{ci}{CI group (CIA, CIB...)}
#' \item{gender}{Gender}
#' \item{stage}{Stage (applied, funded)}
#' \item{value}{Count for each stage}
#' }
#' @examples
#'   nhmrcOutcomesGenderRatesBS %>% glimpse()
"nhmrcOutcomesGenderRatesBS"

