#' NHMRC All Grants.
#'
#' Summary of all grants 2000 - 2015.
#'
#' @source https://www.nhmrc.gov.au/_files_nhmrc/file/grants/dataset/2016/all_grants_2000-2016.xlsx
#' @format Data frame with columns
#' \describe{
#' \item{grant_id}{Grant ID}
#' \item{application_year}{Application year}
#' \item{cia_name}{Chief Investigator A name}
#' \item{grant_sub_type}{Grant subtype}
#' \item{grant_title}{Grant title}
#' \item{administering_institution}{Administering institution}
#' \item{state}{State or territory}
#' \item{sector}{Sector}
#' \item{status}{Status (open or closed)}
#' \item{start_year}{Start year}
#' \item{end_year}{End year}
#' \item{budget_total}{Budget total}
#' \item{broad_research_area}{Broad research area}
#' \item{field_of_research}{Field of research}
#' \item{keywords}{Keywords}
#' \item{media_summary}{Media summary}
#' \item{achievements}{Achievements}
#' \item{expected_future_outcomes}{Expected future outcomes}
#' }
#' @examples
#'   nhmrcAllGrants %>% glimpse()
"nhmrcAllGrants"

