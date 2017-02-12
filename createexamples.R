load("./teamcolors.Rdata")
library("ggplot2")
library("sportcolors")
library("cowplot")

outlist <- lapply(names(teamlist), function(i) {
	i
	dlist <- teamlist[[i]]
	length <- length(dlist)
	df <- data.frame(top = c(1:length))
	rowc <- nrow(df) / 2 + 0.5
	outplot <- ggplot(df, aes(x = factor(top), y = "line", fill = factor(top))) +
	theme_classic() +
	theme(
		legend.position = "none",
		axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.line.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank()
	) +
	geom_tile() +
	scale_fill_manual(values = team_colors(i)) +
	geom_label(aes(x = rowc, y = 1, label = i), fill = "white", alpha = 0.5)
	return(outplot)
})

heatout <- plot_grid(plotlist = outlist, ncol = 1)

png(
file = "./figures/cexamples.png",
width = 6,
height = 75,
units="in",
res=500
)
	heatout
dev.off()
