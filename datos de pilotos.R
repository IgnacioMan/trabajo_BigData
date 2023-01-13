#importamos los datos
datos_de_pilotos <- qs::qread("./datos/drivers_2021.qs")

#cargamos los paquetes

library(tidyverse)
library(gt)

#tabla de todos los pilotos

 dt <- datos_de_pilotos %>% 
   select( c(familyName, nationality, permanentNumber))

 dt%>%
   tibble::as_tibble() %>%
   DT::datatable(filter = 'top', options = list( autoWidth = TRUE))



#tabla con foto del piloto más viejo

df_max <- datos_de_pilotos %>% select(c(driverId, dateOfBirth, nationality)) %>% slice_min(dateOfBirth,n=1)


Bandera <- "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/1920px-Flag_of_Finland.svg.png"

df_viejo <- df_max %>% add_column(Bandera)

Tabla_viejo <- df_viejo %>% gt()

Tabla_viejo <- Tabla_viejo %>%
  tab_header(title = md("**Piloto más viejo**"))

Tabla_viejo <- Tabla_viejo %>%
  tab_options(heading.background.color = "#0035A5") %>% tab_options(heading.title.font.size = 15,  column_labels.font.weight =  "bold")


Tabla_viejo <- Tabla_viejo  %>%
  gt::text_transform(locations = cells_body(columns = c(Bandera)), fn = function(x) {gt::web_image(x, height = 50)}) %>%  cols_align(
    align = "center")



Tabla_viejo


#tabla con foto del piloto más joven


df_min <- datos_de_pilotos %>% select(c(driverId, dateOfBirth, nationality)) %>% slice_max(dateOfBirth,n=1)


Bandera <- "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/1280px-Flag_of_Japan.svg.png"

df_joven <- df_min %>% add_column(Bandera)

Tabla_joven <- df_joven %>% gt()

Tabla_joven <- Tabla_joven %>%
  tab_header(title = md("**Piloto más joven**"))

Tabla_joven <- Tabla_joven %>%
  tab_options(heading.background.color = "#BA0000") %>% tab_options(heading.title.font.size = 15,  column_labels.font.weight =  "bold")


Tabla_joven <- Tabla_joven  %>%
  gt::text_transform(locations = cells_body(columns = c(Bandera)), fn = function(x) {gt::web_image(x, height = 50)}) %>%  cols_align(
    align = "center")


Tabla_joven

