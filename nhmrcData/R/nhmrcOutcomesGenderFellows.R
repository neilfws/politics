#' NHMRC Outcomes Gender Fellow
#'
#' NHMRC funding outcomes by gender for Practitioner, Research and Career Development Fellows by Level.
#'
#' @source 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_women_in_science_140219.pdf
#' @source 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_gender_outcomes_prac_research_cdf_fellows_level_141205.pdf
#' @source 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/your_health/may_2016_update_table_4_2015_gender_outcomes_for_prac_research_and_cdf_by_level.pdf
#' @format Data frame with columns
#' \describe{
#' \item{year}{Year}
#' \item{scheme}{Scheme}
#' \item{level}{Level}
#' \item{gender}{Gender}
#' \item{stage}{Stage (applied or funded)}
#' \item{value}{Amount awarded}
#' }
#' @examples
#'   nhmrcOutcomesGenderFellows %>% glimpse()
"nhmrcOutcomesGenderFellows"

