#!/bin/bash

# Generate the tessellation and mesh files for use in example `3_triaxCLR'
# - This bash script requires a configured installation of Neper 4.0.0
#   in order to be properly executed.

# First, generate a dual-phase centroidal tessellation for the domain with `Neper -T':
neper -T -n 100 -reg 1 -rsel 1.25 -mloop 4 \
    -morpho "diameq:1,1-sphericity:lognormal(0.145,0.03)" -morphooptistop val=5e-3 \
    -oricrysym "cubic" \
    -group "id<=50?1:2" \
    -o simulation

# Then, generate a coarse finite element mesh for the domain with `Neper -M':
neper -M simulation.tess -order 2 -rcl 1.25

exit 0

# This script produces output files:
# - simuation.tess
# - simulation.msh
