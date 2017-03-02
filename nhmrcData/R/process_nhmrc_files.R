library(readxl)
library(readr)
library(dplyr)
library(tidyr)

# 2._summary_tables_2000_-_2015.xlsx
xls <- "../../data/2._summary_tables_2000_-_2015.xlsx"
## sheet = 1. EXPENDITURE
summary_tables_2000_2015_sheet1 <- read_excel(xls, sheet = "1. EXPENDITURE", skip = 5)
summary_tables_2000_2015_sheet1 <- summary_tables_2000_2015_sheet1[1:16, 1:3]
colnames(summary_tables_2000_2015_sheet1) <- c("calendar_year", "total_expenditure", "active_grants")
summary_tables_2000_2015_sheet1 <- summary_tables_2000_2015_sheet1 %>% 
  mutate(calendar_year = as.integer(calendar_year))
# now save rda + csv
grant_approvals_15_2_17 <- read_excel("~/Dropbox/projects/github_projects/politics/AusResearch/nhmrc/data/grant_approvals_15-2-17.xlsx")


## sheet = 2. EXP - MAIN FUNDING TYPE
summary_tables_2000_2015_sheet2 <- read_excel(xls, sheet = "2. EXP - MAIN FUNDING TYPE", skip = 4)
summary_tables_2000_2015_sheet2 <- summary_tables_2000_2015_sheet2[1:16, 1:4]
colnames(summary_tables_2000_2015_sheet2) <- c("calendar_year", "infrastructure_support", "people_support", "research_support")
summary_tables_2000_2015_sheet2 <- summary_tables_2000_2015_sheet2 %>%
  mutate(calendar_year = as.integer(calendar_year))
summary_tables_2000_2015_sheet2 <- summary_tables_2000_2015_sheet2 %>% 
  gather(support, value, -calendar_year) %>% 
  mutate(support = gsub("_support", "", support))
# now save rda + csv


## sheet = 3. EXP - GRANT TYPE
summary_tables_2000_2015_sheet3 <- read_excel(xls, sheet = "3. EXP - GRANT TYPE", skip = 3)
summary_tables_2000_2015_sheet3 <- summary_tables_2000_2015_sheet3[1:23, 1:18]
summary_tables_2000_2015_sheet3 <- summary_tables_2000_2015_sheet3 %>%
  rename(main_funding_group = `MAIN FUNDING GROUP`, lower_grant_type = `LOWER GRANT TYPE`) %>%
  fill(main_funding_group) %>%
  gather(year, value, -main_funding_group, -lower_grant_type) %>%
  mutate(year = as.integer(year))
# now save rda + csv


## sheet = 4. EXP - GRANT SUB TYPE
summary_tables_2000_2015_sheet4 <- read_excel(xls, sheet = "4. EXP - GRANT SUB TYPE ", skip = 3)
summary_tables_2000_2015_sheet4 <- summary_tables_2000_2015_sheet4[1:171, 1:19]
summary_tables_2000_2015_sheet4 <- summary_tables_2000_2015_sheet4 %>%
  rename(main_funding_group = `MAIN FUNDING GROUP`, lower_grant_type = `LOWER GRANT TYPE`, grant_sub_type = `GRANT SUB TYPE`) %>%
  fill(main_funding_group, lower_grant_type) %>%
  gather(year, value, -main_funding_group, -lower_grant_type, -grant_sub_type) %>%
  mutate(year = as.integer(year)) %>%
  filter(!grepl("Total$", lower_grant_type), !grepl("Total$", grant_sub_type))
# now save rda + csv


## sheet = 5. EXP - STATE & TERRITORY
summary_tables_2000_2015_sheet5 <- read_excel(xls, sheet = "5. EXP - STATE & TERRITORY", skip = 3)
summary_tables_2000_2015_sheet5 <- summary_tables_2000_2015_sheet5[1:16, 1:9]
colnames(summary_tables_2000_2015_sheet5)[1] <- "calendar_year"
summary_tables_2000_2015_sheet5 <- summary_tables_2000_2015_sheet5 %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(state, value, -calendar_year)
# now save rda + csv


## sheet = 6. EXP - SECTOR
summary_tables_2000_2015_sheet6 <- read_excel(xls, sheet = "6. EXP - SECTOR", skip = 3)
summary_tables_2000_2015_sheet6 <- summary_tables_2000_2015_sheet6[1:16, 2:7]
colnames(summary_tables_2000_2015_sheet6)[1] <- "calendar_year"
summary_tables_2000_2015_sheet6 <- summary_tables_2000_2015_sheet6 %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(sector, value, -calendar_year)
# now save rda + csv


## sheet = 7. EXP - BRA
summary_tables_2000_2015_sheet7 <- read_excel(xls, sheet = "7. EXP - BRA", skip = 3)
summary_tables_2000_2015_sheet7 <- summary_tables_2000_2015_sheet7[1:16, 2:7]
colnames(summary_tables_2000_2015_sheet7) <- c("calendar_year", "basic_science", "clinical_medicine_and_science", "health_services_research", "not_applicable", "public_health")
summary_tables_2000_2015_sheet7 <- summary_tables_2000_2015_sheet7 %>%
  mutate(calendar_year = as.integer(calendar_year)) %>%
  gather(basic_research_area, value, -calendar_year)
# now save rda + csv


## sheet = 8. EXP - ADMIN INST
summary_tables_2000_2015_sheet8 <- read_excel(xls, sheet = "8. EXP - ADMIN INST", skip = 3)
summary_tables_2000_2015_sheet8 <- summary_tables_2000_2015_sheet8[1:155, 1:17]
summary_tables_2000_2015_sheet8 <- summary_tables_2000_2015_sheet8 %>%
  gather(year, value, -`ADMINISTERING INSTITUTION`) %>%
  mutate(year = as.integer(year)) %>%
  rename(administering_institution = `ADMINISTERING INSTITUTION`)
# now save rda + csv


# all_grants_2000_-_2015.xlsx
## sheet = 2000 TO 2015 DATA
all_grants_xls <- "../../data/all_grants_2000_-_2015.xlsx"
all_grants_2000_2015 <- read_excel(all_grants_xls, sheet = "2000 TO 2015 DATA", skip = 2)
all_grants_2000_2015 <- all_grants_2000_2015[, 1:18]
all_grants_2000_2015 <- all_grants_2000_2015[1:(nrow(all_grants_2000_2015)-1), ]
all_grants_2000_2015 <- all_grants_2000_2015 %>%
  rename(grant_id = `GRANT ID`, application_year = `APPLICATION YEAR`, cia_name = `CIA NAME`, grant_sub_type = `GRANT SUB TYPE`,
         grant_title = `GRANT TITLE`, administering_institution = `ADMINISTERING INSTITUTION`, state = STATE, sector = SECTOR,
         status = STATUS, start_year = `START YR`, end_year = `END YR`, budget_total = `BUDGET TOTAL`, broad_research_area = `BROAD RESEARCH AREA`,
         field_of_research = `FIELD OF RESEARCH`, keywords = KEYWORDS, media_summary = `MEDIA SUMMARY`, achievements = ACHIEVEMENTS,
         expected_future_outcomes = `EXPECTED FUTURE OUTCOMES`) %>%
  mutate(application_year = as.integer(application_year), start_year = as.integer(start_year), end_year = as.integer(end_year))
# now save rda + csv


# grant_approvals_15-2-17.xlsx
## sheet = All
grant_approvals_xls <- "../../data/grant_approvals_15-2-17.xlsx"
grant_approvals_15_2_17 <- read_excel(grant_approvals_xls)
grant_approvals_15_2_17 <- grant_approvals_15_2_17 %>%
  rename(grant_id = `GRANT ID`, portfolio = PORTFOLIO, agency = AGENCY, program_sub_title = `PROGRAM SUB TITLE`, recipient_rao = `RECIPIENT RAO`,
         purpose = PURPOSE, recipient_institution = `RECIPIENT INSTITUTION`, value = VALUE, approval_date = `APPROVAL DATE`,
         grant_term_months = `GRANT TERM MONTHS`, grant_funding_location = `GRANT FUNDING LOCATION`, postcode = POSTCODE) %>%
  mutate(postcode = as.integer(postcode)) %>%
  na.omit()
# now save rda + csv


# PDF files 2012-2015
## funding outcomes by gender for each scheme
## 2012 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/wihs_table_5_140317v2.pdf
## 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/wihs_table_1_140317v2.pdf
## 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_1_funding_outcomes_by_gender_scheme_141205.pdf
## 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_1.pdf

files <- list.files("~/Dropbox/projects/github_projects/politics/AusResearch/nhmrc/data/", pattern = "outcomes_gender_scheme*", full.names = TRUE)
outcomes <- lapply(files, read_csv) %>% 
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category) %>%
  separate(stage, into = c("gender", "stage"), sep = "_") %>%
  mutate(category = gsub("\\*\\*", "", category))
# now save rda + csv


## additional files for 2013-2015

## broad research area by gender for ECFs and CDFs
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_2_women_in_science_140219.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_2_bra_data_scheme_by_gender_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_2.pdf

files <- list.files("~/Dropbox/projects/github_projects/politics/AusResearch/nhmrc/data/", pattern = "outcomes_gender_bra*", full.names = TRUE)
outcomes <- lapply(files, read_csv) %>% 
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category) %>%
  separate(stage, into = c("gender", "stage"), sep = "_")
# now save rda + csv


## part time fellowship outcomes by gender
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_3_women_in_science_140218.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_3_part_time_fellowship_outcomes_gender_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/webchange_wihs_2015_outcomes_by_gender_table_3_0.pdf

files <- list.files("~/Dropbox/projects/github_projects/politics/AusResearch/nhmrc/data/", pattern = "outcomes_gender_part-time*", full.names = TRUE)
outcomes <- lapply(files, read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -category, -gender)
# now save rda + csv

## gender outcomes for practitioner, research and career development fellows by level
### 2013 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_women_in_science_140219.pdf
### 2014 https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/table_4_gender_outcomes_prac_research_cdf_fellows_level_141205.pdf
### 2015 https://www.nhmrc.gov.au/_files_nhmrc/file/your_health/may_2016_update_table_4_2015_gender_outcomes_for_prac_research_and_cdf_by_level.pdf

files <- list.files("~/Dropbox/projects/github_projects/politics/AusResearch/nhmrc/data/", pattern = "outcomes_gender_fellows*", full.names = TRUE)
outcomes <- lapply(files, read_csv) %>%
  bind_rows() %>%
  gather(stage, value, -year, -scheme, -level, -gender)
# now save rda + csv
