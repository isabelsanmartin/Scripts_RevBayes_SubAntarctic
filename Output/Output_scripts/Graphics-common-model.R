
table <- read.table(file="/.../Ouput_BIB/Common_model.csv", header = TRUE) 
plot(x=table$Iteration, y=table$Posterior) 
burnstart <- floor(0.10*nrow(table)) 
burnstart <- floor(0.20*nrow(table)) 
postburn <- table[burnstart:nrow(table),] 
plot(x = postburn$Iteration, y=postburn$Posterior) 
summary(postburn)

## Carrying Capacity

ex <- cbind(postburn[,31:51])

#  0 = South America, 1 = Falkland, South Georgia, 2 = Southern biogeographic province, Macquarie, 3=AU/NZ

colnames(ex) <- c(
                      "SA-GF",
                      "SA-EAA",
                      "SA-NEOZ",
                      "GF-EAA",
                      "GF-NEOZ",
                      "EAA-NEOZ"
                     )

boxplot(ex, las = 2, cex.axis = 0.7)
title("Exchange rate per island")

## Exchange rates

cc <- cbind(postburn[24:30])
colnames(cc) <- c(
  "Mainland",
  "Falkland",
  "South Georgia",
  "SIOBP",
  "NeoZ Islands"
)

boxplot(cc, las = 2, cex.axis = 1)
title("Carrying Capacity")

## Migration rates per species
mr <- cbind(postburn[,5:23])
colnames(mr) <- c(
  "Acaena",
  "Azorella",
  "Colobanthus",
  "Pringlea",
  "Polystichum",
  "Notogrammitis",
  "Austroblechnum"
)

boxplot(mr, las = 2, cex.axis = 0.75)
title("Migration Rates")
