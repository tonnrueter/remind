*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/MERGE/equations.gms

*' @equations

q53_capAdapt(ttot,regi)$(pm_ttot_val(ttot+1) ge cm_startyear AND ord(ttot) lt card(ttot))..
   v53_capAdapt(ttot+1,regi)
  =e=
   v53_capAdapt(ttot,regi)*(1-pm_delta_kap(regi,"kap"))**(pm_ttot_val(ttot+1)-pm_ttot_val(ttot))
  + p01_cumDeprecFactor_old(ttot+1,regi,"kap") * v53_invAdapt(ttot,regi)
  + p01_cumDeprecFactor_new(ttot+1,regi,"kap") * v53_invAdapt(ttot+1,regi)
;

q53_protect(ttot,regi)$(ttot.val ge cm_startyear)..
    v53_qAdapt(ttot,regi)
   =e=
    p53_adapt1(regi)*(p53_adapt2(regi)*v53_capAdapt(ttot,regi)**p53_adaptRho(regi) 
	+ (1-p53_adapt2(regi))*v53_flowAdapt(ttot,regi)**p53_adaptRho(regi))**(p53_adapt3(regi)/p53_adaptRho(regi))
;


q53_adapt(ttot,regi)$(ttot.val ge cm_startyear)..
    vm_damageFactorAdapt(ttot,regi)
   =e=
    1- (pm_damage(ttot,regi)/(1+v53_qAdapt(ttot,regi))+v53_invAdapt(ttot,regi)+v53_flowAdapt(ttot,regi))
;

*** EOF ./modules/53_adaptation/MERGE/equations.gms
