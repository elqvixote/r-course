data <- read.csv("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/missing-data.csv",
                 na.strings = "")


#Para crear una columna dónde coloque el valor Income y si encuentra un NA coloca promedio

data$Income.mean <- ifelse(is.na(data$Income),
                           mean(data$Income, na.rm = TRUE),
                           data$Income)
#-------------------------
#REMOVER DUPLICADOS

#Creando un Data Frame
family.salary <- c(4000,6000,5000,8000,6000,7000,6000)
family.size <- c(4,3,2,2,3,4,3)
family.car <- c("Lujo","Compacto", "Utilitario","Lujo",
                "Compacto","Compacto","Compacto")

family <- data.frame(family.salary,family.size,family.car)
family
# Para eliminar los datos duplicados
unique(family)
# o family.unique <- unique(family)

#Devuelve booleanos
family.boleano <- duplicated(family)
#Para seleccionar las filas duplicadas
family[duplicated(family),]

#----------------------------------
#Reescalado de datos
#library(scales)

students <- read.csv("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/data-conversion.csv")
students
#Se inserta una nueva columna con los reescalados
students$reescalado <- rescale(students$Income)
students

#por defecto reescala de 0 a 1.Si se quiere cambiar el rango
#en este caso de 0 a 100
rescale(students$Income, to = c(0,100))

#----------------------------
#Reescalado simultáneo de varias variables
rescale.many <-function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  cat(paste("Hemos reescalado", length(cols)," variable(s)"))
  dataframe
}

students <- rescale.many(students, c(1,4))