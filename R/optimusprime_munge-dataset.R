##   Project:  Optimus Prime
##   Autors:   A.Chafetz, J.Davis, G.Sarfaty - USAID
##   Purpose:  generate output to populate HTs Optimization tool for Zambia
##   Date:     2018-04-09
##   Updated: 

# Dependencies ------------------------------------------------------------

  library(tidyverse)


# Import ------------------------------------------------------------------


  #read in data
    df_zam <- read_rds("RawData/ICPI_MER_Structured_Dataset_Site_IM_Zambia_20180323_v2_1.rds")
    

# Subset ------------------------------------------------------------------

  #keep just HTS and HTS_POS Total Numerator
    df_zam <- df_zam %>% 
      filter(indicator =="HTS_TST", standardizeddisaggregate == "Modality/MostCompleteAgeDisagg", fundingagency == "USAID")
  
  #remove blank rows
    
  #combine facility/community names
  
  #select key variables needed


# Export ------------------------------------------------------------------

  #export file to feed into tool
    #fs::dir_create("Output")
    write_csv(df_zam, "Output/zam_hts.csv", na = "")
  
  