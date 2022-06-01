## PROYECTO FINAL: Patologia de la sepsis bacteriana ##

# Maria Fernanda Martinez Garcia (264683)
# Enrique Franco Garcia (259366)
# Rebeca Vega Escamilla (264680)

# Segunda parte: Script de taxa

#### 1. Librerias ####
# Hicimos uso de las mismas librerias que en la primer parte

#### 2. Base de datos ####
tax_mat<- read_excel("taxa.xlsx")
tax_mat

# En esta tabla se observan algunas de las bacterias principales observadas en la sepsis.

#### 3. Objeto Phyloseq ####

# Idem para la matriz:
tax_mat <- tax_mat %>% 
  tibble::column_to_rownames("taxa")

# Transformamos a matriz:
tax_mat <- as.matrix(tax_mat)
class(tax_mat)

# Transformamos a objeto phyloseq:
TAX = tax_table(tax_mat)
taxones<-phyloseq(TAX)

tax_tablee <- cbind(taxones, rownames(taxones))
tax_tablee

tax_mat = matrix(sample(letters, 70, replace = TRUE), nrow = nrow(otu_mat), ncol = 7)
rownames(tax_mat) <- rownames(otu_mat)

# Re-nombramos las columnas:
colnames(tax_mat) <- c("domain", "phylum", "class", "order", "family", "genus", "species")
tax_mat
