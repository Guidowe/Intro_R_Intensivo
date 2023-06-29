individual_t117 <- read.table(file = 'Fuentes/usu_individual_t117.txt',
                              sep=";",
                              dec=",",
                              header = TRUE, 
                              fill = TRUE)

individual_t119 <- read.table(file = 'Fuentes/usu_individual_t119.txt',
                              sep=";",
                              dec=",",
                              header = TRUE, 
                              fill = TRUE)
6+6
A <- 1
A 

A + 6

B <- 2
B

A <- B

#Ahora A toma el valor de B, y B continua conservando el mismo valor
A   
B

#suma 
A <- 5+6
A
#Resta
B <- 6-8
B
#cociente
C <- 6/2
C
#multiplicacion
D <- 6*2
D

E <- 3^3
E

#Redefinimos los valores A y B
A <- 10
B <- 20

#Realizamos comparaciones lógicas
A > B
A >= B
A < B
A <= B
A == B
A != B

C <- A != B
C

#Redefinimos los valores A y B
A <- 10
B <- 20
#Realizamos comparaciones lógicas

(A | B) > 30
(A & B) <= 30

A <- 1
class(A)

A <- "Hola"
class(A)

A <- "Hola, ¿qué tal?"
class(A)

A <- paste('Hola,', '¿qué tal?', sep = " ")
A
class(A)

valor1 <- "A"
class(valor1)

valor2 <- factor("A")
valor2

# Otra forma de definir al factor
valor2 <- factor(valor1)
valor2
class(valor2)

# Una propiedad del factor: las etiquetas.
valor3 <- factor("A",
                 labels = "Letra A")
class(valor3)
valor3


# Vector numérico
A <- c(1, 2, 2, 2, 1, 1, 1)
A
class(A)

# Vector de caracteres
B <- c("Uno", "Dos", "Dos", "Dos", "Uno", "Uno", "Uno")
B
class(B)

# Vector de tipo factor
C <- as.factor(A)
C
class(C)

# Defino etiquetas del vector numérico o caracter
A
A_etiquetas <- factor(A,
                     labels = c('Varón','Mujer'))
A_etiquetas

D <- c(1, 3, 4)
D <- D + 2
D

E <- D + 1:3 #esto es equivalente a hacer 3+1, 5+2, 6+9 
E

# Si quiero al elemento 2 del objeto E:
E 
E[2]

E_posicion2 <-  E[2]
E_posicion2

rm(E_posicion2)
E_posicion2

E
E[2] <- "Pablo"
E

# Tener cuidado al modificar el tipo de uno de los valores y no el de todos los del objeto:
class(E)

AGLOMERADO  <- c(32,33,33,33,32)

SEXO  <-  c("Varon","Mujer","Mujer","Varon","Mujer")

EDAD  <-  c(60,54,18,27,32)

Datos <- data.frame(AGLOMERADO, SEXO, EDAD)
Datos
class(Datos)

Datos[3,2]
Datos[4,3]

Datos$AGLOMERADO
class(Datos$AGLOMERADO)

Datos$AGLOMERADO[2]

Datos$AGLOMERADO[3,2]

Datos[Datos$AGLOMERADO==32, ]

###Por separado
Edad_Aglo32 <- Datos$EDAD[Datos$AGLOMERADO==32]
Edad_Aglo32

mean(Edad_Aglo32)

# Otra forma de lograr el mismo resultado
mean(Datos$EDAD[Datos$AGLOMERADO==32])

LISTA <- list(A,B,C,D,E,Datos$AGLOMERADO, DF = Datos)
LISTA

LISTA$DF
LISTA$DF$EDAD
LISTA$DF$EDAD[2]

LISTA[[6]]

LISTA[[6]][1]

LISTA[[7]][2]

LISTA[[7]][2,1]

paste("Pega","estas", 4, "palabras", sep = " ")

#Puedo concatenar caracteres almacenados en objetos
a <- c(1, 2, 3)
b <- "con"
c <- c(4, 5, 6)

paste(a,b,c,sep = "-")

# Paste0 pega los caracteres sin separador
paste0(a,b,c)

# ¿Te acordás del comando que usamos?
1:5

# Función para sumar
sum(1:5)

# Para calclar medias
mean(1:5)


#View(individual_t117) # Abre la base en una ventana aparte

names(individual_t117)[1:10] # Devuelve el nombre de  las variables. Le pido solo los primeros 10

summary(individual_t117)[ ,c(8,10,31,133)] # Devuelve algunas medidas de resumen. Le pido ciertas columnas

head(individual_t117)[ ,1:5] # Devuelve sólo los primeros valores para las columnas seleccionadas

unique(individual_t117$REGION)# Muestra los únicos valores que toma una variable

# Notar que seguimos utilizando funciones de R base ya que no necesitamos cargar ningún 'paquete' para utilizarlos

# install.packages("openxlsx") # por única vez

# Activamos la librería para poder usar sus funciones
library(openxlsx) 

# Creamos una tabla cualquiera de prueba
x <- 1:10
y <- 11:20
tabla_de_R <- data.frame(x, y)
tabla_de_R

# Escribimos el archivo
write.xlsx( x = tabla_de_R, file = "archivo_tabla.xlsx",
            row.names = FALSE)

getwd()

## setwd("C:/Users/usuario/Desktop/Guido/Trabajo/Cursos Intro a R/Fuentes")
