auto <- read.csv("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/auto-mpg.csv",
                 header = TRUE, sep = ",")
names(auto)

#install.packages("XML")

url <- "~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/cd_catalog.xml"

xmldoc <- xmlParse(url)
rootnode <- xmlRoot(xmldoc)
#Para consultar el primer elemento
rootnode[1]

#Para extraer valores de un xml
cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))

#Hacemos unas tranposición para convertir filas en columnas
cds.catalog <- data.frame(t(cds_data), row.names = NULL)
