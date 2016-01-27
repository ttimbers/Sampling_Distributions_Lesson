# Tiffany Timbers, January 26, 2016
#
# Code to generate a histogram fro a bimodal distribution from 3 decks of cards,
# containing only ace-10 

# create dataframe with card distribution
deck_dist <- t(data.frame(c(1,5,8,12,6,3,1,8,5,3)))
row.names(deck_dist) <- NULL

count = 0
popn_deck <- data.frame(matrix(ncol = 1, nrow = sum(deck_dist)))
colnames(popn_deck) <- "cards"

for (i in 1:dim(deck_dist)[2]){
  popn_deck[(count + 1):(count + deck_dist[i]),] <- rep(i, deck_dist[i])
  count <-  count + deck_dist[i]
}

# plot histogram of population
pdf("card_population_distribution.pdf", width = 6, height = 4)
hist(popn_deck$cards, breaks=seq(0.5,10.5), main = "Card deck population distribution", xlab = "card", )
dev.off()