library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(janitor)

# 2._summary_tables_2000_-_2015.xlsx
summary_tables_2000_2015 <- "data-raw/excel/2._summary_tables_2000_-_2015.xlsx"

## sheet = 1. EXPENDITURE
nhmrcExpenditure <- summary_tables_2000_2015 %>%
  read_excel(sheet = "1. EXPENDITURE", skip = 5) %>%
  remove_empty_cols() %>%
  slice(1:16) %>%
  rename(calendar_year = `CALENDAR YEAR`, total_expenditure = `TOTAL EXPENDITURE`, active_grants = `# ACTIVE GRANTS`) %>%
  mutate(calendar_year = as.numeric(calendar_year))
save(nhmrcExpenditure, file = "data/nhmrcExpenditure.rda")

## sheet = 2. EXP - MAIN FUNDING TYPE
nhmrcFundingType <- summary_tables_2000_2015 %>%
  read_excel(sheet = "2. EXP - MAIN FUNDING TYPE", skip = 4) %>%
  remove_empty_cols() %>%
  slice(1:16) %>%
  select(calendar_year = `CALENDAR YR`, infrastructure_support = `INFRASTRUCTURE SUPPORT`, people_support = `PEOPLE SUPPORT`, research_support = `RESEARCH SUPPORT`) %>%
  gather(support, value, -calendar_year) %>%
  mutate(support = gsub("_support", "", support), calendar_year = as.numeric(calendar_year))
save(nhmrcFundingType, file = "data/nhmrcFundingType.rda")

## sheet = 3. EXP - GRANT TYPE
nhmrcGrantType <- summary_tables_2000_2015 %>%
  read_excel(sheet = "3. EXP - GRANT TYPE", skip = 3) %>%
  slice(1:23) %>%
  select(1:18) %>%
  rename(main_funding_group = `MAIN FUNDING GROUP`, lower_grant_type = `LOWER GRANT TYPE`) %>%
  fill(main_funding_group) %>%
  gather(year, value, -main_funding_group, -lower_grant_type) %>%
  mutate(year = as.integer(year)) %>%
  select(year, everything())
save(nhmrcGrantType, file = "data/nhmrcGrantType.rda")

## sheet = 4. EXP - GRANT SUB TYPE
nhmrcGrantSubtype <- summary_tables_2000_2015 %>%
  read_excel(sheet = "4. EXP - GRANT SUB TYPE ", skip = 3) %>%
  slice(1:171) %>%
  select(1:19) %>%
  rename(main_funding_group = `MAIN FUNDING GROUP`, lower_grant_type = `LOWER GRANT TYPE`, grant_sub_type = `GRANT SUB TYPE`) %>%
  fill(main_funding_group, lower_grant_type) %>%
  gather(year, value, -main_funding_group, -lower_grant_type, -grant_sub_type) %>%
  mutate(year = as.integer(year)) %>%
  filter(!grepl("Total$", lower_grant_type), !grepl("Total$", grant_sub_type)) %>%
  select(year, everything())
save(nhmrcGrantSubtype, file = "data/nhmrcGrantSubtype.rda")

## sheet = 5. EXP - STATE & TERRITORY
nhmrcRegion <- summary_tables_2000_2015 %>%
  read_excel(sheet = "5. EXP - STATE & TERRITORY", skip = 3) %>%
  slice(1:16) %>%
  select(1:9) %>%
  rename(calendar_year = `CALENDAR YR`) %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(state, value, -calendar_year)
save(nhmrcRegion, file = "data/nhmrcRegion.rda")

## sheet = 6. EXP - SECTOR
nhmrcSector <- summary_tables_2000_2015 %>%
  read_excel(sheet = "6. EXP - SECTOR", skip = 3) %>%
  remove_empty_cols() %>%
  slice(1:16) %>%
  select(1:6) %>%
  rename(calendar_year = `CALENDAR YR`) %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(sector, value, -calendar_year)
save(nhmrcSector, file = "data/nhmrcSector.rda")

## sheet = 7. EXP - BRA
nhmrcBRA <- summary_tables_2000_2015 %>%
  read_excel(sheet = "7. EXP - BRA", skip = 3) %>%
  remove_empty_cols() %>%
  select(2:7) %>%
  slice(1:16) %>%
  rename(calendar_year = `CALENDAR YR`, basic_science = `BASIC SCIENCE`, clinical_medicine_and_science = `CLINICAL MEDICINE AND SCIENCE`,
         health_services_research = `HEALTH SERVICES RESEARCH`, not_applicable = `NOT APPLICABLE`, public_health = `PUBLIC HEALTH`) %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(basic_research_area, value, -calendar_year)
save(nhmrcBRA, file = "data/nhmrcBRA.rda")

## sheet = 8. EXP - ADMIN INST
nhmrcInstitute <- summary_tables_2000_2015 %>%
  read_excel(sheet = "8. EXP - ADMIN INST", skip = 3) %>%
  remove_empty_cols() %>%
  slice(1:155) %>%
  select(1:17) %>%
  gather(year, value, -`ADMINISTERING INSTITUTION`) %>%
  mutate(year = as.integer(year)) %>%
  rename(administering_institution = `ADMINISTERING INSTITUTION`) %>%
  select(year, everything())
save(nhmrcInstitute, file = "data/nhmrcInstitute.rda")


# all_grants_2000_-_2015.xlsx
## sheet = 2000 TO 2015 DATA
all_grants_2000_2015_xls <- "data-raw/excel/all_grants_2000_-_2015.xlsx"
nhmrcAllGrants <- all_grants_2000_2015_xls %>%
  read_excel(sheet = "2000 TO 2015 DATA", skip = 2) %>%
  remove_empty_cols() %>%
  remove_empty_rows() %>%
  select(1:18) %>%
  rename(grant_id = `GRANT ID`, application_year = `APPLICATION YEAR`, cia_name = `CIA NAME`, grant_sub_type = `GRANT SUB TYPE`,
         grant_title = `GRANT TITLE`, administering_institution = `ADMINISTERING INSTITUTION`, state = STATE, sector = SECTOR,
         status = STATUS, start_year = `START YR`, end_year = `END YR`, budget_total = `BUDGET TOTAL`, broad_research_area = `BROAD RESEARCH AREA`,
         field_of_research = `FIELD OF RESEARCH`, keywords = KEYWORDS, media_summary = `MEDIA SUMMARY`, achievements = ACHIEVEMENTS,
         expected_future_outcomes = `EXPECTED FUTURE OUTCOMES`) %>%
  mutate(application_year = as.integer(application_year), start_year = as.integer(start_year), end_year = as.integer(end_year))
save(nhmrcAllGrants, file = "data/nhmrcAllGrants.rda")

# grant_approvals_27-2-17.xlsx
## sheet = All
grant_approvals_27217_xls <- "data-raw/excel/grant_approvals_27-2-17.xlsx"
nhmrcApprovals <- grant_approvals_27217_xls %>%
  read_excel() %>%
  rename(grant_id = `GRANT ID`, portfolio = PORTFOLIO, agency = AGENCY, program_sub_title = `PROGRAM SUB TITLE`, recipient_rao = `RECIPIENT RAO`,
         purpose = PURPOSE, recipient_institution = `RECIPIENT INSTITUTION`, value = VALUE, approval_date = `APPROVAL DATE`,
         grant_term_months = `GRANT TERM MONTHS`, grant_funding_location = `GRANT FUNDING LOCATION`, postcode = POSTCODE) %>%
  mutate(postcode = as.integer(postcode)) %>%
  remove_empty_rows()
save(nhmrcApprovals, file = "data/nhmrcApprovals.rda")


# Outcomes by gender
## project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx
project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218_xlsx <- "data-raw/excel/project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx"
## sheet = GRANT DATA
nhmrcOutcomesGenderGrants <- project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218_xlsx %>%
  read_excel(sheet = "GRANT DATA", col_names = FALSE, skip = 4) %>%
  remove_empty_cols() %>%
  filter(X0 != "Grand Total") %>%
  mutate(year = ifelse(grepl("^C", X0), NA, X0)) %>%
  fill(year) %>%
  mutate(year = as.integer(year)) %>%
  filter(!grepl("^20", X0)) %>%
  select(year, ci = X0, women = X1, men = X4) %>%
  gather(gender, value, -ci, -year)
save(nhmrcOutcomesGenderGrants, file = "data/nhmrcOutcomesGenderGrants.rda")

## sheet = FUNDED RATES
nhmrcOutcomesGenderRates <- project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218_xlsx %>%
  read_excel(sheet = "FUNDED RATES", col_names = FALSE, skip = 4) %>%
  remove_empty_cols() %>%
  filter(X0 != "Grand Total") %>%
  mutate(year = ifelse(grepl("^C", X0), NA, X0)) %>%
  fill(year) %>%
  mutate(year = as.integer(year)) %>%
  filter(!grepl("^20", X0)) %>%
  select(year, ci = X0, women_applied = X1, women_funded = X2, men_applied = X5, men_funded = X6) %>%
  gather(stage, value, -ci, -year) %>%
  separate(stage, into = c("gender", "stage"), sep = "_")
save(nhmrcOutcomesGenderRates, file = "data/nhmrcOutcomesGenderRates.rda")

## sheet = AVERAGE YEARS POST DOC

## sheet = FUNDED RATES - BASIC SCIENCE

## sheet = FUNDED RATES - CLIN MED & SCI

## sheet = FUNDED RATES - H.S.R

## sheet = FUNDED RATES - PUBLIC HEALTH

## sheet = TEACHING LOAD BY GENDER

# PDF files 2012-2015
## funding outcomes by gender for each scheme
## 2012 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/wihs_table_5_140317v2.pdf
## 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/wihs_table_1_140317v2.pdf
## 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_1_funding_outcomes_by_gender_scheme_141205.pdf
## 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_1.pdf

nhmrcOutcomesGenderScheme <- list.files("data-raw/", pattern = "outcomes_gender_scheme*", full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category) %>%
  separate(stage, into = c("gender", "stage"), sep = "_") %>%
  mutate(category = gsub("\\*\\*", "", category))
save(nhmrcOutcomesGenderScheme, file = "data/nhmrcOutcomesGenderScheme.rda")

## additional files for 2013-2015

## broad research area by gender for ECFs and CDFs
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_2_women_in_science_140219.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_2_bra_data_scheme_by_gender_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_2.pdf

nhmrcOutcomesGenderBRA <- list.files("data-raw/", pattern = "outcomes_gender_bra*", full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category) %>%
  separate(stage, into = c("gender", "stage"), sep = "_")
save(nhmrcOutcomesGenderBRA, file = "data/nhmrcOutcomesGenderBRA.rda")

## part time fellowship outcomes by gender
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_3_women_in_science_140218.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_3_part_time_fellowship_outcomes_gender_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_3_0.pdf

nhmrcOutcomesGenderPartTime <- list.files("data-raw/", pattern = "outcomes_gender_part-time*", full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category, -gender)
save(nhmrcOutcomesGenderPartTime, file = "data/nhmrcOutcomesGenderPartTime.rda")

## gender outcomes for practitioner, research and career development fellows by level
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_women_in_science_140219.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_gender_outcomes_prac_research_cdf_fellows_level_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/your_health/may_2016_update_table_4_2015_gender_outcomes_for_prac_research_and_cdf_by_level.pdf

nhmrcOutcomesGenderFellows <- list.files("data-raw/", pattern = "outcomes_gender_fellows*", full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -level, -gender)
save(nhmrcOutcomesGenderFellows, file = "data/nhmrcOutcomesGenderFellows.rda")
