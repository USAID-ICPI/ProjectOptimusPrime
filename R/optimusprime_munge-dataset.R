##   Project:  Optimus Prime
##   Autors:   A.Chafetz, J.Davis, G.Sarfaty - USAID
##   Purpose:  generate output to populate HTs Optimization tool for Zambia
##   Date:     2018-04-09
##   Updated:  2018-04-10

# Dependencies ------------------------------------------------------------

  library(tidyverse)
  # install.packages("devtools")
  # library("devtools")
  # install_github("achafetz/PartnerProgress")
  library(genPPR)


# Import ------------------------------------------------------------------


  #read in data
    df_zam <- read_rds("RawData/ICPI_MER_Structured_Dataset_Site_IM_Zambia_20180323_v2_1.rds")
    

# Subset ------------------------------------------------------------------

  #keep just HTS and HTS_POS Total Numerator
    df_zam <- df_zam %>% 
      filter(indicator =="HTS_TST", standardizeddisaggregate == "Modality/MostCompleteAgeDisagg", fundingagency == "USAID")
    
  #combine facility/community names into one column & add type col
    df_zam <- df_zam %>% 
      mutate(site_name = case_when(
              typefacility == "Y"   ~ facility,
              typecommunity == "Y"  ~ community,
              typemilitary=="Y"     ~ psnu,
              TRUE                  ~ operatingunit),
            site_type = case_when(
              typefacility == "Y"   ~ "facility",
              typecommunity == "Y"  ~ "community",
              typemilitary=="Y"     ~ "mil")
      )
    
  #group and aggregate
    # determine current pd to aggregate
    curr_pd <- currentpd(df_zam)
    
    #aggregate with select variables
    df_zam <- df_zam %>% 
      group_by(operatingunit, snu1, psnu, psnuuid, site_name, site_type, orgunituid, mechanismid, primepartner, 
             implementingmechanismname, indicator, modality, resultstatus) %>% 
      summarise_at(vars(!!!curr_pd), ~ sum(., na.rm = TRUE)) %>% 
      ungroup()

    #remove blank rows
    df_zam <- df_zam %>% 
      filter(fy2018q1 != 0) #TODO - convert fy2018q1 to var, curr_pd
        
      
    #spread & create total, positibity
    df_zam <- df_zam %>% 
      spread(resultstatus, fy2018q1, fill = 0)
    
    df_zam <- df_zam %>% 
      rename_all(tolower) %>% 
      mutate(total = negative + positive,
             positivity = round(positive/total, 3))

# Export ------------------------------------------------------------------

  #export file to feed into tool
    #fs::dir_create("Output")
    write_csv(df_zam, "Output/zam_hts_mod.csv", na = "")
  
  