
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/53_adaptation/ACCREU/declarations.gms"
$Ifi "%phase%" == "datainput" $include "./modules/53_adaptation/ACCREU/datainput.gms"
$Ifi "%phase%" == "equations" $include "./modules/53_adaptation/ACCREU/equations.gms"
$Ifi "%phase%" == "bounds" $include "./modules/53_adaptation/ACCREU/bounds.gms"
*######################## R SECTION END (PHASES) ###############################
