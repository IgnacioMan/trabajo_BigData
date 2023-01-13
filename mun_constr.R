#cargo paquetes
library(qs)
library(tidyverse)
library(stats)
library(dplyr)
#importo datos

mun_constr <- qs::qread("./datos/constructor_standings_2021.qs")


#arreglo datos

mun_constr <- mun_constr %>%  
  mutate(points= as.numeric(points)) 



ff <- mun_constr %>% 
  group_by(constructorId) %>% 
  mutate(puntos = cumsum(points)) %>%
  filter(round=="22") %>%
  select(-c("wins", "round")) %>% 
  arrange((points)) %>% 
  group_by(constructorId)

#hago la tabla



df <-ggplot(ff,  aes(x = reorder(constructorId, points), y = points, fill=constructorId)) + geom_col( ) +  coord_flip() +
  labs(title = "Clasificación mundial de constructores", subtitle = "2020-2021",x="Escuderías", y="Puntos")

df

