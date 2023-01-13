

pitstops_2021 <- qs::qread("./datos/pitstops_2021.qs")
library(tidyverse)


pt <- pitstops_2021 %>% 
  filter(driverId %in% c("hamilton", "max_verstappen")) %>%
  group_by(driverId) 
  
