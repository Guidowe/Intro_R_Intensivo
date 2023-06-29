# Intro a R con EPH
Los materiales para la cursada se encuentran estructurados por módulos.
Descarguen todos los materiales en conjunto, con el botón de __Download.zip__ que figura arriba. 
En caso de que incorporemos nuevos materiales, les aviso y añado otro botón de descarga.

#### Librerias a instalar
A lo largo del curso utilizaremos librerías complemetarias al lenguaje RBase. Con la siguiente línea de código se pueden instalar las principales de ellas:
```
install.packages(c("tidyverse","readxl","openxlsx","scales","questionr",'ggthemes','ggrepel','ggalt','kableExtra','stringr','lubridate','eph','esquisse','rmarkdown'))
```

# Programa

### Módulos y contenidos


__Módulo 1 – R Base:__
 
+ Temas de clase:
  + Descripción del programa “R”. Lógica sintáctica del lenguaje y comandos básicos
  + Presentación de la plataforma RStudio para trabajar en “R”
  + Caracteres especiales en “R”
  + Operadores lógicos y aritméticos
  + Definición de Objetos: Valores, Vectores y DataFrames
  + Tipos de variable (numérica, de caracteres, lógicas)
  + Lectura y Escritura de Archivos
  

__Módulo 2 - Tidyverse__

+ Temas de clase:
  + Limpieza de Base de datos: Renombrar y recodificar variables, tratamiento de valores faltantes (missing values/ NA´s)
  + Seleccionar variables, ordenar y agrupar la base de datos para realizar cálculos
  + Creación de nuevas variables, filtros y uniones de bases de datos
  + Construir medidas de resumen de la información
+ Aplicaciones:   
  + Cálculo de tasas básicas del mercado de trabajo (tasa de actividad, empleo, desempleo, entre otras) 
  + Cálculo de tasas para distintos subconjuntos poblacionales (por aglomerado, sexo, grupos de edad)
  + Estimación de indicadores asociados a la precariedad laboral
  + Unión de información de la base individual con información de la base de hogares


__Módulo 3 - Visualización de la información__  

+ Temas de clase:
  + Gráficos básicos de R (función “plot”): Comandos para la visualización ágil de la información
  + Gráficos elaborados en R (función “ggplot”): 
    + Gráficos de línea, barras, Boxplots 
    + Extensiones de ggplot

  
__Módulo 4: Documentación en R. Generación de reportes/informes.__

+ Temas de clase:
  + Manejo de las extensiones del software “Rmarkdown” y “RNotebook” para elaborar documentos de trabajo, presentaciones interactivas e informes:
    + Opciones para mostrar u ocultar código en los reportes
    + Definición de tamaño, títulos y formato con el cual se despliegan los gráficos y tablas en el informe
    + Caracteres especiales para incluir múltiples recursos en el texto del informe: Links a páginas web, notas al pie, enumeraciones, cambios en el formato de letra (tamaño, negrita, cursiva)
    + Código embebido en el texto para automatización de reportes


# Bibliografía complementaria

- [Grolemund, G. y Wickham, H. (2019), R para Ciencia de Datos](https://es.r4ds.hadley.nz)

- [Wickham, H. (2016), ggplot2: elegant graphics for data analysis. Springer, 2016. ](https://ggplot2-book.org/)

- [Vázquez Brust, A. (2019), Ciencia de Datos para Gente Sociable](https://bitsandbricks.github.io/ciencia_de_datos_gente_sociable/)

- [Wickham, H. (2019), The tidyverse style guide](https://style.tidyverse.org/)

- INDEC(2003), La nueva Encuesta Permanente de Hogares de Argentina. 2003
