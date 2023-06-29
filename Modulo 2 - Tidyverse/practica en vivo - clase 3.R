library(tidyverse)
library(eph)
Individual_t117 <-
  read.table("Fuentes/usu_individual_t117.txt",
             sep = ";",
             dec = ",",
             header = TRUE,
             fill = TRUE )
#Individual_t1217 <- eph::get_microdata(year = 2017,trimester = 1)

Individual_t217 <- eph::get_microdata(year = 2017,trimester = 2)

table(Individual_t117$CH14,useNA = "always")
class(Individual_t117$CH14)

Individual_t117 <- Individual_t117 %>% 
  mutate(CH14 = as.character(CH14))

class(Individual_t117$CH14)

base_dos_trimestres<- bind_rows(
  Individual_t117 %>% select(ANO4,TRIMESTRE,CODUSU,NRO_HOGAR,
                             ESTADO,CAT_OCUP,PONDERA,CH14),
  Individual_t217 %>% select(ANO4,TRIMESTRE,CODUSU,NRO_HOGAR,
                             ESTADO,CAT_OCUP,PONDERA,CH14)
  )

variables_hogar <- base_dos_trimestres %>% 
  mutate(uno = 1) %>% 
  group_by(CODUSU,NRO_HOGAR,ANO4,TRIMESTRE) %>% 
  summarise(cant_miemb         = sum(uno),
            z_ocup          = sum(uno[ESTADO == 1]),
            z_desocupados       = sum(uno[ESTADO == 2]),
            z_PEA = sum(uno[ESTADO  %in%  1:2]),
            z_asalariados = sum(uno[ESTADO == 1 & CAT_OCUP == 3]),
            tasa_empleo = z_ocup/cant_miemb,
            tasa_desocup= z_desocupados/z_PEA,
            tasa_asalarizacion = z_asalariados/z_ocup) %>% 
  ungroup()


