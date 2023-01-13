telemetria <- qs::qread("./datos/telemetry_2021.qs")
library(tidyverse)

#Quiero solo la telemetría de la última carrera y de Verstappen, Hammiltone y Perez.

telemetria_pr <- telemetria %>% filter(round=="22") %>% filter(driverCode %in% c("HAM", "VER", "PER")) 
