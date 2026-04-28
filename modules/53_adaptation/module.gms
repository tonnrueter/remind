
*###################### R SECTION START (MODULETYPES) ##########################
$Ifi "%adaptation%" == "ACCREU" $include "./modules/53_adaptation/ACCREU/realization.gms"
$Ifi "%adaptation%" == "DICE" $include "./modules/53_adaptation/DICE/realization.gms"
$Ifi "%adaptation%" == "MERGE" $include "./modules/53_adaptation/MERGE/realization.gms"
$Ifi "%adaptation%" == "off" $include "./modules/53_adaptation/off/realization.gms"
*###################### R SECTION END (MODULETYPES) ############################
