# LOG
# This script is a dummy R script that calls a dummy Python script. Goal is to test how to capture the output of the 
# Python script in a log file. Currently this does not work, as the output of the Python script is not captured in the
# log file. When called from PowerShell, the output is still displayed in the console, e.g.:
# PS C:\Users\tonnru\lab\remind> Rscript.exe .\dummy_Rscript_calls_python.R 
# Warning!
# Error!
# Printing -- main done
# [1] 0

outputDir <- getwd()
logFile <- file.path(outputDir, "dummy_log.txt")
# message(logFile)
logMsg <- paste0("logFile = ", logFile, "\n")
capture.output(cat(logMsg), file = logFile, append = TRUE)

baseCmd <- paste(
  if (.Platform$OS.type == "windows") "python.exe" else "python",
  file.path(outputDir, "dummy_script_delete_me.py")
)
logMsg <- paste0(baseCmd, "\n")
capture.output(cat(logMsg), file = logFile, append = TRUE)

systemCmd <- paste(
  baseCmd,
  if (.Platform$OS.type == "windows") "*>>" else "&>>",
  "dummy_log.txt"
)
logMsg <- paste0(systemCmd, "\n")
capture.output(cat(logMsg), file = logFile, append = TRUE)

system(systemCmd)

# system2(baseCmd, stderr = logFile, stdout = logFile)
