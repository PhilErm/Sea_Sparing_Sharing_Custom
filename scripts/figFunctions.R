# Figure/results functions

# Required packages ####

library(tidyverse)
library(data.table)

# Functions ####

# Function for processing catch lists into data frames
catch.proc <- function(list, species.name){
  catch.conv <- setNames(list, catch.spect)
  catch.conv <- lapply(catch.conv, FUN = as.data.frame) # Conversion of list to data frame
  catch.conv <- rbindlist(catch.conv, idcol = TRUE)  # Conversion of list to data frame
  catch.conv <- as.data.frame(catch.conv) # Conversion of list to data frame
  colnames(catch.conv) <- c("catch", "spared boxes", paste("abundance of species", species.name))
  catch.conv
}

# Function for finding the final abundance of a particular species in a particular simulation
abun.finder <- function(species.list){
  last.gen <- lapply(species.list, FUN = function(x) x[,n.time]) # Take the last generation of each simulation
  abun <- lapply(last.gen, FUN = mean) # Determine the average number of individuals in that generation
  abun <- lapply(abun, FUN = as.data.frame) # Conversion of list to data frame
  abun <- rbindlist(abun, idcol = TRUE)  # Conversion of list to data frame
  abun <- as.data.frame(abun) # Conversion of list to data frame
  colnames(abun) <- c("spared boxes", paste("abundance of", deparse(substitute(species.list)))) # Rename columns
  abun[,"spared boxes"] <- abun[,"spared boxes"]-1 # Since list 1 is for the simulation with 0 spared boxes, this adjustment makes it so that the correct number of spared boxes is reported in the spared boxes column
  abun
}

# Function for changing colour of plots depending on if grid cell is spared (green) or fished (red)
plot.colour <- function(allocation){
  if(allocation == "reserve"){"green"} else {
    "red"
  }
}

# Function for producing abundance over time plots for single simulations
abun.plot <- function(species.list, K.species, n.box.spared, species.name, plot.catch){
  allocation <- allocate(n.box, n.box.spared)
  par(mfcol=c(sqrt(n.box), sqrt(n.box)), 
      mai = c(0.2, 0.2, 0.2, 0.2))
  for(i in 1:n.box){
    plot(x = 1:n.time, 
         y = species.list[[which(catch.spect==plot.catch)]][[n.box.spared+1]][i,], # With adjustment so that the number of spared boxes is reported properly
         ylim = c(0,K.species*1.2), 
         col = plot.colour(allocation[i]), 
         ylab = '',
         xlab = '')
    text(x = n.time/2, 
         y = K.species/4, 
         labels = paste('Box', i, species.name))
  }
}