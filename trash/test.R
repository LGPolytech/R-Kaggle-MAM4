# %% [markdown] {"_execution_state":"idle","papermill":{"duration":0.003728,"end_time":"2023-03-10T22:42:11.165497","exception":false,"start_time":"2023-03-10T22:42:11.161769","status":"completed"},"tags":[]}
# ## **Kaggle Challenge**
# 
# ## Partie 1
# 
# ---
# #### *Ecrit par :*
# 
# ### GANDEEL Lo'aï, SIEGEL Tom, GENOUD-DUVILLARET Benoît
# MAM 4 
# 
# 
# 

# %% [markdown] {"papermill":{"duration":0.002662,"end_time":"2023-03-10T22:42:11.170971","exception":false,"start_time":"2023-03-10T22:42:11.168309","status":"completed"},"tags":[]}
# ## **Introduction : analyse du dataset**
# 
# La base du **Kaggle challenge** repose sur le choix du dataset choisi. Nous avons décidé de nous baser sur le dataset suivant : [Diabetes Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset). Voici un déscriptif rapide du dis dataset :
# 
# Il s'agit d'un sous-dataset d'un dataset original créé par le [CDC](https://en.wikipedia.org/wiki/Centers_for_Disease_Control_and_Prevention), le Centre pour le contrôle et la prévention des maladies aux USA. Ce dataset original a été créé a partir du "Behavioral Risk Factor Surveillance System" ([BRFSS](https://www.cdc.gov/brfss/index.html)), qui est un sondage téléphonique collecté et compilé annuellement par le CDC. Notre dataset est basé sur le sondage BRFSS de l'année 2015, plus particulièrement sur les indicateurs des risques de développement d'un diabète.
# Notre dataset est séparé en trois sous-dataset, qui contiennent eux même 22 variables différents que voici :
# 
# - Diabetes_012        : L'individue est sain (0), pré-diabétique (1) ou diabétique (2)
# - Diabete_binary      : L'individue est sain (0), ou diabétique (1) (on exclus les pré-diabétique).
# - HighBP              : La tension artérielle de l'individu est élevée (1 (>140mmHj)) ou non (0). 
# - HighChol            : Le taux de choléstérol de l'individu est élévé (1) ou non (0)
# - CholCheck           : Le taux de choléstérol de l'individu à été véréfié dans les 5 dérnières années (1) ou non (0)
# - BMI                 : L'indice de masse corporelle de l'individu
# - Smoker              : L'individu a-t-il déjà fumé plus de 100 cigarettes (5 paquets) au cours de sa vie ? oui (1), non (0)
# - Stroke              : L'individu a-t-il déjà fais un AVC ? oui(1), non(0)
# - HeartDiseaseorAttack: L'individu a-t-il une maladie coronarienne ou fait un AVC ? oui (1), non(0)
# - PhysActivity        : L'individu a-t-il fait une activité sportive (hors travail) dans les 30 derniers jours ? oui(1), non(0)
# - Fruits              : L'individu consomme-t-il au moins un fruit par jour ? oui(1), non(0)
# - Veggies             : L'individu consomme-t-il au moins un légume par jour ? oui(1), non(0)
# - HvyAlcoholConsump   : L'individu est-il un grand consommateur d'alcool ? (hommes adultes buvant plus de 14 verres par semaine et femmes adultes buvant plus de 7 verres par semaine) oui(1), non(0)
# - AnyHealthcare       : Lindividu a-t-il une couverture de soins de santé (n'importe laquelle) ? Oui(1), non(0)
# - NoDocbcCost         : L'individu a-t-il été dans l'incapacité d'aller voir un professionnel de santé en raison de ses moyens ? Oui(1), non(0)
# - GenHlth             : Description générale de la santé de l'individu : Excellent(1)/Very good(2)/Good(3)/Fair(4)/Poor(5)
# - MentHlth            : Jours de mauvaise santé mentale des individus sondés depuis les 30 derniers jours. (1-30)
# - PhysHlth            : Jours de mauvaise santé physique des individus sondés depuis les 30 derniers jours. (1-30)
# - DiffWalk            : L'individu a-t-il du mal à marcher ou à monter les escaliers ? Oui(1), non(0)
# - Sex                 : Sex de l'individu : homme(1), femme(0)
# - Age                 : Âge de l'individu : 13 catégories d'âge (séparées tous les 5 ans) : de '18-24' ans à '80+'
# - Education           : Niveau d'éducation de l'individu (categorisé de 1 à 6)
# - Income              : Revenus de l'individu (categorisé de 1 à 8) : 1 :10,000 dollars ou moins, 2:  10,000 dollars à 15,000 dollars, 3: 15,000 à 20,000 dollars, 4:  20,000 à 25,000 dollars, 5: 25,000 à 35,000 dollars, 6: 35,000 à 50,000 dollars, 7: 50,000 à 75,000 dollars, 8: 75,000 dollars ou plus.
# 
# 
# Le premier dataset représente les patients sains, prédiabétiques ou diabétiques.
# Le deuxième et le troisième dataset présente uniquement des patients sains ou diabétiques.

# %% [markdown] {"papermill":{"duration":0.002671,"end_time":"2023-03-10T22:42:11.176240","exception":false,"start_time":"2023-03-10T22:42:11.173569","status":"completed"},"tags":[]}
# ### **1 - Objectif d'affaire**
# 
# Notre objectif avec ce dataset serait à terme de pouvoir prévenir le développement du diabète chez une population encore saine.
# 
# Quels sont les facteurs de risque les plus prédictifs du risque de développement du diabète ? Le niveau de vie (salaire, éducation, etc..) est-il un facteur plus impactant que l'hygiène de vie sur ce risque ? 
# 
# Pouvons-nous utiliser un sous-ensemble de facteurs de risque pour prédire avec précision si une personne est atteinte de diabète ?
# 
# Pouvons-nous créer un sondage plus cours à partir du BRFSS en utilisant la sélection de fonctionnalités pour prédire avec précision si une personne pourrait être atteinte de diabète ou si elle présente un risque élevé de diabète ?

# %% [markdown] {"papermill":{"duration":0.002552,"end_time":"2023-03-10T22:42:11.181448","exception":false,"start_time":"2023-03-10T22:42:11.178896","status":"completed"},"tags":[]}
# ### **2 - Objectif technique**
# 
# Notre objectif technique avec ce dataset est l'application de la regression logistique afin de déterminer le facteur qui caractérisent les personnes diabétiques des personnes qui ne le sont pas. La regression logistique est un outil très utilisé en médecine et c'est pourquoi nous voulons l'utiliser.
# 
# Un autre de nos objectif est d'utiliser le deeplearning comme méthode d'analyse avancé de donnée, étant donné que notre dataset semble parfaitement s'y préter (données médicales, trois dataset (train, validation, test))

# %% [markdown] {"papermill":{"duration":0.002575,"end_time":"2023-03-10T22:42:11.186608","exception":false,"start_time":"2023-03-10T22:42:11.184033","status":"completed"},"tags":[]}
# ### **3 - Analyse statistique des données**

# %% [markdown] {"papermill":{"duration":0.002609,"end_time":"2023-03-10T22:42:11.191892","exception":false,"start_time":"2023-03-10T22:42:11.189283","status":"completed"},"tags":[]}
# On a tout d'abord beosin de nettoyer nos dataset des données "NA" ou "inf", c'est-à-dire les données inexistantes ou infinies.
# 
# ### Chargement des datasets

# %% [code] {"papermill":{"duration":3.898324,"end_time":"2023-03-10T22:42:15.092841","exception":false,"start_time":"2023-03-10T22:42:11.194517","status":"completed"},"tags":[]}
diabete_dataset1 <- read.csv("/kaggle/input/diabetes-health-indicators-dataset/diabetes_012_health_indicators_BRFSS2015.csv", stringsAsFactors = TRUE, skipNul = TRUE, na.strings = c(""))
diabete_dataset2 <- read.csv("/kaggle/input/diabetes-health-indicators-dataset/diabetes_binary_5050split_health_indicators_BRFSS2015.csv", stringsAsFactors = TRUE, skipNul = TRUE, na.strings = c(""))
diabete_dataset3 <- read.csv("/kaggle/input/diabetes-health-indicators-dataset/diabetes_binary_health_indicators_BRFSS2015.csv", stringsAsFactors = TRUE, skipNul = TRUE, na.strings = c(""))


# %% [markdown] {"papermill":{"duration":0.002757,"end_time":"2023-03-10T22:42:15.098613","exception":false,"start_time":"2023-03-10T22:42:15.095856","status":"completed"},"tags":[]}
# ### Dataset avant nettoyage

# %% [code] {"papermill":{"duration":0.2964,"end_time":"2023-03-10T22:42:15.397720","exception":false,"start_time":"2023-03-10T22:42:15.101320","status":"completed"},"tags":[]}
summary(diabete_dataset1)
#summary(diabete_dataset2)
#summary(diabete_dataset3)

# %% [code] {"papermill":{"duration":0.807756,"end_time":"2023-03-10T22:42:16.208550","exception":false,"start_time":"2023-03-10T22:42:15.400794","status":"completed"},"tags":[]}
library(tidyr)

# On vérifie si nous avons des données inexistantes ou infinies dans notre dataset n°1

cat(" NA value in our dataset :" , sum(is.na(diabete_dataset1)))
cat(" \nInf value in our dataset :" , sum(as.integer(as.logical(apply(diabete_dataset1, 2, function(x) any(is.infinite(x)))))))

# On vérifie si nous avons des données inexistantes ou infinies dans notre dataset n°2

cat(" \nNA value in our dataset :" , sum(is.na(diabete_dataset1)))
cat(" \nInf value in our dataset :" , sum(as.integer(as.logical(apply(diabete_dataset1, 2, function(x) any(is.infinite(x)))))))

# On vérifie si nous avons des données inexistantes ou infinies dans notre dataset n°3

cat(" \nNA value in our dataset :" , sum(is.na(diabete_dataset1)))
cat(" \nInf value in our dataset :" , sum(as.integer(as.logical(apply(diabete_dataset1, 2, function(x) any(is.infinite(x)))))))

# %% [markdown] {"papermill":{"duration":0.00391,"end_time":"2023-03-10T22:42:16.216225","exception":false,"start_time":"2023-03-10T22:42:16.212315","status":"completed"},"tags":[]}
# On remarque qu'il n'y a aucune données manquante ou infini, nul besoin de retirer des lignes.

# %% [code] {"papermill":{"duration":0.03643,"end_time":"2023-03-10T22:42:16.256316","exception":false,"start_time":"2023-03-10T22:42:16.219886","status":"completed"},"tags":[]}
str(diabete_dataset1)
#str(diabete_dataset2)
#str(diabete_dataset3)

# %% [markdown] {"papermill":{"duration":0.003185,"end_time":"2023-03-10T22:42:16.262918","exception":false,"start_time":"2023-03-10T22:42:16.259733","status":"completed"},"tags":[]}
# Toutes les données sont numériques, nul besoin de convertir quoi que ce soit. De plus, il semblerait logique que les réponses d'un sondage puisse donner des doublons au niveau des lignes, on garde donc les doublons dans nos datasets.

# %% [markdown] {"papermill":{"duration":0.002964,"end_time":"2023-03-10T22:42:16.268941","exception":false,"start_time":"2023-03-10T22:42:16.265977","status":"completed"},"tags":[]}
# ### Analyse
# 
# On sait que nos trois dataset n'ont pas exactement les même paramètres. Il serait intéressant d'analyser l'imapct des variables sur la différenciation entre sain et prédiabétique. En effet, si on veut analyser les paramètres les plus impactant sur le risque de développer un diabète, il faut regarder si les comportements impacte différemment le nombre de prédiabétique et de diabétique. En effet, les diabétiques peuvent changer de comportement une fois leur diabète développer.

# %% [markdown]
# ### 2. Sélection des paramètres 

# %% [markdown]
# ### Libraries 

# %% [code]
#install.packages("ggplot2")
#install.packages("scales")
#install.packages("reshape2")

# %% [markdown]
# ### Quels sont les facteurs de risque les plus prédictifs du risque de développement du diabète ? 
# 
# Déjà observons le pourcentage de diabétiques présents dans nos différentes bases de données :

# %% [code] {"papermill":{"duration":0.002948,"end_time":"2023-03-10T22:42:16.274910","exception":false,"start_time":"2023-03-10T22:42:16.271962","status":"completed"},"tags":[]}
library(ggplot2)
library(scales)


plot_pie <- function(data, variable) {
  # Calculer les fréquences de chaque valeur de la variable
  freq <- table(data[[variable]])
  
  # Calculer les pourcentages correspondants
  percent <- round(prop.table(freq) * 100, 1)
  
  # Tracer le camembert avec les pourcentages
  pie(freq, main = paste("Fréquences de", variable), labels = paste(names(freq), " (", percent, "%)", sep = ""))
}


#diabete_dataset1 
#diabete_dataset2
#diabete_dataset3
plot_pie(diabete_dataset1, colnames(diabete_dataset1[1]))
plot_pie(diabete_dataset2, colnames(diabete_dataset2[1]))
plot_pie(diabete_dataset3, colnames(diabete_dataset3[1]))

# %% [markdown]
# ### Camemberts :

# %% [code]
# Rename the function to be more descriptive
plot_binary_diabetes <- function(df, diabete, var) {
  
  # Define colors as a constant vector
  colors <- c('#D81B60', '#1E88E5')
  
  # Use `table()` to calculate contingency table
  table <- table(df[[diabete]], df[[var]])
  
  # Sum the rows of the contingency table
  sum_table <- rowSums(table)
  
  # Print the sum table and percentage table
  #print(sum_table)
  #print(table/sum_table)
  
  # Calculate the percentage table by dividing each cell by its row sum
  var_count <- table/sum_table
  
  # Reverse the order of the columns in the percentage table
  var_count <- var_count[, ncol(var_count):1]
  
  # Printing the name of the dataframe
  print(deparse(substitute(df)))
  
  # Making some arangements
  if (deparse(substitute(df)) == "diabete_dataset1") {
    names <- c("Non-Diabetic", "Pre-Diabetic", "Diabetic")
  }
  else {
    names <- c("Non-Diabetic", "Diabetic")
  }
  
  # Use `barplot()` to create a stacked bar chart
  # Add descriptive labels to the chart
  # Use `barplot()` to create a stacked bar chart
  # Add descriptive labels and percentage values to the chart
  bp <- barplot(t(as.matrix(var_count)), # Transpose for having the column sum equal to 1
                horiz = TRUE, 
                col = colors, 
                xlim = c(0,1), 
                xlab = "Percentage", 
                ylab = "", 
                main = paste("Percentage of", var, "by",diabete,"status"), 
                names.arg = names, 
                args.legend = list(bty = "n"))
  
  print(var_count)
  # Add percentage values to the right side of the chart using the `text()` function
  par(mar = c(5, 7, 4, 2) + 0.1) # Increase the right margin to create more space for the labels
  text(x = var_count[,1] , y = bp, labels = paste0(round(var_count[,1]*100),"%"), col = "white", pos = 2)
}

plot_binary_diabetes(diabete_dataset1, colnames(diabete_dataset1[1]), colnames(diabete_dataset1[2]))
plot_binary_diabetes(diabete_dataset2, colnames(diabete_dataset2[1]), colnames(diabete_dataset2[2]))
plot_binary_diabetes(diabete_dataset3, colnames(diabete_dataset3[1]), colnames(diabete_dataset3[2]))

# %% [markdown]
# ### Histogrammes : 

# %% [code]
plot_histograms <- function(df) {
  # Get the column names of the data frame
  column_names <- colnames(df)
  
  # Loop through each column and create a histogram
  for (column in column_names) {
    hist(df[[column]], freq = FALSE, main = column, xlab = column)
    # Add a density plot to the histogram
    lines(density(df[[column]]), col = "blue") # lignes
    abline(v = mean(df[[column]]), col = "red") # Moyennes
    abline(v = median(df[[column]]), col = "green")
  }
}
#plot_histograms(diabete_dataset1)
#plot_histograms(diabete_dataset2)
#plot_histograms(diabete_dataset3)

# %% [markdown]
# ### Correlation map (à finir) 

# %% [code] {"execution":{"iopub.status.busy":"2023-03-11T12:10:10.401943Z","iopub.execute_input":"2023-03-11T12:10:10.403452Z","iopub.status.idle":"2023-03-11T12:10:11.733483Z"}}
library(reshape2)

correlation_map <- function(df) {
  # Set up the data and colormap
  data_heatmap <- diabete_dataset1
  custom_cmap <- colorRampPalette(c('#011b7a', 'white', '#850505'))(100)
  
  # Create a correlation matrix
  corr_matrix <- cor(data_heatmap)
  
  # Create a mask to hide the upper triangle of the matrix
  mask <- upper.tri(corr_matrix)
  
  # Melt the matrix into a data frame
  corr_df <- melt(corr_matrix)
  
  # Create the heatmap plot
  ggplot(corr_df, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile(aes(width = 1, height = 1), color = "white", alpha = 0.8) +
    scale_fill_gradientn(colors = custom_cmap, limits = c(-0.8, 0.8)) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 15),
          axis.text.y = element_text(size = 15),
          axis.title = element_blank(),
          legend.position = "none") +
    labs(title = "Correlation Heatmap", subtitle = "", x = "", y = "") +
    coord_fixed() +
    guides(fill = guide_colorbar(barwidth = 25, barheight = 0.5, 
                                 title.position = "top", title.vjust = 0.5, 
                                 label.theme = element_text(size = 15)))
  
}


correlation_map(diabete_dataset1)

correlation_map(diabete_dataset2)

correlation_map(diabete_dataset3)