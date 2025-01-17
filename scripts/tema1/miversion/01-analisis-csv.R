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

#Hacemos unas tranposici�n para convertir filas en columnas
cds.catalog <- data.frame(t(cds_data), row.names = NULL)


#investigar xpathSApply() getNodeSet()

#ejercicios con html Hay que activarla libreria XML
population_url <- "~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/WorldPopulation-wiki.htm"
tables <- readHTMLTable(population_url)
View(tables)
most_populated <- tables[[6]]
head(most_populated,3)

#una forma de hacerlo sin necesidad de cargar todas las tablas
# si se sabe la posici�n de la tabla de inter�s
custom_table <- readHTMLTable(population_url,which = 6)

#Si da problemas para leer p�ginas web
#library(xml)
#datos = readHTMLTable("<<pon aqu� tu URL>>")
datos = readHTMLTable("www.minem.gob.pe/_estadisticaSector.php?idSector=1&idCategoria=10")
View(datos)

#Json
#library(jsonlite)
dot.1 <- fromJSON("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/students.json")
dot.2 <- fromJSON("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/student-courses.json") 
#library(curl)
url <- "http://www.floatrates.com/daily/usd.json"
currencies <- fromJSON(url)

currencies[["eur"]][["name"]]
currencies[[c(1:1),]][[c(1:1),]]
currencie.data <- currencies$brl
currencie.data[,1:3]

dot.1[c(2,5,6),]