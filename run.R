#!/usr/local/bin/Rscript

task <- dyncli::main()
task <- dyncli::main(
  c("--dataset", "./example.h5", "--output", "./output.h5"),
  "./definition.yml"
)

library(jsonlite)
library(readr)
library(dplyr)
library(purrr)


#   ____________________________________________________________________________
#   Load data                                                               ####

counts <- task$counts
dataset <- task$priors$dataset

# TIMING: done with preproc
checkpoints <- list(method_afterpreproc = as.numeric(Sys.time()))

# TIMING: done with method
checkpoints$method_aftermethod <- as.numeric(Sys.time())


#   ____________________________________________________________________________
#   Save output                                                             ####

output <- dynwrap::wrap_data(cell_ids = rownames(counts)) %>%
  dynwrap::add_trajectory(
    milestone_network = dataset$milestone_network,
    milestone_percentages = dataset$milestone_percentages,
    divergence_regions = dataset$divergence_regions
  )

dyncli::write_output(output, task$output)

