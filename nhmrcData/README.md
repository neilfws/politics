# nhmrcData

This package contains information about the Australian National Health & Medical Research Council funding outcomes, extracted from XLSX/PDF files and converted to tidy format. Install it using this command:

```
devtools::install_github("neilfws/politics", subdir = "nhmrcData")
```

To install the vignette, use the following. Note that the vignette requires `dplyr`, `tidyr`, `stringr`, `ggplot2`, `wordcloud` and `tidytext`.

```
devtools::install_github("neilfws/politics", subdir = "nhmrcData", build_vignettes = TRUE)
```

Then:

```
library(nhmrcData)
```

The package contains the following datasets. No need to use `data(<dataset>)`; just type the dataset name to access its contents.

## All Grants
* `nhmrcAllGrants`: summary of all grants 2000-2015
* `nhmrcApprovals`: compliance reporting of grant outcomes

## Summary tables
* `nhmrcBRA`: outcomes by broad research area
* `nhmrcExpenditure`: total active grants and expenditure by year
* `nhmrcFundingType`: outcomes by funding type
* `nhmrcGrantSubtype`: outcomes by grant subtype
* `nhmrcGrantType`: outcomes by grant type
* `nhmrcInstitute`: outcomes by administering institution
* `nhmrcRegion`: outcomes by state/territory
* `nhmrcSector`: outcomes by sector

## Outcomes by gender
Outcomes by gender data come from several sources. The first is a series of PDF files obtained from the NHMRC website under the [Women in Health Science](https://www.nhmrc.gov.au/research/women-health-science) section, and converted manually to data in CSV format.

* `nhmrcOutcomesGenderBRA`: outcomes by gender and broad research area
* `nhmrcOutcomesGenderFellows`: outcomes by gender and fellowship
* `nhmrcOutcomesGenderPartTime`: outcomes by gender for part-time fellowships
* `nhmrcOutcomesGenderScheme`: outcomes by gender and scheme

The second data source is [this Excel file](https://www.nhmrc.gov.au/_files_nhmrc/file/research/women_in_science/project_grant_funded_rate_gender_new_investigator_and_teaching_load_140218.xlsx). It contains 8 sheets which give rise to the following datasets, for years 2003 - 2013.

The last sheet in the file contains data pertaining to teaching load. It is particularly badly-designed, which limits both its utiity and the data that can be extracted from it.

* `nhmrcOutcomesGenderGrants`: project grants new investigators CI gender
* `nhmrcOutcomesGenderRates`: project grants new investigators funded rates
* `nhmrcOutcomesGenderPostDoc`: project grants new investigators average years postdoc at time of application
* `nhmrcOutcomesGenderRatesBS`: project grants new investigators funding rates basic science
* `nhmrcOutcomesGenderRatesCMS`: project grants new investigators funding rates clinical & medical science
* `nhmrcOutcomesGenderRatesHSR`: project grants new investigators funding rates health science research
* `nhmrcOutcomesGenderRatesPH`: project grants new investigators funding rates public health
* `nhmrcOutcomesGenderTeaching`: project grants CIA Go8 Universities 2010 to 2012 by teaching load 	
