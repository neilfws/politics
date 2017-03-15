#' NHMRC Outcomes Gender PostDoc.
#'
#' NHMRC project grants new investigators average years postdoc at time of application.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{year}{Year}
#' \item{ci}{CI group (CIA, CIB...)}
#' \item{gender}{Gender}
#' \item{stage}{Stage (applied, funded, unfunded or profiles) - profiles = number of applicants}
#' \item{value}{Average years postdoc for stage}
#' }
#' @examples
#'   nhmrcOutcomesGenderPostDoc %>% glimpse()
"nhmrcOutcomesGenderPostDoc"

