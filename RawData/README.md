The Zambia MER Structured Site Dataset is not stored here for senstitivty reasons and should be saved directly to your local machine.

To read in the Zambia MER Structured Site Dataset as an Rds file, use the 

```
#instll package
  install.packages("devtools")
  library("devtools")
  install_github("ICPI/ICPIutilities")

#import Zambia MER Structured Dataset and convert to Rds (smaller file size)
  ICPIutilities::read_mds("ICPI_MER_Structured_Dataset_Site_IM_Zambia_20180323_v2_1.txt", "RawData", remove_txt = TRUE)
  
```



