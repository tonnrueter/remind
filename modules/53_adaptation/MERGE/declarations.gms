*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/MERGE/declarations.gms

parameters
p53_adapt1(all_regi)	 "adaptation cost coefficient"
p53_adapt2(all_regi)	 "adaptation cost exponent"
p53_adapt3(all_regi)
p53_adaptRho(all_regi)
;

variables
v53_qAdapt(tall,all_regi)	"aggregate protection level"
;

positive variables
v53_invAdapt(ttot,all_regi)
v53_capAdapt(ttot,all_regi)
v53_flowAdapt(ttot,all_regi)
vm_damageFactorAdapt(tall,all_regi)	"damage factor after adaptation"
vm_adaptation(tall,all_regi)
;

equations
q53_capAdapt(ttot,all_regi)
q53_protect(ttot,all_regi)
q53_adapt(ttot,all_regi)
;

*** EOF ./modules/53_adaptation/MERGE/declarations.gms

