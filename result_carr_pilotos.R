#importo los datos
result_carr_pilotos <- qs::qread("./datos/driver_standings_2021.qs")

#cargo los paquetes
library(tidyverse)
library(dplyr)
library(ggrepel)
result_carr_pilotos<- result_carr_pilotos %>%  
  mutate(points = as.numeric(points)) %>%
  mutate(round = as.numeric(round))


pr <- result_carr_pilotos %>% filter(driverId=="hamilton" | driverId=="max_verstappen") %>% rename(pilotos =  driverId)

#más paquetes
library(ggplot2)
library(ggthemes)
library(gganimate)

#gráfico de hamilton y verstappen
pr %>% ggplot(aes(x=round, y=points, color=pilotos, group = pilotos)) + geom_line() + labs(title="Clasificación pilotos",subtitle = "Entre Hamilton y Verstappen" , x="Carrera", y="Puntos")

names(todos)
#gráfico de todos los pilotos por escudería
todos <- result_carr_pilotos 
todos <- todos %>% rename(pilotos = driverId)

todos %>% ggplot(aes(x=round, y=points, color=pilotos, group = pilotos)) +
  geom_line() +  labs(title="Clasificación pilotos",subtitle = "Entre compañeros de equipo" , x="Carrera", y="puntos") +
  facet_wrap(vars(constructorId), nrow = 5, ncol = 5, scales = "fixed",  strip.position = "bottom")



