library(tidyverse)
library(readxl)
library(scales)
library(questionr)


list.files("Fuentes/")

Individual_t117 <-
  read.table("Fuentes/usu_individual_t117.txt",
  sep = ";",
  dec = ",",
  header = TRUE,
  fill = TRUE )
  
  
Aglom <- read_excel("Fuentes/Aglomerados EPH.xlsx")

Datos  <- Individual_t117[c("AGLOMERADO","MAS_500","CH04","CH06","P47T","PONDERA","PONDII")]


summary(Datos) 

unique(Datos$AGLOMERADO)

sample_n(tbl = Datos,size = 9)

table(Datos$MAS_500,Datos$CH04) 

questionr::wtd.table(x = Datos$MAS_500,y = Datos$CH04,weights = Datos$PONDERA)

pepito <- Datos %>% 
  filter(CH04==1 , CH06>=50)


Datos %>% 
    filter(CH04==1| CH06>=50)

Datos <- Datos %>% 
  rename(EDAD = CH06)


Datos <- Datos %>% 
  mutate(Edad_cuadrado=EDAD^2,
         Edad_cubo =EDAD^3) 


Datos <- Datos %>% 
  mutate(Grupos_Etarios = case_when(EDAD  < 18   ~ "Menores",
                                 EDAD  %in%  18:65   ~ "Adultos",
                                 EDAD  > 65 ~ "Adultos Mayores"))
#Conservo solo 2 variables
Datos %>% 
  select(CH04,PONDERA)

#Conservo todas las variables desde la 3era
Datos %>% 
  select(3:ncol(.))

Datos <- Datos %>% 
  arrange(CH04,EDAD)


#Recuerden que los menores de un año están clasificados con el valor -1
Datos <- Datos %>% 
  mutate(edad.corregida=ifelse(EDAD == -1,yes = 0,no = EDAD))

#R BASE#
mean(Datos$edad.corregida,na.rm = T) #sin ponderar
weighted.mean(Datos$edad.corregida,Datos$PONDERA) #ponderado

#Tidyverse

Datos %>%      
 summarise(Edad_prom = mean(edad.corregida),  #sin ponderar
           Edad_prom_pond = weighted.mean(x = edad.corregida,w = PONDERA)) #ponderado


Datos %>% 
  group_by(CH04) %>%
  summarise(Edad_Prom = weighted.mean(EDAD,PONDERA))

Encadenado <- Datos %>% 
  filter(Grupos_Etarios == "Adultos") %>% 
  mutate(Sexo = case_when(CH04 == 1 ~ "Varon",
                          CH04 == 2 ~ "Mujer")) %>% 
  select(-Edad_cuadrado)
  
Encadenado

Aglom

Datos_join <- Datos %>% 
  left_join(.,Aglom, by = "AGLOMERADO")



Poblacion_Aglomerados <- Datos_join %>% 
  group_by(Nom_Aglo) %>% 
  summarise(Menores = sum(PONDERA[Grupos_Etarios=="Menores"]),
            Adultos = sum(PONDERA[Grupos_Etarios=="Adultos"]),
            Adultos_Mayores = sum(PONDERA[Grupos_Etarios=="Adultos Mayores"]))




pob.aglo.long <- Poblacion_Aglomerados %>% 
  pivot_longer(cols = 2:4,names_to = "Grupo_Etario",values_to = "Poblacion")



pob.aglo.long %>% 
  pivot_wider(names_from = "Grupo_Etario",values_from = "Poblacion")
  

Poblacion_ocupados <- Individual_t117 %>% 
  group_by(CH04,REGION) %>% 
  summarise(Poblacion         = sum(PONDERA),
            Ocupados          = sum(PONDERA[ESTADO == 1]),
            Desocupados       = sum(PONDERA[ESTADO == 2]),
            PEA = sum(PONDERA[ESTADO  %in%  1:2]),
            Asalariados = sum(PONDERA[ESTADO == 1 & CAT_OCUP == 3]),
            tasa_empleo = Ocupados/Poblacion,
            tasa_desocup= Desocupados/PEA,
            tasa_asalarizacion = Asalariados/Ocupados) %>% 
  ungroup()


variables_hogar <- Individual_t117 %>% 
  mutate(uno = 1) %>% 
  group_by(CODUSU,NRO_HOGAR) %>% 
  summarise(cant_miemb         = sum(uno),
            z_ocup          = sum(uno[ESTADO == 1]),
            z_desocupados       = sum(uno[ESTADO == 2]),
            z_PEA = sum(uno[ESTADO  %in%  1:2]),
            z_asalariados = sum(uno[ESTADO == 1 & CAT_OCUP == 3]),
            tasa_empleo = z_ocup/cant_miemb,
            tasa_desocup= z_desocupados/z_PEA,
            tasa_asalarizacion = z_asalariados/z_ocup) %>% 
  ungroup()






Empleo <- Individual_t117 %>% 
  summarise(Poblacion         = sum(PONDERA),
            Ocupados          = sum(PONDERA[ESTADO == 1]),
            Tasa_Empleo    = Ocupados/Poblacion)



Empleo %>% 
  mutate(Tasa_Empleo_Porc = scales::percent(Tasa_Empleo))

## dir.create("Resultados")
## openxlsx::write.xlsx(x = Empleo,file =  "Resultados/miexportacion.xlsx")
