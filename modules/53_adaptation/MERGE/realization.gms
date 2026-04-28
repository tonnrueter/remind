
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/53_adaptation/MERGE/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/53_adaptation/MERGE/declarations.gms"
$Ifi "%phase%" == "datainput" $include "./modules/53_adaptation/MERGE/datainput.gms"
$Ifi "%phase%" == "equations" $include "./modules/53_adaptation/MERGE/equations.gms"
$Ifi "%phase%" == "bounds" $include "./modules/53_adaptation/MERGE/bounds.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/53_adaptation/MERGE/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
