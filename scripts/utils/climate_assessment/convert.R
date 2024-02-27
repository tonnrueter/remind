#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

require(tidyverse)
require(readxl)
require(quitte)
require(reticulate)


infname <- args[1]
# infname <- "../../../output/export/REMIND_gabrielAR6SHAPE_2023-05-17_05.12.52.xlsx"

if (!file.exists(infname)) {
    cat("ERROR: No file found in ", infname, "\n")
    stop()
}

outfname <- sub('\\.xlsx$', '.mif', basename(infname)) 



cat("Reading ", normalizePath(infname), " and converting to mif in ", outfname, "\n")
indf <- readxl::read_excel(infname)

indf %>%
    pivot_longer(cols = `2005`:`2100`, names_to = "Period") %>%
    mutate(Period = as.numeric(Period)) %>%
    write.mif(outfname)

# FIXME: Sometimes REMIND doesn't update the Python requirements 
# automatically. If that happens, go to the REMIND root and run
# piamenv::updatePythonVirtualEnv(). Has to be done there, not here!
# cat("Sourcing python script...")
# system(paste0("python source_climate_assessment.py ", outfname))
