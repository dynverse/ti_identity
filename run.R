#!/usr/local/bin/Rscript

task <- dyncli::main()

library(dynwrap)
library(purrr)

#   ____________________________________________________________________________
#   Load data                                                               ####

counts <- task$counts
dataset <- task$priors$dataset

# TIMING: done with preproc
checkpoints <- list(method_afterpreproc = Sys.time())

# TIMING: done with method
checkpoints$method_aftermethod <- Sys.time()

#   ____________________________________________________________________________
#   Save output                                                             ####

output <-
  wrap_data(cell_ids = rownames(counts)) %>%
  add_trajectory(
    milestone_network = dataset$milestone_network,
    milestone_percentages = dataset$milestone_percentages,
    divergence_regions = dataset$divergence_regions
  )

dyncli::write_output(output, task$output)

