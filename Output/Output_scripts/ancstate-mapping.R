##### INDIVIDUAL BIB MODELS ######
#################################

setwd("E:/01_SUBANTARCTIC/04_Biogeo/MarionModel/BIB_ind/Pringlea/output")

# file names
fp = "./" # edit to provide an absolute filepath
plot_fn = paste(fp, "Azorella_simple_range.pdf",sep="")
tree_fn = paste("Acanea_biogeo_ase_BIB.tre", sep="")

library(devtools)
library(RevGadgets)
library(ggtree)


# get state labels and state colors
labs <- c("0" = "Mainland",
          "1"    = "Falkland",
          "2"    = "South Georgia",
          "3"    = "SIOBP",
          "4"    = "Macquarie")

ancstates <- processAncStates(tree_fn, state_labels = STATE_LABELS)

plotTree(tree_fn)

# plot the ancestral states
pp=plotAncStatesPie(t = ancstates, 
                    # Include cladogenetic events
                    cladogenetic = F,
                    # Add text labels to the tip pie symbols
                    tip_labels_states = F,
                    # tamano del nombre de las sp.
                    tip_labels_size = 4,
                    # Offset those text labels slightly
                    tip_labels_states_offset = .05,
                    # Offset the tip labels to make room for tip pies
                    tip_labels_offset = 1, 
                    # Move tip pies right slightly 
                    tip_pie_nudge_x = .07,
                    # Change the size of node and tip pies  
                    tip_pie_size = 1.0,
                    pie_colors = c("light green", "purple", "light blue", "orange", "pink"),
                    node_pie_size = 1.0,
                    tip_labels_italics = T,
                    state_transparency = 0.75,
                    timeline = T,
                    geo_units = "epochs")
pp
