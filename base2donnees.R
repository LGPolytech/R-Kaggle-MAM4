us_accident <- read.csv('US_Accidents_Dec21_updated.csv')

#data(us_accident) # Chargement d'une base de donnée

dim(us_accident) # Nombre de ligne et nbr de variable

class(us_accident) # Type d'objet que l'on traite

summary(us_accident) # Résumé statistique par colone de la base de données

head(us_accident) # 

sapply(us_accident, class) # comme apply ci-dessus mais appliqué à chaque vecteur de iris