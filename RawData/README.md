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

![optimus prime](https://rzzy0b736k-flywheel.netdna-ssl.com/wp-content/uploads/2017/07/TF_OP_11_cvrC.jpg)

===

Disclaimer: The findings, interpretation, and conclusions expressed herein are those of the authors and do not necessarily reflect the views of United States Agency for International Development, Centers for Disease Control and Prevention, Department of State, Department of Defense, Peace Corps, or the United States Government. All errors remain our own.


