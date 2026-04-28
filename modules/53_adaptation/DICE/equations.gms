*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/DICE/equations.gms

*' @equations

q53_adapt(ttot,regi)$(ttot.val ge cm_startyear)..
    vm_damageFactorAdapt(ttot,regi)
   =e=
    1- (pm_damage(ttot,regi)*(1-v53_qAdapt(ttot,regi))+p53_adapt1(regi)*v53_qAdapt(ttot,regi)**p53_adapt2(regi))
;

*** EOF ./modules/53_adaptation/DICE/equations.gms
