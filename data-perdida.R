#Para cambiar los vacíos por variables N/A

data <- read.csv("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/missing-data.csv",
                 na.strings = "")
#elimina las filas con N/A
data.cleaned <- na.omit(data)

#Para saber si hay datos faltantes por fila
complete.cases(data)

