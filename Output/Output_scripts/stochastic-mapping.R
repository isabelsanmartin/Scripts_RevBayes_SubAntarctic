library(plotrix)
library(ggtree)
library(phytools)
library(ggplot2)

character_file = "Pringlea_biogeo_model_marginal_character.tree"

sim2 = read.simmap(file=character_file, format="phylip")


colors = vector()
for (i in 1:length( sim2$maps ) ) {
    colors = c(colors, names(sim2$maps[[i]]) )
}
colors = sort(as.numeric(unique(colors)))
col_idx = colors + 1
cols = setNames(c("light blue", "light green", "pink", "orange", "purple"), colors)
cols = cols[col_idx]

pp = plotSimmap(sim2, 
                cols, 
                fsize=1.0, 
                # Font type: "i" for italics, "b" for bold, "bi" for bold and italics
                ftype="i",
                # plot filled circles at each vertex of the tree (points between mapped states)
                pts=F,
                lwd=2.5,
                split.vertical=TRUE,
                type="phylogram"
                )

add.simmap.legend(colors=cols, prompt=T)


fp = "./" # edit to provide an absolute filepath
plot_fn = paste(fp, "Acaena_simple_range.pdf",sep="")
tree_fn = paste(fp, "output/Acaena_geo_ase.tree", sep="")


# get plot dimensions
x_phy = max(pp$data$x)       # get height of tree
x_label = 3.5                # choose space for tip labels
x_start = 10                  # choose starting age (greater than x_phy)
x0 = -(x_start - x_phy)      # determine starting pos for xlim
x1 = x_phy + x_label         # determine ending pos for xlim



# add axis
pp = pp + theme_tree2()
pp = pp + labs(x="Age (Ma)")

pdf( "Acaena_geography_simmap.pdf" )


# add legend
x = 0
y = 5

leg = c("0" = "MAINLAND", "1" = "FALKLAND", "2" = "SOUTH GEORGIA", "3" = "SIOBP", "4" = "MACQUARIE")
leg = leg[col_idx]
colors = cols
y = y - (0:(length(leg) - 1))*10
x = rep(x, length(y))
text(x + 0.005, y, leg, pos=4, cex=1.15)

mapply(draw.circle, x=x, y=y, col=colors, MoreArgs = list(nv=200, radius=1, border="white"))

dev.off()
