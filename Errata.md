# Errata and verification checklist

Reconciliation of `srija_writing_sample.pdf` (Aug 18, 2026 version) against the replication code (`trend_analysis.R`, `analysis_3_writing_sample.do`). Table numbers below are the **paper's** numbering.

Status key: **A** = fix before sharing (substantive), **B** = fix text to match table, **C** = typo / cross-reference.

## A. Substantive: check the code or the claim

| # | Where in paper | Issue | Suggested action |
|---|---|---|---|
| A1 | §3.2, App. 7.5 vs. Table 5 notes and do-file Part 2 | Text says wave FE are **omitted** from BIES regressions (BIES variables vary only by wave). Do-file and table notes **include** `i.WAVE_NO`. With wave FE, wave-level BIES regressors are collinear and should be dropped, yet Table 5 col. (2) reports coefficients. | Re-run and inspect which BIES terms Stata omits. Either drop wave FE (then say so) or report the omitted terms and change the BIES interpretation. |
| A2 | Do-file, "CMIE_CONTEMP" fill loops (Parts 1 and 2) | `bysort WAVE_NO (v): replace v = v[1]` overwrites every observation in a wave with the **minimum** value of `v` in that wave. For industry-matched series (`IIP_INDUSTRY`, `CREDIT_INDUSTRY`) this removes cross-industry variation. The leads/lags (Tables 4 and 6) are built from these filled variables. | Confirm intent. If the series are meant to stay industry-specific, fill only missing values (`replace v = v[_n-1] if missing(v)` within the correct group). Re-run Tables 4 and 6. |
| A2b | Tables 4 and 6 | `L.Industry-matched bank credit growth` shows `0.000 (.)`, i.e. omitted for collinearity (consistent with A2). Text does not mention it. | Report as omitted or fix A2. |
| A3 | Table 1 | Mean WPI input-cost inflation is 52.5 (Main) and 113.7 (BIES), SD 73.6. Figure 1 wave means for WPI lie roughly between -2 and 30, and the variable is described as YoY %. | Check units/outliers (possible index level or extreme values) and winsorise or re-define. |
| A4 | Table 1 | `BANK_ACC`, `PF_COV`, `HEALTH_INS`, `MOBILE_ACC` all show mean 0.000, SD 0.000. | Check coding/missing values in the panel build. |
| A5 | Table 1, BIES column | BIES variables have N = 187,564 but lagged CMIE variables in the same column have N = 43,137. | Clarify which sample each row uses, or align. |
| A6 | Tables 2, 3 | Both report N = 66,903 and within R² = 0.036 to three decimals, though Table 3 adds wave FE. CPI coefficient moves from -0.058 to -0.006, contradicting "other three change little". | Check Table 3 was actually re-estimated with wave FE. |
| A7 | Table 4 (N = 132,798) and Table 6 (N = 10,671) | Notes say "identical sample to Table 2", but N is far larger than Table 2 (66,903) and Table 6 N exceeds Table 5 col. (1) (7,255). Adding leads should **reduce** N. | Check sample construction around `L1.`/`F1.` and the filled variables. |
| A8 | §1 (last paragraph) | Says the BIES null "is the same for the placebo test as well". Table 6 includes **only CMIE** proxies; there is no BIES leads-and-lags. Also Table 6 lags are all insignificant, so the WPI result does not survive in that specification. | Remove the claim or add a BIES placebo table. |
| A9 | §1 (last paragraph) | "pattern consistent with clean causal, backward looking reading" should read **inconsistent** (the led terms are significant). | Fix wording. |
| A10 | §5.2, Table 5 | Text: "none of the five BIES regressors" is significant. Table 5 shows Q5 with `*` (p < 0.10). Also repeated in §1 and §6. | Say "none at the 5% level; Q5 at 10%". |
| A11 | §3.1 Eq. (1) vs. tables | Eq. (1) lists controls as age, age², education, marital status, bank account. Tables and code also include PF, health insurance, mobile access, relationship and place-of-work dummies. | Update Eq. (1) description. |
| A12 | §1, §6, App. 7.5, Table 1 notes | Window stated as waves **25–39** (Jan 2022 – Apr 2026). With three waves a year, 25–37 spans Jan 2022 – Apr 2026; wave 39 would be Sep–Dec 2026, after the paper date. Tables use 25–37. | Use 25–37 everywhere. |

## B. Text does not match tables

| # | Where | Text says | Table says |
|---|---|---|---|
| B1 | §4, one-way IIP | 0.033 (p < 0.01) | Table 2: 0.035\*\*\* |
| B2 | §4, two-way IIP | "falls from 0.033 to 0.026" | Table 3: coefficient 0.033; **0.026 is the standard error** |
| B3 | §4, Table 4 lagged WPI | -0.06 | -0.006\*\*\* |
| B4 | §5.2, WPI lag in Table 5 | p < 0.05 | -0.001\*\*\* (p < 0.01) |
| B5 | §5.2, IIP in Table 5 | 0.152 | 0.163 |
| B6 | §5.2, Table 5 N | 7,104 and 30,064 | 7,255 and 30,753 |
| B7 | §5.2, Table 5 within R² | 0.066 and 0.005 | 0.099 and 0.008 |
| B8 | §1, sample sizes | 416,343 observations with non-missing lagged macro | Tables 2–3 use 66,903 with no explanation of the drop |

## C. Typos and cross-references

- "Section ??" appears in §3.3 ("causal interpretation from Section ??") and §5.1 ("defined in Section ??"). Intended targets are §4 / §1 sample definitions.
- §3.3, Eq. (4): the lag list names three variables (omits `L_IIP_INDUSTRY`) and the leads are also written `X_{k,i,t-1}`; leads should be `t+1`.
- §4: "shown in raw units in Figure 2" should be **Figure 1**.
- Table 5 note refers to "Section 6.6"; App. 7.5 refers to "Sections 6–7", "Tables 14–15" and "interaction equations of Section 3.2". None exist in this version.
- Figure 1 caption calls the variables "Set A" before Set A is defined (§3).
- Table 8 header says "Continued from previous page" on its first page.
- Row label `oL.Industry-matched…` in Table 4 and `oL.Bank credit…` in Table 6: stray "o" (Stata omitted-variable prefix).
- "forceable" (§4) → "foreseeable"; "seens", "mobilility", "looses" (§1), "atleast".
