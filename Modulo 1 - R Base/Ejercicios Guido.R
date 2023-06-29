#Ejercicios clase 1
base_eph <- read.table(file = "Fuentes/usu_individual_t117.txt",
                       sep = ";",
                       header = TRUE,dec = ",")
mis_variables <- c("CODUSU","P21","CH04","CH06")
basista <- base_eph[,mis_variables]
