
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/50_damages/MERGE/declarations.gms"
$Ifi "%phase%" == "datainput" $include "./modules/50_damages/MERGE/datainput.gms"
$Ifi "%phase%" == "bounds" $include "./modules/50_damages/MERGE/bounds.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/50_damages/MERGE/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
