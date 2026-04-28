
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/53_adaptation/DICE/declarations.gms"
$Ifi "%phase%" == "datainput" $include "./modules/53_adaptation/DICE/datainput.gms"
$Ifi "%phase%" == "equations" $include "./modules/53_adaptation/DICE/equations.gms"
$Ifi "%phase%" == "bounds" $include "./modules/53_adaptation/DICE/bounds.gms"
*######################## R SECTION END (PHASES) ###############################
