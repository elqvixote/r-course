data <- read.csv("~/Roberto/RCursoML_Udemy/RCursoML/r-course/data/tema1/missing-data.csv",
                 na.strings = "")


#Para crear una columna dónde coloque el valor Income y si encuentra un NA coloca promedio

data$Income.mean <- ifelse(is.na(data$Income),
                           mean(data$Income, na.rm = TRUE),
                           data$Income)
