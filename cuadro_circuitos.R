#Cargo los datos

circuitos <- qs::qread("./datos/races_2021.qs")

#cargo paquetes
library(tidyverse)
library(DT)




df <- circuitos %>% select(-c(season, circuit_id, race_name, lat, long, locality)) %>% rename(carrera=round, circuito=circuit_name, pais=country, fecha=date, hora=time)

                           
df%>%
  tibble::as_tibble() %>%
  DT::datatable(filter = 'top', options = list( autoWidth = TRUE))


