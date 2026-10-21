clear all
set more off
macro drop _all

global PANEL    "D:\Srijayalakshmi\WORK\SIP 2026\Panels"
global TEX_OUT  "D:\Srijayalakshmi\STUDY\PhD 2027\Writing Sample\Analysis\Tables_TEX"
cap mkdir "$TEX_OUT"

local controls_note "Individual controls (estimated, not reported): AGE_YRS (age, years), AGE2 (age squared), EDU_NUM (education, 0=illiterate to 9=postgraduate), MARRIED (currently married), BANK_ACC (has bank account), PF_COV (provident fund coverage), HEALTH_INS (health insurance), MOBILE_ACC (mobile phone access), RELATION_NUM (relationship-to-household-head dummies), WORK_PLACE_NUM (place-of-work dummies). Source: CMIE CPHS."

local sample_period_note "Sample period: CPHS waves 25-37 (approx. January 2022 - April 2026), the BIES coverage window; CMIE macro series and CPHS employment records are matched by wave."

**# PART 1: MAIN SAMPLE -- INDUSTRY SWITCH ON LAGGED CMIE MACRO VARS

use "$PANEL/Analysis_Panel.dta", clear

label var INF_CPI        "CPI inflation, YoY \%"
label var WPI_INPUT      "WPI input-cost inflation, YoY \%"
label var IIP_INDUSTRY   "Industry-matched IIP growth, YoY \%"
label var CREDIT_INDUSTRY "Industry-matched bank credit growth, YoY \%"
label var INDUSTRY_SWITCH  "Switched 2-digit NIC industry vs. previous wave (=1/0)"
label var L_INF_CPI        "CPI inflation, YoY \%, 1-wave lag"
label var L_WPI_INPUT      "WPI input-cost inflation, YoY \%, 1-wave lag"
label var L_IIP_INDUSTRY   "Industry-matched IIP growth, YoY \%, 1-wave lag"
label var L_CREDIT_INDUSTRY "Industry-matched bank credit growth, YoY \%, 1-wave lag"
label var AGE_YRS          "Age (years)"
label var AGE2              "Age squared"
label var EDU_NUM          "Education (0=illiterate ... 9=postgraduate)"
label var MARRIED          "Currently married (=1/0)"
label var BANK_ACC         "Has bank account (=1/0)"
label var PF_COV           "Provident fund coverage (=1/0)"
label var HEALTH_INS       "Health insurance coverage (=1/0)"
label var MOBILE_ACC       "Mobile phone access (=1/0)"

xtset MEM_PANEL_ID WAVE_NO, delta(1)

local required_vars1 INDUSTRY_SWITCH L_INF_CPI L_WPI_INPUT L_IIP_INDUSTRY L_CREDIT_INDUSTRY BROAD_INDUSTRY_NAME MEM_PANEL_ID WAVE_NO EARNING_MEMBER AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC RELATION_NUM WORK_PLACE_NUM // Sanity check: required variables present

foreach v of local required_vars1 {
    cap confirm variable `v'
    if _rc != 0 di as error "MISSING VARIABLE: `v' -- check Analysis_Panel.dta"
}

keep if EARNING_MEMBER == 1 // earning members observed in $>=2$ waves (needed for individual FE and for INDUSTRY_SWITCH to be defined at all
count
di as text "Rows after EARNING_MEMBER==1: " r(N)

global CMIE_CONTEMP "INF_CPI WPI_INPUT IIP_INDUSTRY CREDIT_INDUSTRY"
gsort WAVE_NO
foreach v of global CMIE_CONTEMP {
    bysort WAVE_NO (`v'): replace `v' = `v'[1]
    replace `v' = `v'[_n-1] if missing(`v') & _n > 1
}

gsort MEM_PANEL_ID WAVE_NO
foreach v in EDU_NUM BANK_ACC PF_COV HEALTH_INS MOBILE_ACC MARRIED {
    by MEM_PANEL_ID: replace `v' = `v'[_n-1] if missing(`v') & _n > 1
    by MEM_PANEL_ID: replace `v' = `v'[_n+1] if missing(`v')
}

sort MEM_PANEL_ID WAVE_NO
xtset MEM_PANEL_ID WAVE_NO, delta(1)

bysort MEM_PANEL_ID: gen _nobs = _N
keep if _nobs >= 2
drop _nobs
count
di as text "Rows after requiring >=2 waves per individual: " r(N)

count if !missing(INDUSTRY_SWITCH)
di as text "Rows with non-missing INDUSTRY_SWITCH: " r(N)

cap drop BROAD_INDUSTRY_ENC
encode BROAD_INDUSTRY_NAME, gen(BROAD_INDUSTRY_ENC)
label var BROAD_INDUSTRY_ENC "Broad industry (encoded): Agriculture / Manufacturing / Tangible Services / Intangible Services"

global CMIE_CONTEMP "INF_CPI WPI_INPUT IIP_INDUSTRY CREDIT_INDUSTRY"
global CMIE_L1      "L_INF_CPI L_WPI_INPUT L_IIP_INDUSTRY L_CREDIT_INDUSTRY"
global CONTROLS     "AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC i.RELATION_NUM i.WORK_PLACE_NUM"
global IND_FE       "i.BROAD_INDUSTRY_ENC"
global IND_TREND    "i.BROAD_INDUSTRY_ENC#c.WAVE_NO"
local industry_note "Industry FE (BROAD_INDUSTRY_NAME, 4 categories: Agriculture, Manufacturing, Tangible Services, Intangible Services) and an industry x wave linear trend (BROAD_INDUSTRY_NAME # continuous WAVE_NO) are included but not reported."

eststo main_sum: estpost summarize INDUSTRY_SWITCH $CMIE_L1 AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC // Summary statistics -- stored, exported later together with the BIES-sample stats

**# TABLE 2: ONE-WAY FE (INDIVIDUAL FE + INDUSTRY FE)

quietly xtreg INDUSTRY_SWITCH $CMIE_L1 $IND_FE $IND_TREND $CONTROLS, fe vce(cluster MEM_PANEL_ID)
estimates store ow_l1

esttab ow_l1 using "$TEX_OUT/Table2_OneWay_FE_IndustrySwitch.tex", replace label booktabs star(* 0.10 ** 0.05 *** 0.01) b(3) se(3) keep($CMIE_L1) order($CMIE_L1) nocons mtitles("1-Period Lag") title("One-Way Fixed-Effects LPM: Industry Switching on Lagged CMIE Macro Variables\label{tab:table2_oneway_indswitch}") stats(N r2_w, fmt(%12.0fc %6.3f) labels("Observations" "Within \$R^2\$")) addnotes("Sample: Main Sample, earning members (EARNING_MEMBER=1) observed in $>=2$ consecutive waves." "`sample_period_note'" "Dependent variable: INDUSTRY_SWITCH (=1 if 2-digit NIC industry differs from the prior wave)." "Estimator: linear probability model (LPM), individual fixed effects (xtreg, fe), one-way -- Individual FE only, no wave FE." "`industry_note'" "`controls_note'" "Regressors are 1-wave lags of CMIE Industry Outlook series (L_INF_CPI, L_WPI_INPUT, L_IIP_INDUSTRY, L_CREDIT_INDUSTRY); contemporaneous (unlagged) macro values are excluded by design." "Standard errors clustered at the individual level (MEM_PANEL_ID) in parentheses.") nogaps compress

**# TABLE 3A: TWO-WAY FE (INDIVIDUAL FE + WAVE FE + INDUSTRY FE)

quietly xtreg INDUSTRY_SWITCH $CMIE_L1 $IND_FE $IND_TREND i.WAVE_NO $CONTROLS, fe vce(cluster MEM_PANEL_ID)
estimates store tw_l1

esttab tw_l1 using "$TEX_OUT/Table3a_TwoWay_FE_IndustrySwitch.tex", replace label booktabs star(* 0.10 ** 0.05 *** 0.01) b(3) se(3) keep($CMIE_L1) order($CMIE_L1) nocons indicate("Wave Fixed Effects = *.WAVE_NO") mtitles("1-Period Lag") title("Two-Way Fixed-Effects LPM: Industry Switching on Lagged CMIE Macro Variables\label{tab:table3a_twoway_indswitch}") stats(N r2_w, fmt(%12.0fc %6.3f) labels("Observations" "Within $R^2$")) addnotes("Sample: Main Sample, earning members observed in $>=2$ consecutive waves; identical sample to Table 2." "`sample_period_note'" "Dependent variable: INDUSTRY_SWITCH." "Estimator: LPM, individual and wave fixed effects (xtreg, fe, plus i.WAVE_NO), two-way." "Identification of the four macro coefficients comes from cross-industry variation in macro conditions within a wave, net of the industry-specific linear trend, since wave FE absorb any shock common to all industries in a wave." "`industry_note'" "`controls_note'" "Regressors are 1-wave lags of CMIE Industry Outlook series; contemporaneous values excluded." "Standard errors clustered at the individual level (MEM_PANEL_ID) in parentheses.") nogaps compress

**# TABLE 3B: LEADS-AND-LAGS TEST (DYNAMIC TIME-SERIES LAGS & LEADS)

* Uses L1. (lag) and F1. (lead) dynamically on contemporaneous macro values
quietly xtreg INDUSTRY_SWITCH L1.($CMIE_CONTEMP) F1.($CMIE_CONTEMP) $IND_FE $IND_TREND i.WAVE_NO $CONTROLS, fe vce(cluster MEM_PANEL_ID)
estimates store leadlag_l1

esttab leadlag_l1 using "$TEX_OUT/Table3b_LeadsLags_IndustrySwitch.tex", replace label booktabs star(* 0.10 ** 0.05 *** 0.01) b(3) se(3) nocons indicate("Controls = AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC" "Industry FE = *.BROAD_INDUSTRY_ENC" "Industry x Wave Trend = *.BROAD_INDUSTRY_ENC#c.WAVE_NO" "Relationship-to-HOH FE = *.RELATION_NUM" "Place-of-Work FE = *.WORK_PLACE_NUM" "Wave Fixed Effects = *.WAVE_NO") mtitles("Lag + Lead") title("Leads-and-Lags Test: Industry Switching on Lagged and Led CMIE Macro Variables (Two-Way FE)\label{tab:table3b_leadlag}") stats(N r2_w, fmt(%12.0fc %6.3f) labels("Observations" "Within $R^2$")) addnotes("Sample: Main Sample, earning members observed in $>=2$ consecutive waves; identical sample to Table 2." "`sample_period_note'" "Dependent variable: INDUSTRY_SWITCH." "Estimator: LPM, individual and wave fixed effects (xtreg, fe, plus i.WAVE_NO), two-way." "Regressors include both 1-wave lags (L1.) and 1-wave leads (F1.) of contemporaneous CMIE Industry Outlook series to test for pre-trends and dynamic impacts." "`industry_note'" "`controls_note'" "Standard errors clustered at the individual level (MEM_PANEL_ID) in parentheses.") nogaps compress


**# PART 2: BIES vs. CMIE -- HEAD-TO-HEAD ON INDUSTRY SWITCH

use "$PANEL/CPHS_BIES_comparison.dta", clear
count

xtset MEM_PANEL_ID WAVE_NO, delta(1)

local required_vars2 INDUSTRY_SWITCH has_bies NIC_DIV_CODE EARNING_MEMBER L_INF_CPI L_WPI_INPUT L_IIP_INDUSTRY L_CREDIT_INDUSTRY L1_q1_net_balance L1_q2_net_balance L1_q3_wtd_mean L1_q4_wtd_mean L1_q5_wtd_mean

foreach v of local required_vars2 {
    cap confirm variable `v'
    if _rc != 0 di as error "MISSING VARIABLE: `v' -- check CPHS_BIES_comparison.dta"
}

keep if has_bies == 1
keep if NIC_DIV_CODE >= 10 & NIC_DIV_CODE <= 33
keep if EARNING_MEMBER == 1

bysort MEM_PANEL_ID: gen _nobs = _N
keep if _nobs >= 2
drop _nobs

* Propagate macro variables across waves in the BIES sample
gsort WAVE_NO
foreach v of global CMIE_CONTEMP {
    bysort WAVE_NO (`v'): replace `v' = `v'[1]
    replace `v' = `v'[_n-1] if missing(`v') & _n > 1
}

* Fill demographic controls in the BIES sample
gsort MEM_PANEL_ID WAVE_NO
foreach v in EDU_NUM BANK_ACC PF_COV HEALTH_INS MOBILE_ACC MARRIED {
    by MEM_PANEL_ID: replace `v' = `v'[_n-1] if missing(`v') & _n > 1
    by MEM_PANEL_ID: replace `v' = `v'[_n+1] if missing(`v')
}

* Re-establish panel structure
sort MEM_PANEL_ID WAVE_NO
xtset MEM_PANEL_ID WAVE_NO, delta(1)

bysort MEM_PANEL_ID: gen _nobs = _N
keep if _nobs >= 2
drop _nobs
count
di as text "Rows after requiring >=2 waves per individual: " r(N)

global CMIE_SUBS_L1    "L_CREDIT_INDUSTRY L_IIP_INDUSTRY L_WPI_INPUT L_INF_CPI"
global BIES_L1    "L1_q1_net_balance L1_q2_net_balance L1_q3_wtd_mean L1_q4_wtd_mean L1_q5_wtd_mean"
global CONTROLS_B "AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC i.RELATION_NUM i.WORK_PLACE_NUM"

label var L1_q1_net_balance "BIES Q1: profit-margin net balance vs. normal, 1-wave lag (pp)"
label var L1_q2_net_balance "BIES Q2: sales-level net balance vs. normal, 1-wave lag (pp)"
label var L1_q3_wtd_mean    "BIES Q3: backward-looking cost change, weighted mean, 1-wave lag (\%)"
label var L1_q4_wtd_mean    "BIES Q4: forward-looking cost expectation, weighted mean, 1-wave lag (\%)"
label var L1_q5_wtd_mean    "BIES Q5: CPI inflation expectation, weighted mean, 1-wave lag (\%)"

eststo bies_sum: estpost summarize INDUSTRY_SWITCH $CMIE_SUBS_L1 $BIES_L1

**# TABLE 4A: BIES vs CMIE -- TWO-WAY FE, INDUSTRY SWITCH

quietly xtreg INDUSTRY_SWITCH $CMIE_SUBS_L1 i.WAVE_NO $CONTROLS_B, fe vce(cluster MEM_PANEL_ID)
estimates store cmie_l1

quietly xtreg INDUSTRY_SWITCH $BIES_L1 i.WAVE_NO $CONTROLS_B, fe vce(cluster MEM_PANEL_ID)
estimates store bies_l1

esttab cmie_l1 bies_l1 using "$TEX_OUT/Table4a_BIES_vs_CMIE_IndustrySwitch.tex", replace label booktabs star(* 0.10 ** 0.05 *** 0.01) b(3) se(3) keep($CMIE_SUBS_L1 $BIES_L1) order($CMIE_SUBS_L1 $BIES_L1) nocons indicate("Wave Fixed Effects = *.WAVE_NO") mtitles("CMIE Proxies" "BIES Expectations") title("Industry Switching: BIES Direct Expectations vs. CMIE Macro Proxies (Two-Way FE)\label{tab:table4a_bies_vs_cmie}") stats(N r2_w, fmt(%12.0fc %6.3f) labels("Observations" "Within $R^2$")) addnotes("Sample: BIES-Manufacturing Sample -- CPHS manufacturing workers (NIC divisions 10-33) in waves with BIES coverage (has_bies=1), earning members observed in $>=2$ consecutive waves." "`sample_period_note'" "Dependent variable: INDUSTRY_SWITCH; identical outcome and identical sample/wave set in both columns, so any difference in fit reflects the information content of the regressor set rather than sample composition." "Column (1) regressors: 1-wave lags of the CMIE macro proxies (industry-matched credit growth, IIP growth, WPI input-cost inflation, CPI inflation)." "Column (2) regressors: 1-wave lags of the five BIES-elicited firm expectation measures (Q1 margin balance, Q2 sales balance, Q3 backward cost change, Q4 forward cost expectation, Q5 CPI expectation); BIES regressors vary only at the wave level in this specification (see Section 6.6 for the industry-level alternative)." "Estimator: LPM, individual and wave fixed effects (xtreg, fe, plus i.WAVE_NO)." "Industry FE / industry-wave trend omitted: sample is single-industry (manufacturing) by construction, so these terms are not identified." "`controls_note'" "Standard errors clustered at the individual level (MEM_PANEL_ID) in parentheses.") nogaps compress

**# TABLE 4B: LEADS-AND-LAGS TEST (BIES SAMPLE)

quietly xtreg INDUSTRY_SWITCH L1.($CMIE_CONTEMP) F1.($CMIE_CONTEMP) i.WAVE_NO $CONTROLS_B, fe vce(cluster MEM_PANEL_ID)
estimates store leadlag_bies_l1

esttab leadlag_bies_l1 using "$TEX_OUT/Table4b_LeadsLags_BIES_IndustrySwitch.tex", replace label booktabs star(* 0.10 ** 0.05 *** 0.01) b(3) se(3) nocons indicate("Controls = AGE_YRS AGE2 EDU_NUM MARRIED BANK_ACC PF_COV HEALTH_INS MOBILE_ACC" "Relationship-to-HOH FE = *.RELATION_NUM" "Place-of-Work FE = *.WORK_PLACE_NUM" "Wave Fixed Effects = *.WAVE_NO") mtitles("Lag + Lead") title("Leads-and-Lags Test: Industry Switching on Lagged and Led CMIE Macro Proxies, BIES-Manufacturing Sample (Two-Way FE)\label{tab:table4b_leadlag}") stats(N r2_w, fmt(%12.0fc %6.3f) labels("Observations" "Within $R^2$")) addnotes("Sample: BIES-Manufacturing Sample -- CPHS manufacturing workers (NIC divisions 10-33) in waves with BIES coverage (has_bies=1), earning members observed in $>=2$ consecutive waves." "`sample_period_note'" "Dependent variable: INDUSTRY_SWITCH." "Estimator: LPM, individual and wave fixed effects (xtreg, fe, plus i.WAVE_NO), two-way." "Regressors include both 1-wave lags (L1.) and 1-wave leads (F1.) of CMIE macro proxies to test for pre-trends in the BIES sub-sample." "`controls_note'" "Standard errors clustered at the individual level (MEM_PANEL_ID) in parentheses.") nogaps compress

**# TABLE 1: SUMMARY STATISTICS (BOTH SAMPLES, SIDE BY SIDE)

esttab main_sum bies_sum using "$TEX_OUT/Table1_Summary_Statistics.tex", replace label booktabs cells("mean(fmt(3)) sd(fmt(3)) count(fmt(0))") mtitles("Main Sample" "BIES-Manufacturing Sample") title("Summary Statistics: Industry Switch, Lagged CMIE Macro Variables, and Lagged BIES Variables\label{tab:table1_summary}") note("Main Sample: all earning members observed in $>=2$ waves (used in Tables 2-3)." "BIES-Manufacturing Sample: manufacturing workers (NIC 10-33) in waves with BIES coverage, earning members observed in $>=2$ waves (used in Table 4)." "`sample_period_note'" "`controls_note'") nogaps compress

eststo clear
