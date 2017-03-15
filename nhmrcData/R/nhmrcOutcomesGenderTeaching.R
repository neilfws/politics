#' NHMRC Outcomes Gender Teaching.
#'
#' NHMRC project grants CIA Go8 Universities 2010 to 2012 by teaching load
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{year}{Year}
#' \item{gender}{Gender}
#' \item{teaching}{Teaching load}
#' \item{stage}{Stage (funded, not funded)}
#' \item{value}{Count for each stage}
#' }
#' @examples
#'   nhmrcOutcomesGenderTeaching %>% glimpse()
"nhmrcOutcomesGenderTeaching"

