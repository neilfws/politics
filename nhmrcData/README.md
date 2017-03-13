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
* `nhmrcOutcomesGenderBRA`: outcomes by gender and broad research area
* `nhmrcOutcomesGenderFellows`: outcomes by gender and fellowship
* `nhmrcOutcomesGenderPartTime`: outcomes by gender for part-time fellowships
* `nhmrcOutcomesGenderScheme`: outcomes by gender and scheme
