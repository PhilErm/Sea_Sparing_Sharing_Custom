# Parameters

# Fished species ####

# Reproduction
r.fished <- 2 # Intrinsic growth rate
K.fished <- 500 # Carrying capacity (per box)

# Dispersal
fished.disp.dim <- 3 # Must be odd number so that center of dispersal kernel will be on a particular cell
fished.dist.sigma <- 1.5 # Normal distribution sigma
fished.bound.type <- 2 # 1 = Individuals attempt to disperse out of boundaries and are lost. 2 = Individuals do not attempt to disperse out of boundaries

# Misc.
fished.name <- "fished species" # Name of species
init.fished <- 250 # Initial size of population (per box)
catch.const <- 2 # Catch constant for calculating harvest under Schaefer model

# Bycatch species ####

# Reproduction
r.bycatch <- 2 # Intrinsic growth rate
K.bycatch <- 500 # Carrying capacity (per box)

# Dispersal
bycatch.disp.dim <- 3 # Must be odd number so that dispersal probability centers on occupied cell properly
bycatch.dist.sigma <- 1.5 # Normal distribution sigma
bycatch.bound.type <- 2 # 1 = Individuals attempt to disperse out of boundaries and are lost. 2 = Individuals do not attempt to disperse out of boundaries

# Misc.
bycatch.name <- "bycatch species" # Name of species
init.bycatch <- 250 # Initial size of population (per box)
bycatch.const <- 1 # Constant in Schaefer model. Effort*bycatch.const*bycatch.pop is how much bycatch will occur in a cell. A higher value will result in more bycatch

# Habitat sensitive species ####

# Reproduction
r.habitat <- 2 # Intrinsic growth rate
K.habitat <- 500 # Carrying capacity (per box)

# Dispersal
habitat.disp.dim <- 3 # Must be odd number so that dispersal probability centers on occupied cell properly
habitat.dist.sigma <- 1.5 # Normal distribution sigma
habitat.bound.type <- 2 # 1 = Individuals attempt to disperse out of boundaries and are lost. 2 = Individuals do not attempt to disperse out of boundaries

# Misc.
habitat.name <- "habitat species"
init.habitat <- 250 # Initial size of population (per box)
habitat.const <- 10 # Should be one or more. A higher value will result in more damage to K

# Catch ####

# Catch spectrum
catch.min <- 250 # Minimum catch value on spectrum of catches to perform simulations for
catch.max <- 1000 # Maximum catch value on spectrum of catches to perform simulations for
catch.int <- 250 # Interval size of catch spectrum

# Simulation ####

n.time <- 20 # Length of time to simulate
n.box <- 36 # Number of boxes. Must be a perfect square to facilitate the construction of a symmetrical grid
disp.type <- 3 # Dispersal type. disp.type = 1 for normal distribution dispersal kernels. disp.type = 2 for no dispersal. disp.type = 3 for even distribution dispersal.
catch.method <- 1 # catch.method = 1 for effort distributed to maintain best CPUE. catch.method = 2 for same amount of catch taken from each box. catch.method = 3 for same effort applied to each box