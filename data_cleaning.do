clear all
macro drop _all

global RAW_DATA_DIR_CPHS "CPHS/Data"
global DTA_OUT_DIR  "Data Cleaning/CPHS"
global CSV_OUT_DIR  "CPHS/Cleaned_Data"
global PANEL_OUT "Panels"
global RAW_DATA_DIR_CMIE "CMIE/Cleaned Data"
global RAW_DATA_DIR_BIES "BIES"


**# ALL PROGRAMS

program define standardise_varnames
    * Admin
    cap rename REASON_FOR_NON_RESPONSE                         NR_REASON
    * HH weights
    cap rename HH_WEIGHT_W                                      HH_WGT_W
    cap rename HH_WEIGHT_FOR_COUNTRY_W                          HH_WGT_FOR_COUNTRY_W
    cap rename HH_WEIGHT_FOR_STATE_W                            HH_WGT_FOR_STATE_W
    cap rename HH_WEIGHT_MS                                     HH_WGT_MS
    cap rename HH_WEIGHT_FOR_COUNTRY_MS                         HH_WGT_FOR_COUNTRY_MS
    cap rename HH_WEIGHT_FOR_STATE_MS                           HH_WGT_FOR_STATE_MS
    * Member weights
    cap rename MEM_WEIGHT_W                                     MEM_WGT_W
    cap rename MEM_WEIGHT_FOR_COUNTRY_W                         MEM_WGT_FOR_COUNTRY_W
    cap rename MEM_WEIGHT_FOR_STATE_W                           MEM_WGT_FOR_STATE_W
    cap rename GE15_MEM_WEIGHT_W                                GE15_MEM_WGT_W
    cap rename GE15_MEM_WEIGHT_FOR_COUNTRY_W                    GE15_MEM_WGT_FOR_COUNTRY_W
    cap rename GE15_MEM_WEIGHT_FOR_STATE_W                      GE15_MEM_WGT_FOR_STATE_W
    cap rename MEM_WEIGHT_MS                                    MEM_WGT_MS
    cap rename MEM_WEIGHT_FOR_COUNTRY_MS                        MEM_WGT_FOR_COUNTRY_MS
    cap rename MEM_WEIGHT_FOR_STATE_MS                          MEM_WGT_FOR_STATE_MS
    * Non-response weights
    cap rename HH_NON_RESPONSE_W                                HH_NR_W
    cap rename HH_NON_RESPONSE_FOR_COUNTRY_W                    HH_NR_FOR_COUNTRY_W
    cap rename HH_NON_RESPONSE_FOR_STATE_W                      HH_NR_FOR_STATE_W
    cap rename HH_NON_RESPONSE_MS                               HH_NR_MS
    cap rename HH_NON_RESPONSE_FOR_COUNTRY_MS                   HH_NR_FOR_COUNTRY_MS
    cap rename HH_NON_RESPONSE_FOR_STATE_MS                    HH_NR_FOR_STATE_MS
    cap rename MEM_NON_RESPONSE_W                               MEM_NR_W
    cap rename MEM_NON_RESPONSE_FOR_COUNTRY_W                   MEM_NR_FOR_COUNTRY_W
    cap rename MEM_NON_RESPONSE_FOR_STATE_W                     MEM_NR_FOR_STATE_W
    cap rename GE15_MEM_NON_RESPONSE_W                          GE15_MEM_NR_W
    cap rename GE15_MEM_NON_RESPONSE_FOR_COUNTRY_W              GE15_MEM_NR_FOR_COUNTRY_W
    cap rename GE15_MEM_NON_RESPONSE_FOR_STATE_W                GE15_MEM_NR_FOR_STATE_W
    cap rename MEM_NON_RESPONSE_MS                              MEM_NR_MS
    cap rename MEM_NON_RESPONSE_FOR_COUNTRY_MS                  MEM_NR_FOR_COUNTRY_MS
    cap rename MEM_NON_RESPONSE_FOR_STATE_MS                    MEM_NR_FOR_STATE_MS
    * Groups
    cap rename INCOME_GROUP                                     INC_GROUP
    cap rename EDUCATION_GROUP                                  EDU_GROUP
    * Member demographics
    cap rename MEMBER_STATUS                                    MEM_STATUS
    cap rename REASON_FOR_EMIGRATION_IMMIGRATION                EMIGRATION_IMMIGRATION_REASON
    cap rename EMIGRATED_IMMIGRATED_FROM_TO_STATE                EMIGRATED_IMMIGRATED_STATE
    cap rename EMIGRATED_IMMIGRATED_FROM_TO_DISTRICT            EMIGRATED_IMMIGRATED_DISTRICT
    cap rename EMIGRATED_IMMIGRATED_FROM_TO_REGION_TYPE         EMIGRATED_IMMIGRATED_REGION_TYPE
    cap rename EDUCATION                                        EDU
    * Time use
    cap rename TIME_SPENT_ON_WORK_FOR_HH_AND_MEM                TS_ON_WORK_FOR_HH_N_MEM
    cap rename TIME_SPENT_ON_WORK_FOR_EMPLOYER                  TS_ON_WORK_FOR_EMPLOYER
    cap rename TIME_SPENT_ON_WORK_AS_UNPAID_TRAINEE             TS_ON_WORK_AS_UNPAID_TRAINEE
    cap rename TIME_SPENT_ON_WORK_AS_UNPAID_VOLUNTEER           TS_ON_WORK_AS_UNPAID_VOLUNTEER
    cap rename TIME_SPENT_ON_TRAVEL                             TS_ON_TRAVEL
    cap rename TIME_SPENT_ON_LEARNING                           TS_ON_LEARNING
    cap rename TIME_SPENT_ON_RELIGIOUS_ACTIVITIES               TS_ON_RELIGIOUS_ACTIVITIES
    cap rename TIME_SPENT_ON_OUTDOOR_SPORTS                     TS_ON_OUTDOOR_SPORTS
    cap rename TIME_SPENT_ON_HANGING_OUT_OR_WITH_FRIENDS         TS_WITH_FRNDS
    cap rename TIME_SPENT_ON_INDOOR_ENTERTAINMENT                TS_ON_INDOOR_ENTMT
    cap rename TIME_SPENT_ON_OTHER_ACTIVITIES_FOR_SELF          TS_ON_OTH_ACTIVITIES_FOR_SELF
    * Health
    cap rename IS_ON_OTHER_MEDICAL_TREATMENT_AIDS               IS_ON_OTH_MEDICAL_TREATMENT_AIDS
    cap rename HAS_HEALTH_INSURANCE                             HAS_HEALTH_INS
    * Income aggregates
    cap rename TOTAL_INCOME                                     TOT_INC
    cap rename INCOME_OF_ALL_MEMBERS_FROM_ALL_SOURCES            INC_OF_ALL_MEMS_FRM_ALL_SRCS
    cap rename INCOME_OF_ALL_MEMBERS_FROM_WAGES                  INC_OF_ALL_MEMS_FRM_WAGES
    cap rename INCOME_OF_ALL_MEMBERS_FROM_PENSION                INC_OF_ALL_MEMS_FRM_PENSION
    cap rename INCOME_OF_ALL_MEMBERS_FROM_DIVIDEND               INC_OF_ALL_MEMS_FRM_DIVIDEND
    cap rename INCOME_OF_ALL_MEMBERS_FROM_INTEREST               INC_OF_ALL_MEMS_FRM_INTEREST
    cap rename INCOME_OF_ALL_MEMBERS_FROM_FD_PF_INSURANCE        INC_OF_ALL_MEMS_FRM_FD_PF_INS
    cap rename INCOME_OF_HOUSEHOLD_FROM_ALL_SOURCES              INC_OF_HH_FRM_ALL_SRCS
    cap rename INCOME_OF_HOUSEHOLD_FROM_RENT                     INC_OF_HH_FRM_RENT
    cap rename INCOME_OF_HOUSEHOLD_FROM_SELF_PRODUCTION          INC_OF_HH_FRM_SELF_PRODN
    cap rename INCOME_OF_HOUSEHOLD_FROM_PRIVATE_TRANSFERS        INC_OF_HH_FRM_PVT_TRF
    cap rename INCOME_OF_HOUSEHOLD_FROM_GOVERNMENT_TRANSFERS     INC_OF_HH_FRM_GOVT_TRF
    cap rename INCOME_OF_HOUSEHOLD_FROM_IN_KIND_TRANSFERS_FROM_GOVERNMENT INC_OF_HH_FRM_IN_KIND_GOVT_TRF
    cap rename INCOME_OF_HOUSEHOLD_FROM_IN_KIND_TRANSFERS_FROM_NGO INC_OF_HH_FRM_NGO_TRF
    cap rename INCOME_OF_HOUSEHOLD_FROM_BUSINESS_PROFIT          INC_OF_HH_FRM_BIZ_PROFIT
    cap rename INCOME_OF_HOUSEHOLD_FROM_SALE_OF_ASSET            INC_OF_HH_FRM_ASSET_SALE
    cap rename INCOME_OF_HOUSEHOLD_FROM_GAMBLING                 INC_OF_HH_FRM_GAMBLING
    * Member-level income
    cap rename INCOME_OF_MEMBER_FROM_ALL_SOURCES                 INC_OF_MEM_FRM_ALL_SRCS
    cap rename INCOME_OF_MEMBER_FROM_WAGES                       INC_OF_MEM_FRM_WAGES
    cap rename INCOME_OF_MEMBER_FROM_PENSION                     INC_OF_MEM_FRM_PENSION
    cap rename INCOME_OF_MEMBER_FROM_DIVIDEND                    INC_OF_MEM_FRM_DIVIDEND
    cap rename INCOME_OF_MEMBER_FROM_INTEREST                    INC_OF_MEM_FRM_INTEREST
    cap rename INCOME_OF_MEMBER_FROM_FD_PF_INSURANCE             INC_OF_MEM_FRM_FD_PF_INS
    * Expenditure
    cap rename TOTAL_EXPENDITURE                                 TOT_EXP
    cap rename ADJ_TOTAL_EXPENDITURE                             ADJ_TOT_EXP
    * Assets
    cap rename AIR_CONDITIONERS_OWNED                            ACS_OWNED
    cap rename BOUGHT_AIR_CONDITIONER                            BOUGHT_AC
    cap rename WILL_BUY_AIR_CONDITIONER                          WILL_BUY_AC
    cap rename WILL_BUY_AIR_CONDITIONER_NOW                      WILL_BUY_AC_NOW
    cap rename GOOD_TIME_TO_BUY_AIR_CONDITIONER                  GOOD_TIME_TO_BUY_AC
    cap rename TELEVISIONS_OWNED                                 TVS_OWNED
    cap rename BOUGHT_TELEVISION                                 BOUGHT_TV
    cap rename WILL_BUY_TELEVISION                               WILL_BUY_TV
    cap rename WILL_BUY_TELEVISION_NOW                           WILL_BUY_TV_NOW
    cap rename GOOD_TIME_TO_BUY_TELEVISION                       GOOD_TIME_TO_BUY_TV
    cap rename WILL_BUY_CAR_OF_TYPE                              TYPE_OF_CAR_WILL_BUY
    cap rename WILL_BUY_TWO_WHEELER_OF_TYPE                      TYPE_OF_TWO_WHEELER_WILL_BUY
    * Savings
    cap rename HAS_OUTSTANDING_SAVING_IN_FIXED_DEPOSITS          HAS_SAVING_IN_FD
    cap rename HAS_SAVED_IN_FIXED_DEPOSITS                       HAS_SAVED_IN_FD
    cap rename WILL_SAVE_IN_FIXED_DEPOSITS                       WILL_SAVE_IN_FD
    cap rename HAS_OUTSTANDING_SAVING_IN_POST_OFFICE_SAVINGS     HAS_SAVING_IN_PO
    cap rename HAS_SAVED_IN_POST_OFFICE_SAVINGS                  HAS_SAVED_IN_PO
    cap rename WILL_SAVE_IN_POST_OFFICE_SAVINGS                  WILL_SAVE_IN_PO
    cap rename HAS_OUTSTANDING_SAVING_IN_NSC_BONDS               HAS_SAVING_IN_NSC_BONDS
    cap rename HAS_OUTSTANDING_SAVING_IN_KVP                     HAS_SAVING_IN_KVP
    cap rename HAS_OUTSTANDING_SAVING_IN_PROVIDENT_FUND          HAS_SAVING_IN_PF
    cap rename HAS_SAVED_IN_PROVIDENT_FUND                       HAS_SAVED_IN_PF
    cap rename WILL_SAVE_IN_PROVIDENT_FUND                       WILL_SAVE_IN_PF
    cap rename HAS_OUTSTANDING_SAVING_IN_LIFE_INSURANCE          HAS_SAVING_IN_LIFE_INS
    cap rename HAS_SAVED_IN_LIFE_INSURANCE                       HAS_SAVED_IN_LIFE_INS
    cap rename WILL_SAVE_IN_LIFE_INSURANCE                       WILL_SAVE_IN_LIFE_INS
    cap rename HAS_OUTSTANDING_SAVING_IN_MUTUAL_FUNDS            HAS_SAVING_IN_MF
    cap rename HAS_SAVED_IN_MUTUAL_FUNDS                         HAS_SAVED_IN_MF
    cap rename WILL_SAVE_IN_MUTUAL_FUNDS                         WILL_SAVE_IN_MF
    cap rename HAS_OUTSTANDING_SAVING_IN_LISTED_SHARES           HAS_SAVING_IN_SHARES
    cap rename HAS_SAVED_IN_LISTED_SHARES                        HAS_SAVED_IN_SHARES
    cap rename WILL_SAVE_IN_LISTED_SHARES                        WILL_SAVE_IN_SHARES
    cap rename HAS_OUTSTANDING_SAVING_IN_BUSINESS                HAS_SAVING_IN_BIZ
    cap rename HAS_SAVED_IN_BUSINESS                             HAS_SAVED_IN_BIZ
    cap rename WILL_SAVE_IN_BUSINESS                             WILL_SAVE_IN_BIZ
    cap rename HAS_OUTSTANDING_SAVING_IN_GOLD                    HAS_SAVING_IN_GOLD
    cap rename HAS_OUTSTANDING_SAVING_IN_REAL_ESTATE             HAS_SAVING_IN_REAL_ESTATE
    cap rename HAS_OUTSTANDING_SAVING_IN_CHIT_FUNDS              HAS_SAVING_IN_CHTFUND
    cap rename HAS_SAVED_IN_CHIT_FUNDS                           HAS_SAVED_IN_CHTFUND
    cap rename WILL_SAVE_IN_CHIT_FUNDS                           WILL_SAVE_IN_CHTFUND
    cap rename HAS_OUTSTANDING_SAVING_IN_OTHER_FIN_INSTRUMENTS  HAS_SAVING_IN_OTH_FIN_INSTR
    cap rename HAS_SAVED_IN_OTHER_FIN_INSTRUMENTS                HAS_SAVED_IN_OTH_FIN_INSTR
    cap rename WILL_SAVE_IN_OTHER_FIN_INSTRUMENTS                WILL_SAVE_IN_OTH_FIN_INSTR
    * Borrowing
    cap rename HAS_OUTSTANDING_BORROWING                         HAS_BORR
    cap rename BORROWED_FOR_HOUSING                              BORR_FOR_HSG
    cap rename BORROWED_FOR_EDUCATION                            BORR_FOR_EDU
    cap rename BORROWED_FOR_MEDICAL_EXPENDITURE                  BORR_FOR_MED_EXP
    cap rename BORROWED_FOR_WEDDING                              BORR_FOR_WEDDING
    cap rename BORROWED_FOR_CONSUMPTION_EXPENDITURE              BORR_FOR_CONS_EXP
    cap rename BORROWED_FOR_CONSUMER_DURABLES                    BORR_FOR_CDS
    cap rename BORROWED_FOR_BUSINESS                             BORR_FOR_BIZ
    cap rename BORROWED_FOR_INVESTMENTS                          BORR_FOR_INVSTS
    cap rename BORROWED_FOR_DEBT_REPAYMENT                       BORR_FOR_REPAY
    cap rename BORROWED_FOR_VEHICLES                             BORR_FOR_VEHICLE
    cap rename BORROWED_FOR_OTHER_PURPOSES                       BORR_FOR_OTH_PRPS
    cap rename BORROWED_FROM_BANK                                BORR_FRM_BANK
    cap rename BORROWED_FROM_MONEY_LENDER                        BORR_FRM_LENDER
    cap rename BORROWED_FROM_EMPLOYER                            BORR_FRM_EMPLOYER
    cap rename BORROWED_FROM_REL_FRIENDS                         BORR_FRM_REL_FRNDS
    cap rename BORROWED_FROM_NBFC_DEALER                         BORR_FRM_NBFC
    cap rename BORROWED_FROM_SHG_MFI                             BORR_FRM_SHG_MFI
    cap rename BORROWED_FROM_SHG                                 BORR_FRM_SHG
    cap rename BORROWED_FROM_MFI                                 BORR_FRM_MFI
    cap rename BORROWED_FROM_CHITFUNDS                           BORR_FRM_CHTFUND
    cap rename BORROWED_FROM_CREDIT_CARDS                        BORR_FRM_CC
    cap rename BORROWED_FROM_SHOPS                               BORR_FRM_SHOPS
    cap rename BORROWED_FROM_OTHER_SOURCES                       BORR_FRM_OTH_SRCS
    cap rename BORROWED_FROM_DONT_KNOW                           BORR_FRM_UNKNOWN
    * Consumer sentiment
    cap rename FAMILY_FINANCES_COMPARED_TO_YEAR_AGO              FAMILY_FIN_COMPARED_TO_YR_AGO
    cap rename FAMILY_FINANCES_A_YEAR_LATER                      FAMILY_FIN_A_YR_LATER
    cap rename CONDITIONS_IN_COUNTRY_OVER_NEXT_12_MONTHS        COND_IN_COUNTRY_OVER_NEXT_12M
    cap rename CONDITIONS_IN_COUNTRY_OVER_NEXT_5_YEARS           COND_IN_COUNTRY_OVER_NEXT_5YR
    cap rename IS_THIS_GOOD_TIME_TO_BUY_CONSUMER_DURABLES        GOOD_TIME_TO_BUY_CDS
    * Infrastructure
    cap rename POWER_AVAILABILITY_IN_HOURS_PER_DAY              POWER_AVAILABILITY_HOURS_PER_DAY
    cap rename WATER_AVAILABILITY_IN_DAYS_PER_WEEK              WATER_AVAILABILITY_DAYS_PER_WEEK
    cap rename WATER_AVAILABILITY_IN_HOURS_PER_DAY              WATER_AVAILABILITY_HOURS_PER_DAY
end

program define apply_nic_mapping
    cap confirm variable INDUSTRY_OF_OCCUPATION
    if _rc != 0 {
        di as error "INDUSTRY_OF_OCCUPATION not found — skipping NIC mapping."
        exit
    }

    gen INDUSTRY_OF_OCCUPATION_NIC = ""
    gen NIC_DIV_CODE = .

    * Division 01 — Crop and animal production
    replace INDUSTRY_OF_OCCUPATION_NIC = "Crop and animal production, hunting and related service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Crop Cultivation"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Crop and animal production, hunting and related service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Fruits and Vegetable Farming"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Crop and animal production, hunting and related service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Plantation Crop Cultivation"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Crop and animal production, hunting and related service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Poultry Farming, Animal Husbandry and Vermiculture"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Crop and animal production, hunting and related service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Agriculture- allied activities"
    replace NIC_DIV_CODE = 1 if INDUSTRY_OF_OCCUPATION_NIC == "Crop and animal production, hunting and related service activities"

    * Division 02 — Forestry
    replace INDUSTRY_OF_OCCUPATION_NIC = "Forestry and logging" if trim(INDUSTRY_OF_OCCUPATION) == "Forestry including Wood Cutting"
    replace NIC_DIV_CODE = 2 if INDUSTRY_OF_OCCUPATION_NIC == "Forestry and logging"

    * Division 03 — Fishing
    replace INDUSTRY_OF_OCCUPATION_NIC = "Fishing and aquaculture" if trim(INDUSTRY_OF_OCCUPATION) == "Fishing"
    replace NIC_DIV_CODE = 3 if INDUSTRY_OF_OCCUPATION_NIC == "Fishing and aquaculture"

    * Division 08 — Mining
    replace INDUSTRY_OF_OCCUPATION_NIC = "Mining and quarrying" if trim(INDUSTRY_OF_OCCUPATION) == "Mines"
    replace NIC_DIV_CODE = 8 if INDUSTRY_OF_OCCUPATION_NIC == "Mining and quarrying"

    * Division 10 — Food products
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of food products" if trim(INDUSTRY_OF_OCCUPATION) == "Food Industries"
    replace NIC_DIV_CODE = 10 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of food products"

    * Division 13 — Textiles
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of textiles" if trim(INDUSTRY_OF_OCCUPATION) == "Textile Industries"
    replace NIC_DIV_CODE = 13 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of textiles"

    * Division 15 — Leather
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of leather and related products" if trim(INDUSTRY_OF_OCCUPATION) == "Footwear and other Leather Industries"
    replace NIC_DIV_CODE = 15 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of leather and related products"

    * Division 20 — Chemicals (incl. soaps/cosmetics)
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of Chemical and Chemical Products" if trim(INDUSTRY_OF_OCCUPATION) == "Chemical Industries"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of Chemical and Chemical Products" if trim(INDUSTRY_OF_OCCUPATION) == "Soaps, Detergents, Cosmetics, Toiletries"
    replace NIC_DIV_CODE = 20 if inlist(trim(INDUSTRY_OF_OCCUPATION), "Chemical Industries", "Soaps, Detergents, Cosmetics, Toiletries")

    * Division 21 — Pharmaceuticals
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of basic pharmaceutical products and pharmaceutical preparations" if trim(INDUSTRY_OF_OCCUPATION) == "Pharmaceutical Manufacturer"
    replace NIC_DIV_CODE = 21 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of basic pharmaceutical products and pharmaceutical preparations"

    * Division 23 — Non-metallic mineral products
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of other non-metallic mineral products" if trim(INDUSTRY_OF_OCCUPATION) == "Cement, Tiles, Bricks, Ceramics, Glass and other construction materials"
    replace NIC_DIV_CODE = 23 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of other non-metallic mineral products"

    * Division 24 — Basic metals
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of basic metals" if trim(INDUSTRY_OF_OCCUPATION) == "Metal Industries"
    replace NIC_DIV_CODE = 24 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of basic metals"

    * Division 28 — Machinery
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of machinery and equipment n.e.c." if trim(INDUSTRY_OF_OCCUPATION) == "Machinery Manufacturers"
    replace NIC_DIV_CODE = 28 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of machinery and equipment n.e.c."

    * Division 29 — Motor vehicles
    replace INDUSTRY_OF_OCCUPATION_NIC = "Manufacture of motor vehicles, trailers and semi-trailers" if trim(INDUSTRY_OF_OCCUPATION) == "Automobiles and Other Transport Equipment Manufacturers"
    replace NIC_DIV_CODE = 29 if INDUSTRY_OF_OCCUPATION_NIC == "Manufacture of motor vehicles, trailers and semi-trailers"

    * Division 32 — Other manufacturing
    replace INDUSTRY_OF_OCCUPATION_NIC = "Other manufacturing" if trim(INDUSTRY_OF_OCCUPATION) == "Handicraft Industries"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Other manufacturing" if trim(INDUSTRY_OF_OCCUPATION) == "Gems & Jewellery"
    replace NIC_DIV_CODE = 32 if INDUSTRY_OF_OCCUPATION_NIC == "Other manufacturing"

    * Division 34 — Electricity, gas
    replace INDUSTRY_OF_OCCUPATION_NIC = "Electricity, gas, steam and air conditioning supply" if trim(INDUSTRY_OF_OCCUPATION) == "Utilities"
    replace NIC_DIV_CODE = 34 if INDUSTRY_OF_OCCUPATION_NIC == "Electricity, gas, steam and air conditioning supply"

    * Division 41 — Construction
    replace INDUSTRY_OF_OCCUPATION_NIC = "Construction of residential and non-residential buildings" if trim(INDUSTRY_OF_OCCUPATION) == "Real Estate & Construction"
    replace NIC_DIV_CODE = 41 if trim(INDUSTRY_OF_OCCUPATION) == "Real Estate & Construction"

    * Division 46 — Wholesale trade
    replace INDUSTRY_OF_OCCUPATION_NIC = "Wholesale trade" if trim(INDUSTRY_OF_OCCUPATION) == "Wholesale Trade"
    replace NIC_DIV_CODE = 46 if INDUSTRY_OF_OCCUPATION_NIC == "Wholesale trade"

    * Division 47 — Retail trade
    replace INDUSTRY_OF_OCCUPATION_NIC = "Retail trade" if trim(INDUSTRY_OF_OCCUPATION) == "Retail Trade"
    replace NIC_DIV_CODE = 47 if INDUSTRY_OF_OCCUPATION_NIC == "Retail trade"

    * Division 49 — Land transport
    replace INDUSTRY_OF_OCCUPATION_NIC = "Land transport and transport via pipelines" if trim(INDUSTRY_OF_OCCUPATION) == "Logistics/Transport"
    replace NIC_DIV_CODE = 49 if INDUSTRY_OF_OCCUPATION_NIC == "Land transport and transport via pipelines"

    * Division 53 — Postal and courier
    replace INDUSTRY_OF_OCCUPATION_NIC = "Postal and courier activities" if trim(INDUSTRY_OF_OCCUPATION) == "Communication, Post & Courier"
    replace NIC_DIV_CODE = 53 if INDUSTRY_OF_OCCUPATION_NIC == "Postal and courier activities"

    * Division 55 — Accommodation
    replace INDUSTRY_OF_OCCUPATION_NIC = "Accommodation" if trim(INDUSTRY_OF_OCCUPATION) == "Hotels and Restaurants"
    replace NIC_DIV_CODE = 55 if INDUSTRY_OF_OCCUPATION_NIC == "Accommodation"

    * Division 58 — Publishing
    replace INDUSTRY_OF_OCCUPATION_NIC = "Publishing activities" if trim(INDUSTRY_OF_OCCUPATION) == "Media and Publishing"
    replace NIC_DIV_CODE = 58 if INDUSTRY_OF_OCCUPATION_NIC == "Publishing activities"

    * Division 62 — IT/ITES
    replace INDUSTRY_OF_OCCUPATION_NIC = "Telecommunications, computer programming, consultancy, computing infrastructure, and other information service activities" if trim(INDUSTRY_OF_OCCUPATION) == "IT & ITES"
    replace NIC_DIV_CODE = 62 if INDUSTRY_OF_OCCUPATION_NIC == "Telecommunications, computer programming, consultancy, computing infrastructure, and other information service activities"

    * Division 64 — Financial services
    replace INDUSTRY_OF_OCCUPATION_NIC = "Financial service activities, except insurance and pension funding" if trim(INDUSTRY_OF_OCCUPATION) == "Financial Services"
    replace NIC_DIV_CODE = 64 if INDUSTRY_OF_OCCUPATION_NIC == "Financial service activities, except insurance and pension funding"

    * Division 79 — Travel agency
    replace INDUSTRY_OF_OCCUPATION_NIC = "Travel agency, tour operator, and other travel related activities" if trim(INDUSTRY_OF_OCCUPATION) == "Travel and Tourism"
    replace NIC_DIV_CODE = 79 if INDUSTRY_OF_OCCUPATION_NIC == "Travel agency, tour operator, and other travel related activities"

    * Division 84 — Public administration & defence
    replace INDUSTRY_OF_OCCUPATION_NIC = "Public administration and defence; compulsory social security" if trim(INDUSTRY_OF_OCCUPATION) == "Public Administrative Services"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Public administration and defence; compulsory social security" if trim(INDUSTRY_OF_OCCUPATION) == "Defence Services"
    replace NIC_DIV_CODE = 84 if INDUSTRY_OF_OCCUPATION_NIC == "Public administration and defence; compulsory social security"

    * Division 85 — Education
    replace INDUSTRY_OF_OCCUPATION_NIC = "Education" if trim(INDUSTRY_OF_OCCUPATION) == "Education"
    replace NIC_DIV_CODE = 85 if INDUSTRY_OF_OCCUPATION_NIC == "Education"

    * Division 86 — Human health
    replace INDUSTRY_OF_OCCUPATION_NIC = "Human health activities" if trim(INDUSTRY_OF_OCCUPATION) == "Health Care"
    replace NIC_DIV_CODE = 86 if INDUSTRY_OF_OCCUPATION_NIC == "Human health activities"

    * Division 90 — Arts, sports and recreation
    replace INDUSTRY_OF_OCCUPATION_NIC = "Arts, sports and recreation" if trim(INDUSTRY_OF_OCCUPATION) == "Entertainment and Sports"
    replace NIC_DIV_CODE = 90 if INDUSTRY_OF_OCCUPATION_NIC == "Arts, sports and recreation"

    * Division 96 — Personal service activities
    replace INDUSTRY_OF_OCCUPATION_NIC = "Personal service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Personal Services - (Skilled)"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Personal service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Personal Services - (Non skilled)"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Personal service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Personal Non-Professional Services"
    replace INDUSTRY_OF_OCCUPATION_NIC = "Personal service activities" if trim(INDUSTRY_OF_OCCUPATION) == "Personal Professional Services"
    replace NIC_DIV_CODE = 96 if INDUSTRY_OF_OCCUPATION_NIC == "Personal service activities"

    order INDUSTRY_OF_OCCUPATION_NIC NIC_DIV_CODE, after(INDUSTRY_OF_OCCUPATION)
end


**# PART 1: CPHS DATA

local keep_vars WAVE_NO HH_ID MEM_ID STATE HR DISTRICT REGION_TYPE STRATUM PSU_ID MONTH_SLOT RESPONSE_STATUS AGE_GROUP INCOME_GROUP INC_GROUP OCCUPATION_GROUP GENDER AGE_YRS LITERACY EDU NATURE_OF_OCCUPATION INDUSTRY_OF_OCCUPATION OCCUPATION EMPLOYMENT_STATUS TYPE_OF_EMPLOYMENT EMPLOYMENT_ARRANGEMENT MARITAL_STATUS RELATION_WITH_HOH STATE_OF_ORIGIN PLACE_OF_WORK HAS_BANK_AC HAS_PF_AC HAS_HEALTH_INS HAS_MOBILE

local csv_files : dir "$RAW_DATA_DIR" files "people_of_india_20*.csv"

foreach file of local csv_files {

    local yr = ""
    if regexm("`file'", "people_of_india_(20[0-9][0-9])_wave_") {
        local yr = regexs(1)
    }

    local wn = 0
    if regexm("`file'", "_wave_([123])_") {
        local wn = real(regexs(1))
    }

    if "`yr'" == "" | `wn' == 0 {
        di as error "Skipping unparseable filename: `file'"
        continue
    }

    di as text "Processing: " as result "`file'"
    local basename = subinstr("`file'", ".csv", "", 1)

    import delimited using "$RAW_DATA_DIR/`file'", clear case(preserve) stringcols(_all)

    standardise_varnames

    local final_keep ""
    foreach v of local keep_vars {
        cap confirm variable `v'
        if _rc == 0 local final_keep "`final_keep' `v'"
    }
    keep `final_keep'

    cap confirm variable RESPONSE_STATUS
    if _rc == 0 {
        drop if lower(trim(RESPONSE_STATUS)) == "non-response"
        drop if missing(RESPONSE_STATUS)
    }

    cap confirm variable GENDER
    if _rc == 0 {
        drop if trim(GENDER) == "Data Not Available" | trim(GENDER) == "Not Applicable"
    }

    cap destring _all, replace ignore(" ")

    // Note: broad industry mapping removed from here to be executed inline below
    apply_nic_mapping

    gen YEAR     = real("`yr'")
    gen WAVE_NUM = `wn'   
    
    cap confirm variable WAVE_NO
    if _rc != 0 {
        gen WAVE_NO = (YEAR - 2022) * 3 + WAVE_NUM + 24
    }
    
    order WAVE_NO YEAR WAVE_NUM

    save "$DTA_OUT_DIR/`basename'_cleaned.dta", replace
}


local dta_files : dir "$DTA_OUT_DIR" files "*_wave_*_cleaned.dta"

local i = 0
foreach file of local dta_files {
    local i = `i' + 1
    local dta_`i' "`file'"
}
local n_files = `i'

di as text "Total cleaned wave files found: `n_files'"
if `n_files' == 0 {
    di as error "ERROR: No cleaned wave files found. Check DTA_OUT_DIR and filename pattern."
    exit
}

use "$DTA_OUT_DIR/`dta_1'", clear
di as text "Base file: `dta_1'"

forvalues j = 2/`n_files' {
    di as text "Appending: `dta_`j''"
    append using "$DTA_OUT_DIR/`dta_`j''"
}

drop if missing(WAVE_NUM)

// Resolve intra-wave variations and keep records cleanly
sort HH_ID MEM_ID WAVE_NO EMPLOYMENT_STATUS OCCUPATION MONTH_SLOT
by HH_ID MEM_ID WAVE_NO: keep if _n == 1

tab WAVE_NO, missing

// Create robust panel identifier string
egen MEM_PANEL_ID = group(STATE HH_ID MEM_ID)

// Declare the panel structure cleanly using WAVE_NO
xtset MEM_PANEL_ID WAVE_NO, delta(1)
xtdescribe

sort MEM_PANEL_ID WAVE_NO

cap drop AGE_MTHS DISCIPLINE RESPONSE_STATUS

order WAVE_NO YEAR WAVE_NUM MEM_PANEL_ID

save "Panels/cphs_panel.dta", replace


**# PART 2: BIES SUBSTITUTES

import delimited "D:\Srijayalakshmi\AHMEDABAD UNIVERSITY\SIP 2026\Panels\YoY_BIES_substitutes.csv", clear case(upper)

keep WAVE_NO YEAR WAVE_NUM CPI_ALL_ITEMS CPI_MISCELLANEOUS CPI_FOOD_AND_BEVERAGES IIP_IIP IIP_ECON_ACT_MANUFACTURING IIP_ECON_ACT_MINING_AND_RELATED CREDIT_NON_FOOD_TOTAL CREDIT_NON_FOOD_AGRICULTURE CREDIT_NON_FOOD_INDUSTRY CREDIT_NON_FOOD_SERVICES CREDIT_SERVICES_TOTAL CREDIT_SERVICES_TRANSPORT_OPERAT CREDIT_SERVICES_COMPUTER_SOFTWAR CREDIT_SERVICES_TOURISM_HOTELS_A CREDIT_SERVICES_PROFESSIONAL_SER CREDIT_SERVICES_SHIPPING CREDIT_SERVICES_AVIATION CREDIT_SERVICES_TRADE_TOTAL CREDIT_SERVICES_TRADE_WHOLESALE_ CREDIT_SERVICES_TRADE_RETAIL_TRA CREDIT_SERVICES_COMMERCIAL_REAL_ CREDIT_SERVICES_NBFC_TOTAL CREDIT_SERVICES_NBFC_HFC CREDIT_SERVICES_NBFC__PFI CREDIT_SERVICES_OTHER_SERVICES WPI_SPLICED_ALL_COMMODITIES WPI_MANUFACTURED_PRODUCTS WPI_PRIMARY_TOTAL

** RENAMING KEY BIES SUBSTITUTES **
rename IIP_ECON_ACT_MANUFACTURING            IIP_MANUF
rename IIP_ECON_ACT_MINING_AND_RELATED     IIP_MINING
rename CREDIT_NON_FOOD_INDUSTRY              CREDIT_IND
rename CREDIT_NON_FOOD_SERVICES              CREDIT_SVC
rename CREDIT_NON_FOOD_AGRICULTURE           CREDIT_AGR
rename CREDIT_NON_FOOD_TOTAL                 CREDIT_NF_TOTAL
rename WPI_MANUFACTURED_PRODUCTS             WPI_MANUF
rename WPI_PRIMARY_TOTAL            WPI_PRIMARY

tempfile bies_wave
save `bies_wave'

use "Panels/cphs_panel.dta", clear

merge m:1 WAVE_NUM WAVE_NO YEAR using `bies_wave'

tab _merge
drop _merge
sort HH_ID MEM_ID WAVE_NO

save "Panels/Merged_Panel_Final.dta", replace


**# PART 3: CREATE DUMMIES AND OTHER QUALITATIVE VARIABLE CHANGES

use "Panels/Merged_Panel_Final.dta", clear

// Correctly establish panel context for lag calculations using WAVE_NO
xtset MEM_PANEL_ID WAVE_NO, delta(1)

** industry-Matched Macro-Environmental Variables & Lags **
gen double IIP_INDUSTRY = .
replace IIP_INDUSTRY = IIP_MANUF if NIC_DIV_CODE >= 10 & NIC_DIV_CODE <= 33
replace IIP_INDUSTRY = IIP_MINING if NIC_DIV_CODE == 8
replace IIP_INDUSTRY = IIP_IIP if missing(IIP_INDUSTRY)
label var IIP_INDUSTRY "IIP growth matched to worker NIC industry"

gen double CREDIT_INDUSTRY = .
replace CREDIT_INDUSTRY = CREDIT_IND if NIC_DIV_CODE >= 10 & NIC_DIV_CODE <= 41
replace CREDIT_INDUSTRY = CREDIT_SVC if NIC_DIV_CODE >= 46
replace CREDIT_INDUSTRY = CREDIT_AGR if NIC_DIV_CODE <= 3
replace CREDIT_INDUSTRY = CREDIT_SERVICES_TOTAL if missing(CREDIT_INDUSTRY)
label var CREDIT_INDUSTRY "Bank credit growth matched to worker industry"

gen double WPI_INPUT = .
replace WPI_INPUT = WPI_MANUF if NIC_DIV_CODE >= 10 & NIC_DIV_CODE <= 33
replace WPI_INPUT = WPI_PRIMARY if NIC_DIV_CODE <= 3 | NIC_DIV_CODE == 8
replace WPI_INPUT = WPI_SPLICED_ALL_COMMODITIES if missing(WPI_INPUT)
label var WPI_INPUT "WPI input cost matched to worker industry"

gen double INF_CPI  = CPI_ALL_ITEMS
gen double INF_FOOD = CPI_FOOD_AND_BEVERAGES
gen double INF_CORE = CPI_MISCELLANEOUS
label var INF_CPI  "CPI All Items YoY %"
label var INF_FOOD "CPI Food & Beverages YoY %"
label var INF_CORE "CPI Miscellaneous (core proxy) YoY %"

** Systematically calculate lags safely using time-series operators
foreach v in INF_CPI WPI_INPUT IIP_INDUSTRY CREDIT_INDUSTRY {
    gen double L_`v'  = L.`v'
    gen double L2_`v' = L2.`v'
}
label var L_INF_CPI "1-period lag: CPI inflation"
label var L2_INF_CPI "2-period lag: CPI inflation"
label var L_WPI_INPUT "1-period lag: WPI input cost inflation"
label var L2_WPI_INPUT "2-period lag: WPI input cost inflation"
label var L_IIP_INDUSTRY "1-period lag: industry IIP growth"
label var L2_IIP_INDUSTRY "2-period lag: industry IIP growth"
label var L_CREDIT_INDUSTRY "1-period lag: Credit industry growth"
label var L2_CREDIT_INDUSTRY "2-period lag: Credit industry growth"

** Extended Employment & Activity Classification Matrix **
cap drop EMP_TYPE_EXTENDED EMP_TYPE_EXTENDED_SWITCH L_EMP_TYPE_EXTENDED
gen emp_class = ""
replace emp_class = "Salaried"       if inlist(EMPLOYMENT_ARRANGEMENT, "Salaried - Permanent", "Salaried - Regular") | TYPE_OF_EMPLOYMENT == "Full-time"
replace emp_class = "Part-time"      if TYPE_OF_EMPLOYMENT == "Part-time"
replace emp_class = "Self-Employed"  if inlist(EMPLOYMENT_ARRANGEMENT, "Self-employed", "Self-employed not on digital platform") | NATURE_OF_OCCUPATION == "Home-based Worker"
replace emp_class = "Casual Worker"  if inlist(EMPLOYMENT_ARRANGEMENT, "Daily Wage worker/ Casual labour", "Salaried - Temporary") | NATURE_OF_OCCUPATION == "Wage Labourer"
replace emp_class = "Home-maker"     if inlist(EMPLOYMENT_STATUS, "Home Maker", "Home-maker")
replace emp_class = "Student"        if EMPLOYMENT_STATUS == "Student"
replace emp_class = "Unemployed"     if inlist(EMPLOYMENT_STATUS, "Unemployed, willing and looking for a job", "Unemployed, not willing but looking for a job", "Unemployed, willing but not looking for a job")
replace emp_class = "OLF"            if emp_class == "" & !missing(EMPLOYMENT_STATUS)

encode emp_class, gen(EMP_TYPE_EXTENDED)
label var EMP_TYPE_EXTENDED "Extended employment & activity classification"
drop emp_class

* Generate Lagged Employment Type State Safely
gen double L_EMP_TYPE_EXTENDED = L.EMP_TYPE_EXTENDED
label values L_EMP_TYPE_EXTENDED EMP_TYPE_EXTENDED
label var L_EMP_TYPE_EXTENDED "Previous period extended employment type"

* Construct the Extended Employment Type Switch indicator
gen byte EMP_TYPE_EXTENDED_SWITCH = (EMP_TYPE_EXTENDED != L.EMP_TYPE_EXTENDED) if !missing(EMP_TYPE_EXTENDED) & !missing(L.EMP_TYPE_EXTENDED)
label var EMP_TYPE_EXTENDED_SWITCH "=1 if worker altered their extended employment status group"

gen byte EMP_QUALITY = .
replace EMP_QUALITY = 1 if EMPLOYMENT_ARRANGEMENT == "Daily Wage worker/ Casual labour"
replace EMP_QUALITY = 2 if inlist(EMPLOYMENT_ARRANGEMENT, "Salaried - Temporary", "Salaried - Temporary, not on digital platform")
replace EMP_QUALITY = 3 if inlist(EMPLOYMENT_ARRANGEMENT, "Self-employed", "Self-employed not on digital platform")
replace EMP_QUALITY = 4 if EMPLOYMENT_ARRANGEMENT == "Salaried - Permanent"
label var EMP_QUALITY "Employment quality: 1=casual, 4=permanent"

gen byte EARNING_MEMBER = (EMPLOYMENT_STATUS == "Employed") if !missing(EMPLOYMENT_STATUS)
label var EARNING_MEMBER "=1 if this member is currently employed (earning)"

gen byte NAT_OCC_TIER = .
replace NAT_OCC_TIER = 1 if inlist(NATURE_OF_OCCUPATION, "Agricultural Labourer", "Wage Labourer", "Small Farmer", "Home-based Worker", "Small Trader/Hawker/ Businessman without Fixed Premises")
replace NAT_OCC_TIER = 2 if inlist(NATURE_OF_OCCUPATION, "Organised Farmer", "Industrial Workers", "Businessman", "Self Employed Entrepreneur", "Support Staff")
replace NAT_OCC_TIER = 3 if inlist(NATURE_OF_OCCUPATION, "Non-Industrial Technical Employee", "White Collar Clerical Employees", "White-Collar Professional Employees and Other Employees")
label var NAT_OCC_TIER "Nature of occupation tier: 1=precarious, 3=formal/skilled"

** Baseline Mobility Indicators **
gen double L_NAT_OCC_TIER = L.NAT_OCC_TIER

cap drop UPWARD_MOB DOWNWARD_MOB
gen byte UPWARD_MOB   = (NAT_OCC_TIER > L_NAT_OCC_TIER) if !missing(NAT_OCC_TIER) & !missing(L_NAT_OCC_TIER)
gen byte DOWNWARD_MOB = (NAT_OCC_TIER < L_NAT_OCC_TIER) if !missing(NAT_OCC_TIER) & !missing(L_NAT_OCC_TIER)
label var UPWARD_MOB   "=1 if moved to higher occupation tier"
label var DOWNWARD_MOB "=1 if moved to lower occupation tier"

** Interaction terms **
cap drop EMP_NIC_INTERACT

* Industry Interaction
egen EMP_NIC_INTERACT = group(EMP_TYPE_EXTENDED NIC_DIV_CODE), missing label
decode EMP_NIC_INTERACT, gen(temp_lbl1)
replace temp_lbl1 = "Home-maker" if EMP_TYPE_EXTENDED == 3
replace temp_lbl1 = "OLF" if EMP_TYPE_EXTENDED == 4
replace temp_lbl1 = "Student" if EMP_TYPE_EXTENDED == 6
replace temp_lbl1 = "Unemployed" if EMP_TYPE_EXTENDED == 7
encode temp_lbl1, gen(new_EMP_NIC_INTERACT)
drop EMP_NIC_INTERACT temp_lbl1
rename new_EMP_NIC_INTERACT EMP_NIC_INTERACT
label var EMP_NIC_INTERACT "Interaction: Extended Employment Type x NIC Division Code"

* Lagged and Switched Detections **
cap drop L_EMP_NIC_INTERACT IND_SWITCH OCC_SWITCH

gen long L_EMP_NIC_INTERACT = L.EMP_NIC_INTERACT
label var L_EMP_NIC_INTERACT "Lagged Employment-Industry Interaction"

gen byte IND_SWITCH = (EMP_NIC_INTERACT != L_EMP_NIC_INTERACT) if !missing(EMP_NIC_INTERACT) & !missing(L_EMP_NIC_INTERACT)
label var IND_SWITCH "=1 if employment status or industry code changed from previous wave"

** joint Interaction Mobility Variables **
cap drop NIC_UPWARD_MOB NIC_DOWNWARD_MOB

gen byte NIC_UPWARD_MOB   = (UPWARD_MOB == 1 & IND_SWITCH == 1) if !missing(UPWARD_MOB) & !missing(IND_SWITCH)
gen byte NIC_DOWNWARD_MOB = (DOWNWARD_MOB == 1 & IND_SWITCH == 1) if !missing(DOWNWARD_MOB) & !missing(IND_SWITCH)

label var NIC_UPWARD_MOB   "=1 if upward mobility AND NIC employment-industry switch"
label var NIC_DOWNWARD_MOB "=1 if downward mobility AND NIC employment-industry switch"

cap drop BROAD_INDUSTRY_NAME
cap drop L_BROAD_INDUSTRY_NAME
cap drop INDUSTRY_SWITCH

cap confirm variable NIC_DIV_CODE
if _rc == 0 {
    
    gen str50 BROAD_INDUSTRY_NAME = ""
    replace BROAD_INDUSTRY_NAME = "Agriculture & Allied Activities"   if inrange(NIC_DIV_CODE, 1, 3)
    replace BROAD_INDUSTRY_NAME = "Manufacturing & Allied Activities" if inrange(NIC_DIV_CODE, 5, 43)
    replace BROAD_INDUSTRY_NAME = "Tangible Services"                 if inlist(NIC_DIV_CODE, 46, 47, 49, 55, 96)
    replace BROAD_INDUSTRY_NAME = "Intangible Services"               if inlist(NIC_DIV_CODE, 53, 58, 62, 64, 79, 84, 85, 86, 90)
    
    order BROAD_INDUSTRY_NAME, after(NIC_DIV_CODE)
    
    sort HH_ID WAVE_NO
    
    gen str50 L_BROAD_INDUSTRY_NAME = BROAD_INDUSTRY_NAME[_n-1] if HH_ID == HH_ID[_n-1] & BROAD_INDUSTRY_NAME != ""
    label var L_BROAD_INDUSTRY_NAME "Lagged Broad industry Name"
    
    gen byte INDUSTRY_SWITCH = (BROAD_INDUSTRY_NAME != L_BROAD_INDUSTRY_NAME) if BROAD_INDUSTRY_NAME != "" & L_BROAD_INDUSTRY_NAME != ""
    label var INDUSTRY_SWITCH "=1 if broad industry changed from previous wave"
    
    order L_BROAD_INDUSTRY_NAME INDUSTRY_SWITCH, after(BROAD_INDUSTRY_NAME)
}


**# PART 4: OTHER QUALITATIVE VARIABLE CHANGES

bysort MEM_PANEL_ID: gen int N_WAVES_OBS = _N
label var N_WAVES_OBS "Waves individual is observed"

gen byte SINGLETON = (N_WAVES_OBS == 1)
label var SINGLETON "=1 if observed in only 1 wave"

** Demographic & Regional Controls **
* Generate Binary GENDER (1 if Female, 0 if Male)
gen byte GENDER_BIN = .
replace GENDER_BIN = 1 if GENDER == "Female" | GENDER == "F"
replace GENDER_BIN = 0 if GENDER == "Male" | GENDER == "M"
label var GENDER_BIN "Gender (1=Female, 0=Male)"
label define lbl_gender_bin 0 "Male" 1 "Female"
label values GENDER_BIN lbl_gender_bin

* Generate Binary REGION (1 if Urban, 0 if Rural)
gen byte REGION_BIN = .
replace REGION_BIN = 1 if REGION_TYPE == "Urban" | REGION_TYPE == "URBAN"
replace REGION_BIN = 0 if REGION_TYPE == "Rural" | REGION_TYPE == "RURAL"
label var REGION_BIN "Region (1=Urban, 0=Rural)"
label define lbl_region_bin 0 "Rural" 1 "Urban"
label values REGION_BIN lbl_region_bin

cap drop REGION_TYPE GENDER
rename GENDER_BIN GENDER
rename REGION_BIN REGION
cap order GENDER, after(AGE_YRS)
cap order REGION, after(DISTRICT)

** Additional Micro Socio-Economic Controls **
gen byte MARRIED = (MARITAL_STATUS == "Married") if !missing(MARITAL_STATUS)
gen byte NEVER_MAR = (MARITAL_STATUS == "Never Married") if !missing(MARITAL_STATUS)
gen byte WIDOWED = (MARITAL_STATUS == "Widowed") if !missing(MARITAL_STATUS)
gen byte SEPARATED = inlist(MARITAL_STATUS, "Separated", "Divorced") if !missing(MARITAL_STATUS)
label var MARRIED "=1 if currently married"
label var NEVER_MAR "=1 if never married"
label var WIDOWED "=1 if widowed"
label var SEPARATED "=1 if separated or divorced"

gen byte HOH = (RELATION_WITH_HOH == "Self") if !missing(RELATION_WITH_HOH)
label var HOH "=1 if this member is the head of household"

gen byte MIGRANT = (STATE_OF_ORIGIN != STATE) if !missing(STATE_OF_ORIGIN) & !missing(STATE)
label var MIGRANT "=1 if current state differs from state of origin"

** Household Financial Access Vectors **
gen byte BANK_ACC = (HAS_BANK_AC == "Yes") if !missing(HAS_BANK_AC)
gen byte PF_COV = (HAS_PF_AC == "Yes") if !missing(HAS_PF_AC)
gen byte HEALTH_INS = (HAS_HEALTH_INS == "Yes") if !missing(HAS_HEALTH_INS)
gen byte MOBILE_ACC = (HAS_MOBILE == "Yes") if !missing(HAS_MOBILE)
label var BANK_ACC "=1 if member has an active bank account"
label var PF_COV "=1 if member has formal provident fund coverage"
label var HEALTH_INS "=1 if member has health insurance protection"
label var MOBILE_ACC "=1 if member has mobile phone access capability"

gen int EDU_NUM = .
replace EDU_NUM = 0 if EDU == "Illiterate"
replace EDU_NUM = 1 if inlist(EDU, "Literate - without formal schooling", "Literate - without formal sc")
replace EDU_NUM = 2 if EDU == "Below Primary"
replace EDU_NUM = 3 if EDU == "Primary"
replace EDU_NUM = 4 if EDU == "Middle"
replace EDU_NUM = 5 if inlist(EDU, "5th Std. Pass", "8th Std. Pass")
replace EDU_NUM = 6 if inlist(EDU, "10th Std. Pass", "Secondary")
replace EDU_NUM = 7 if inlist(EDU, "12th Std. Pass", "Higher Secondary")
replace EDU_NUM = 8 if EDU == "Graduate"
replace EDU_NUM = 9 if inlist(EDU, "Post Graduate & Above", "Post Graduate")
label var EDU_NUM "Education level: 0=illiterate, 9=postgraduate"

gen long AGE2 = AGE_YRS^2
label var AGE2 "Age squared"

cap drop MARITAL_STATUS STATE_OF_ORIGIN HAS_BANK_AC HAS_PF_AC HAS_HEALTH_INS HAS_MOBILE

* Final clean save
save "$PANEL_OUT/Merged_Panel_Final.dta", replace


**# PART 5: ENCODING STRING VARIABLES

use "$PANEL_OUT/Merged_Panel_Final.dta", clear

cap confirm string variable RELATION_WITH_HOH
if !_rc {
    encode RELATION_WITH_HOH, gen(RELATION_NUM)
}

cap confirm string variable PLACE_OF_WORK
if !_rc {
    encode PLACE_OF_WORK, gen(WORK_PLACE_NUM)
}

cap confirm string variable STATE
if !_rc {
    encode STATE, gen(STATE_NUM)
    label var STATE_NUM "Encoded State Classification"
}

cap confirm string variable DISTRICT
if !_rc {
    encode DISTRICT, gen(DISTRICT_NUM)
    label var DISTRICT_NUM "Encoded District Fixed Effect Identifier"
}

cap confirm string variable STRATUM
if !_rc {
    encode STRATUM, gen(STRATUM_NUM)
    label var STRATUM_NUM "Survey Stratum Identifier"
}

cap confirm string variable MONTH_SLOT
if !_rc {
    encode MONTH_SLOT, gen(MONTH_SLOT_NUM)
    label var MONTH_SLOT_NUM "Interview Month Within Wave"
}

cap confirm string variable MARITAL_STATUS
if !_rc {
    encode MARITAL_STATUS, gen(MARITAL_NUM)
    label var MARITAL_NUM "Full Marital Status Categorical Mapping"
}

cap confirm string variable NATURE_OF_OCCUPATION
if !_rc {
    encode NATURE_OF_OCCUPATION, gen(NAT_OCC_NUM)
    label var NAT_OCC_NUM "Granular Nature of Occupation Categories"
}

cap confirm string variable EMPLOYMENT_STATUS
if !_rc {
    encode EMPLOYMENT_STATUS, gen(EMP_STATUS_NUM)
    label var EMP_STATUS_NUM "Primary Employment/Activity Status Indicator"
}


**# PART 6: CRITICAL DIAGNOSTIC & SANITY CHECKS

** Data compression for memory footprint optimization **
compress GENDER REGION MARRIED HOH BANK_ACC PF_COV HEALTH_INS MOBILE_ACC IND_SWITCH

** Spatial Dimension Tracking **
codebook MEM_PANEL_ID, compact


**# PART 7: SAVING THE DATA - CPHS-CMIE

** Order and format macro tracking variables cleanly **
cap order WPI_MANUFACTURED_PRODUCTS-WPI_PRIMARY_TOTAL, after(EMP_TYPE_EXTENDED)
cap order IND_SWITCH UPWARD_MOB DOWNWARD_MOB, after(EMP_TYPE_EXTENDED)
order WAVE_NO YEAR WAVE_NUM MEM_PANEL_ID

xtset MEM_PANEL_ID WAVE_NO, delta(1) 
sort MEM_PANEL_ID WAVE_NO

save "Panels/Analysis_Panel.dta", replace
export delimited using "Panels/Analysis_Panel.csv", replace

export delimited using "Panels/analysis_panel_sample.csv" in 1/200, replace


**# PART 8: SMALLER DATA

preserve
    bysort HH_ID MEM_ID: keep if _n == 1
    bysort HH_ID: gen num_members = _N
    bysort HH_ID: keep if _n == 1
    keep HH_ID num_members
    export delimited using "Panels/members_per_household.csv", replace
restore

* Capture overall industry-level switching across all industries cleanly (no single-industry exclusion drops)
keep if !missing(NIC_DIV_CODE)
sort MEM_PANEL_ID WAVE_NO

save "Panels/Analysis_Panel_comparison.dta", replace


**# PART 9: BIES DATA

import delimited "BIES/BIES.csv", varnames(1) clear

* Q1: Profit Margins
rename (much_less_than_normal somewhat_less_than_normal about_normal somewhat_greater_than_normal much_greater_than_normal) (q1_much_less q1_smwt_less q1_normal q1_smwt_more q1_much_more)

* Q2: Sales Levels  
rename (v9 v10 v11 v12 v13) (q2_much_less q2_smwt_less q2_normal q2_smwt_more q2_much_more)

* Q3: Current Cost per Unit (backward-looking)
rename (down__1 about_unchanged_1_to_1 up_somewhat_11_to_3 up_moderately_31_to_6 up_significantly_61_to_10 up_very_significantly___10) (q3_down q3_unchanged q3_up_sm q3_up_mod q3_up_sig q3_up_vsig)

* Q4: Forward Cost per Unit (forward-looking, 12-month horizon)
rename (less_than_1 v23 v24 v25 v26 _10) (q4_down q4_unchanged q4_up_sm q4_up_mod q4_up_sig q4_up_vsig)

* Q5: CPI Inflation Expectation (asked every alternate month only)
rename (v29 _to_2 v31 v32 v33 v34 v35 v36 v37) (q5_lt_neg1 q5_1to2 q5_2to3 q5_3to4 q5_4to5 q5_5to6 q5_6to7 q5_7to8 q5_gt8)

* Drop the duplicate Question_No label columns (v2, v8, v14, v21, v28)
drop question_no v8 v14 v21 v28

** STRIP PERCENT SIGNS AND CONVERT TO NUMERIC

foreach var of varlist q1_* q2_* q3_* q4_* q5_* {
    replace `var' = subinstr(`var', "%", "", .)
    destring `var', replace force
    * Values stored as percentages (e.g., 23.50) — convert to proportions (0.235)
    replace `var' = `var' / 100 if `var' > 1 & !missing(`var')
}

** PARSE MONTH-YEAR STRING INTO STATA DATE

gen str_month = month                 // keep original string for reference

gen bies_date = monthly(month, "M20Y")  // Stata monthly date: e.g., May-17 → 689
format bies_date %tm                  // display as human-readable e.g. 2017m5
label var bies_date "BIES survey month (Stata monthly date)"

drop if missing(bies_date)

* Extract calendar year and month number for wave assignment
gen bies_year  = year(dofm(bies_date))
gen bies_month = month(dofm(bies_date))

* Verify (This will now pass successfully)
assert !missing(bies_date)
sort bies_date

** CONSTRUCT BIES EXPECTATION INDICES (WEIGHTED MEANS)

gen q3_wtd_mean = (-2) * q3_down + (0)  * q3_unchanged + (2)  * q3_up_sm + (4.5)* q3_up_mod + (8)  * q3_up_sig + (12) * q3_up_vsig
label var q3_wtd_mean "BIES Q3: Wtd mean current cost change (%) — backward-looking"

gen q4_wtd_mean = (-2) * q4_down + (0)  * q4_unchanged + (2)  * q4_up_sm + (4.5)* q4_up_mod + (8)  * q4_up_sig + (12) * q4_up_vsig
label var q4_wtd_mean "BIES Q4: Wtd mean forward cost expectation (%) — 12-month ahead"

gen q5_wtd_mean = (-1.5) * q5_lt_neg1 + (1.5)  * q5_1to2 + (2.55) * q5_2to3 + (3.55) * q5_3to4 + (4.55) * q5_4to5 + (5.55) * q5_5to6 + (6.55) * q5_6to7 + (7.55) * q5_7to8 + (9)    * q5_gt8
label var q5_wtd_mean "BIES Q5: Wtd mean CPI expectation (%) — alternate months only"

** PROFIT MARGIN NET BALANCE (Q1)
gen q1_net_balance = (q1_smwt_more + q1_much_more) - (q1_smwt_less + q1_much_less)
label var q1_net_balance "BIES Q1: Profit margin net balance (% more minus % less)"

** SALES NET BALANCE (Q2)
gen q2_net_balance = (q2_smwt_more + q2_much_more) - (q2_smwt_less + q2_much_less)
label var q2_net_balance "BIES Q2: Sales level net balance (% more minus % less)"

** UNCERTAINTY MEASURE — VARIANCE OF Q4 DISTRIBUTION
gen q4_ex2 = (4)    * q4_down       ///  (-2)^2 = 4
           + (0)    * q4_unchanged   ///  (0)^2
           + (4)    * q4_up_sm       ///  (2)^2
           + (20.25)* q4_up_mod      ///  (4.5)^2
           + (64)   * q4_up_sig      ///  (8)^2
           + (144)  * q4_up_vsig     //   (12)^2

gen q4_variance = q4_ex2 - (q4_wtd_mean^2)
gen q4_sd       = sqrt(q4_variance)
label var q4_variance "BIES Q4: Variance of forward cost expectation distribution"
label var q4_sd       "BIES Q4: Std dev of forward cost expectation (uncertainty measure)"
drop q4_ex2

gen period_within_year = ceil(bies_month / 4)   // 1, 2, or 3

gen WAVE_NO = 3 * (bies_year - 2014) + period_within_year
label var WAVE_NO "CPHS wave number assigned to this BIES month"

* Count how many BIES months fall in each wave
bysort WAVE_NO: gen n_bies_months = _N
label var n_bies_months "Number of BIES months averaged into this wave"

collapse (mean)  q3_wtd_mean q4_wtd_mean q5_wtd_mean q1_net_balance q2_net_balance q4_variance q4_sd q3_down q3_unchanged q3_up_sm q3_up_mod q3_up_sig q3_up_vsig q4_down q4_unchanged q4_up_sm q4_up_mod q4_up_sig q4_up_vsig (max) n_bies_months, by(WAVE_NO)

label var q3_wtd_mean      "Wave-avg BIES Q3: backward cost change (%)"
label var q4_wtd_mean      "Wave-avg BIES Q4: forward cost expectation (%)"
label var q5_wtd_mean      "Wave-avg BIES Q5: CPI inflation expectation (%)"
label var q1_net_balance   "Wave-avg BIES Q1: profit margin net balance"
label var q2_net_balance   "Wave-avg BIES Q2: sales net balance"
label var q4_variance      "Wave-avg BIES Q4: cost expectation variance"
label var q4_sd            "Wave-avg BIES Q4: cost expectation std dev (uncertainty)"

* Flag waves with incomplete BIES coverage
gen bies_partial = (n_bies_months < 3)
label var bies_partial "=1 if fewer than 3 BIES months averaged into wave"

tsset WAVE_NO

* Generate lagged BIES variables (1-wave and 2-wave lags)
sort WAVE_NO
foreach var in q4_wtd_mean q5_wtd_mean q3_wtd_mean q1_net_balance q2_net_balance q4_sd {
    gen L1_`var' = L.`var'
    gen L2_`var' = L2.`var'
    label var L1_`var' "1-wave lag of `var'"
    label var L2_`var' "2-wave lag of `var'"
}

* Keep only the waves corresponding to the years 2022 through 2026
keep if WAVE_NO >= 25 & WAVE_NO <= 39

save "Panels/BIES_wave_level.dta", replace
export delimited "Panels/BIES_wave_level.csv", replace


**# PART 10: MERGING THE DATA

use "Panels/Analysis_Panel_comparison.dta", clear
merge m:1 WAVE_NO using "Panels/BIES_wave_level.dta", keep(1 3) nogen

* Flag observations with BIES coverage
gen has_bies = !missing(q4_wtd_mean)
label var has_bies "=1 if this CPHS wave-observation has BIES data available"
tab has_bies
tab WAVE_NO if has_bies == 1

* Label the key BIES regressors clearly for the regression output
label var q4_wtd_mean    "BIES Forward Cost Expectation (%)"
label var q3_wtd_mean    "BIES Current Cost Perception (%)"
label var q5_wtd_mean    "BIES CPI Expectation (%)"
label var q1_net_balance "BIES Profit Margin Net Balance"
label var q2_net_balance "BIES Sales Net Balance"
label var q4_sd          "BIES Cost Expectation Uncertainty (SD)"
label var L1_q4_wtd_mean "L1 BIES Forward Cost Expectation"
label var L2_q4_wtd_mean "L2 BIES Forward Cost Expectation"
label var L1_q5_wtd_mean "L1 BIES CPI Expectation"
label var L1_q4_sd       "L1 BIES Uncertainty"


**# PART 11: SAVING THE DATA - CPHS-BIES

save "Panels/CPHS_BIES_comparison.dta", replace
export delimited "Panels/CPHS_BIES_comparison.csv", replace

export delimited using "Panels/CPHS_BIES_comparison_sample.csv" in 1/200, replace
