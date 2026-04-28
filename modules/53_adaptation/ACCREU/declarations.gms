*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/DICE/declarations.gms

parameters
p53_adapt1(all_regi)	 "adaptation cost coefficient"
p53_adapt2(all_regi)	 "adaptation cost exponent"

$ifthen.SLR "%cm_COACCH_SLR%" == "on"
p53_SLRadapt1(all_regi)  "adaptation cost coefficient for SLR"
p53_SLRadapt2(all_regi)  "adaptation cost coefficient 2 for SLR"
$endif.SLR
;

positive variables
v53_qAdapt(tall,all_regi)	"aggregate protection level"

$ifthen.SLR "%cm_COACCH_SLR%" == "on"
v53_protectSLR(tall,all_regi)   "SLR protection level"
v53_costProtectSLR(tall,all_regi)  "SLR protection costs"
$endif.SLR

vm_damageFactorAdapt(tall,all_regi)	"damage factor after adaptation"
vm_adaptation(tall,all_regi)
;

equations
q53_adapt(ttot,all_regi)

$ifthen.SLR "%cm_COACCH_SLR%" == "on"
q53_adaptSLR(ttot,all_regi)
$endif.SLR
;

*** EOF ./modules/53_adaptation/DICE/declarations.gms

