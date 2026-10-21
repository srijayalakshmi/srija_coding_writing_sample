# Examining Labour Market Shifts Amidst Changing Business Inflation Expectations

**Replication code and writing sample** for a study of whether Indian workers' industry switching responds to realised macroeconomic conditions or to firms' own elicited inflation and cost expectations.

- **Author:** Srijayalakshmi Venkatesh, MS Economics 2025–27, Ahmedabad University
- **Affiliation (research):** Summer Research Intern, Indian Institute of Management Ahmedabad
- **Supervisor:** Prof. Namrata Chindarkar, JSW School of Public Policy, IIM Ahmedabad
- **Version:** August 18, 2026
- **Contact:** [srijayalakshmi.v@ahduni.edu.in](srijayalakshmi.v@ahduni.edu.in) · [https://sites.google.com/view/srijayalakshmi](https://sites.google.com/view/srijayalakshmi/)

> **Status:** Writing sample. The paper is a correlational analysis, not a causal design.

📄 **Paper (PDF):** [srija_writing_sample.pdf](srija_writing_sample.pdf) → **[srija_writing_sample.pdf]**

---

## Abstract

Firms' subjective macroeconomic expectations diverge from realised conditions and shape pricing and hiring decisions, but whether this expectations channel is empirically distinguishable from the effect of realised shocks, and whether either channel is strong enough to change individual labour mobility, is largely unexplored in India. This paper asks: **do inflationary expectations affect labour mobility and industry switching?**

It combines CMIE's Industry Outlook macro series, wave- and industry-matched to the CMIE Consumer Pyramids Household Survey (CPHS), with the Business Inflation Expectations Survey (BIES) fielded by the Misra Centre for Financial Markets and Economy at IIM Ahmedabad. Results suggest that, on the undirected industry-switching margin, labour reallocation tracks **realised cost shocks more than firms' own expectations** of future costs and inflation. This qualifies, rather than confirms, the more recent macro-expectations literature.

**Keywords:** inflation expectations; labour mobility; industry switching; adaptive expectations; household panel data; India; CMIE CPHS; BIES; fixed-effects linear probability model; informality.

## Key findings

| # | Finding |
|---|---|
| 1 | **Main Sample:** only limited evidence that lagged realised macro conditions predict industry switching once wave fixed effects absorb aggregate shocks (IIP growth is positive in the one-way model but loses significance in the two-way model). |
| 2 | **Leads-and-lags placebo (Main Sample):** led macro terms are significant, so the lagged coefficients are read as descriptive correlations, not causal effects. |
| 3 | **BIES-Manufacturing Sample (NIC 10–33):** lagged WPI input-cost inflation significantly predicts switching; none of the five BIES expectation measures is significant at the 5% level (Q5, CPI expectation, is significant only at 10% in Table 5). |
| 4 | **Leads-and-lags placebo (BIES sample):** led terms are largely insignificant, which offers somewhat more support for a causal reading of the WPI result. |

## Research design

**Outcome:** `INDUSTRY_SWITCH` = 1 if the worker's 2-digit NIC industry differs from the previous wave (waves are roughly four months apart).

**Estimator:** linear probability model with individual fixed effects (`xtreg, fe`); standard errors clustered by individual (`MEM_PANEL_ID`).

**Specifications**

| Eq. | Description | Sample |
|---|---|---|
| (1) | One-way FE: lagged CPI, WPI input cost, industry-matched IIP growth, industry-matched credit growth + controls, broad-industry FE, industry × wave trend, individual FE | Main |
| (2) | Two-way FE: Eq. (1) + wave FE | Main |
| (3) | Lagged BIES measures (Q1 margin balance, Q2 sales balance, Q3 backward cost change, Q4 forward cost expectation, Q5 CPI expectation) vs. lagged CMIE proxies, two-way FE | BIES-Manufacturing |
| (4) | Leads-and-lags placebo test: one-wave lags and leads of macro variables | Main and BIES-Manufacturing |

**Samples**

- *Main Sample:* earning members (`EARNING_MEMBER == 1`) observed in at least two waves.
- *BIES-Manufacturing Sample:* Main Sample restricted to waves with BIES coverage (`has_bies == 1`) and manufacturing workers (NIC divisions 10–33).

## Data

| Source | Description | Use |
|---|---|---|
| CMIE CPHS | Individual-level household panel, re-interviewed every ~4 months (waves) | Employment, NIC industry, demographics |
| CMIE Industry Outlook | CPI inflation, WPI input-cost inflation, industry-matched IIP growth, industry-matched bank credit growth | Realised macro conditions (Set A) |
| BIES (IIMA Misra Centre) | ~8,000 manufacturing firms; cost conditions (Q1–Q3), forward cost expectations (Q4), CPI expectations (Q5); aggregated to wave-level weighted means | Elicited expectations (Set B) |

**The data are proprietary and are not included in this repository.** CMIE data require a licence from [CMIE](https://www.cmie.com). BIES data are subject to the terms of the Misra Centre, IIM Ahmedabad.

**Wave-to-date mapping:** three waves per calendar year; wave 25 = Jan–Apr 2022, wave 28 = Jan–Apr 2023, wave 37 = Jan–Apr 2026. The estimation window is therefore waves **25–37** (Jan 2022 – Apr 2026).

Panel construction and merge code (CPHS × CMIE Industry Outlook × BIES) is a part of this repository → **[data_cleaning.do]**.

To download CMIE data, please log onto CMIE from your institutional ID. NIC data is avaialble freely.

Variable definitions are in Appendix Table 7 of the paper (`MEM_PANEL_ID`, `WAVE_NO`, `EARNING_MEMBER`, `INDUSTRY_SWITCH`, `BROAD_INDUSTRY_NAME`, `INF_CPI`, `WPI_INPUT`, `IIP_INDUSTRY`, `CREDIT_INDUSTRY`, the `L_*` lags, `has_bies`, `NIC_DIV_CODE`, and the `L1_q*` BIES lags).

## Repository structure

```
.
├── README.md
├── .gitignore
├── LICENSE
├── paper/
│   └── srija_writing_sample.pdf
├── code/
├── ├── data_cleaning.do
│   ├── analysis_2.R                  # Figures 1-2 (R)
│   └── analysis_1.do      # Tables 1-6 (Stata)
└── output/
    ├── figures/
    └── tables/
```

## Mapping code to paper

### Figures: `trend_analysis.R`

| Paper | Output file | Description | Path to add |
|---|---|---|---|
| Figure 1 | `Fig_Explanatory_Trends_Facets.png` | Wave-level means of the four macro variables, raw units, one panel each | **[ADD PATH, e.g. `output/figures/`]** |
| Figure 2 | `Fig_Combined_Explanatory_Trends.png` | Same series z-scored and overlaid | **[ADD PATH, e.g. `output/figures/`]** |

### Tables: `analysis_3_writing_sample.do`

Table numbers in the do-file labels differ from the paper's numbering. Use this mapping:

| Paper | Output file | Content | Path to add |
|---|---|---|---|
| Table 1 | `Table1_Summary_Statistics.tex` | Summary statistics, both samples | **[ADD PATH, e.g. `output/tables/`]** |
| Table 2 | `Table2_OneWay_FE_IndustrySwitch.tex` | One-way FE, Main Sample | **[ADD PATH]** |
| Table 3 | `Table3a_TwoWay_FE_IndustrySwitch.tex` | Two-way FE, Main Sample | **[ADD PATH]** |
| Table 4 | `Table3b_LeadsLags_IndustrySwitch.tex` | Leads-and-lags, Main Sample | **[ADD PATH]** |
| Table 5 | `Table4a_BIES_vs_CMIE_IndustrySwitch.tex` | BIES vs. CMIE, manufacturing | **[ADD PATH]** |
| Table 6 | `Table4b_LeadsLags_BIES_IndustrySwitch.tex` | Leads-and-lags, BIES sample | **[ADD PATH]** |

## Requirements

**R (≥ 4.0)**
```r
install.packages(c("data.table", "ggplot2", "scales"))
```

**Stata (≥ 15)**
```stata
ssc install estout, replace   // provides eststo, esttab, estpost
```

## Citation

```
Venkatesh, S. (2026). Examining Labour Market Shifts Amidst Changing Business
Inflation Expectations. Working paper, Ahmedabad University.
https://github.com/<your-username>/<repo-name>
```

## References (selected)

- Akarsu, O., Aktug, E., & Torun, H. (2025). *Inflation expectations and firms' decisions in high inflation: Evidence from a randomized control trial.*
- Candia, B., Coibion, O., & Gorodnichenko, Y. (2023). The macroeconomic expectations of firms. *Handbook of Economic Expectations*, 321–353.
- Coibion, O., Gorodnichenko, Y., & Kumar, S. (2018). How do firms form their expectations? New survey evidence. *American Economic Review*, 108(9), 2671–2713.
- Kumari, G., Gupta, N., & Narayanan, K. (2025). Coping with labor market risk: Formal job loss and earnings dynamics in India. *Economic Modelling*.

Full list in the paper.

## License

Code: MIT License → **[ADD PATH: `LICENSE` file at repo root]**. The data and the paper's text are **not** covered by this licence; data remain subject to the terms of CMIE and the Misra Centre (IIMA).

## Acknowledgements

Prof. Namrata Chindarkar (IIM Ahmedabad) for guidance. Data: CMIE; BIES, Misra Centre for Financial Markets and Economy, IIM Ahmedabad. **[ADD: any funding or additional acknowledgements]**
