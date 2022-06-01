## PROYECTO FINAL: Patologia de la sepsis bacteriana ##

# Maria Fernanda Martinez Garcia (264683)
# Enrique Franco Garcia (259366)
# Rebeca Vega Escamilla (264680)

# Primera parte: Script de otus

#### 1. Librerias ####
library(MGnifyR)
library(vegan)
library(ggplot2)
library(phyloseq)
library(readxl)
library(dplyr)
library(tibble)
library(igraph)
library(igraphdata)
library(biomformat)
library(BiodiversityR)
library(microbiome)

#### 2. Base de datos ####

# La base de datos se obtuvo de Cytoscape, esta en genemania, donde...
# ...aparte de darte la base de datos menciona de donde se obtuvo tal informacion: el articulo que coloque en GitHub.

otu_mat <- read_excel("proyecto_sepsis1.xlsx")
otu_mat 

# Se observan las proteínas que se ven activadas ante la presencia de las distintas bacterias que ocasionan un ataque de sepsis. 
# Específicamente menciona qué organelo de la célula está siendo afectado y qué órgano se ve afectado. 
# Los números representan el número de conexiones promedio.

### 3. Convertirlo a objeto Phyloseq y su abundancia ####

# Definimos los nombres de las filas de la columna otu:
otu_mat <- otu_mat %>%
  tibble::column_to_rownames("otu") 

# Se transforman en matrices otu:
otu_mat <- as.matrix(otu_mat)

#Transformamos a objetos phyloseq y realizamos tablas de abundancia:
OTU = otu_table(otu_mat, taxa_are_rows = TRUE)
sep<-phyloseq(OTU)
plot_bar(sep) # grafica de abundancia
# Muestra la abundancia sobre qué órganos y organelos afectan más.

OTUU = otu_table(otu_mat, taxa_are_rows = FALSE)
sepp<-phyloseq(OTUU)
plot_bar(sepp) # grafica de abundancia
# Muestra la abundancia sobre qué proteínas son las que se activan ante un ataque de sepsis.

#### 4. Riqueza ####
richness <- colSums(as.matrix(sep) != 0) 
richness
plot(richness) # grafica de riqueza

#### 5. Heatmap y barplot ####
heatmap(OTU) 
heatmap(OTUU)
barplot(OTU)

####
rownames(otu_mat) <- paste0("OTU", 1:nrow(otu_mat))
colnames(otu_mat) <- paste0("Sample", 1:ncol(otu_mat))
otu_mat

#### Extra: Red de genes ####
# La red se realizo en Cytoscape, con una base de datos que nos proporciono.
# Tiene 30 nodos y 332 conexiones-edges.
