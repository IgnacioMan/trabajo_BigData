
#cargamos paquetes
library(tidyverse)
library(dplyr)

#importo los datos
clasificacion_Q <- qs::qread("./datos/qualifying_2021.qs")

#arreglo datos

clasificacion_Q <- clasificacion_Q %>%  
  mutate(position = as.numeric(position)) %>%
  mutate(round = as.numeric(round))

#modifico datos

clasi <- clasificacion_Q %>% filter(driverId %in% c("max_verstappen", "hamilton")) %>% select(-c(Q1, Q2, Q1_sec, Q2_sec, Q3_sec))


clasi <- clasificacion_Q %>%
  filter(driverId %in% c("max_verstappen", "hamilton")) %>%
  select(-c(Q1, Q2, Q1_sec, Q2_sec, Q3_sec))


#más paquetes
library(ggplot2)
library(ggthemes)
library(gganimate)

#hago el gráfico

clasi %>% ggplot(aes(x=round, y=position, color=driverId, group = driverId)) + geom_line(linewidth = 3) +  transition_reveal(round) + labs(title="Posición de parrilla",subtitle = "Entre Hamilton y Verstappen" , x="Carrera", y="Posición de parrilla") +  theme_minimal()




