*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/ACCREU/equations.gms

*' @equations

$ifthen.SLR %cm_COACCH_SLR% == "on"
q53_adaptSLR(ttot,regi)$(ttot.val ge cm_startyear)..
   v53_protectSLR(ttot,regi) 
  =e=
*   p53_SLRadapt1(regi)*(1-exp(-p53_SLRadapt2(regi)*v53_costProtectSLR(ttot,regi)))
   0.9323/(1+exp((3.746e-5-v53_costProtectSLR(ttot,regi)/4.628e-6)))
;
$endif.SLR

q53_adapt(ttot,regi)$(ttot.val ge cm_startyear)..
    vm_damageFactorAdapt(ttot,regi)
   =e=
    1
*    - (pm_damageNonSLR(ttot,regi)*(1-v53_qAdapt(ttot,regi))+p53_adapt1(regi)*v53_qAdapt(ttot,regi)**p53_adapt2(regi))
    - pm_damageNonSLR(ttot,regi)
*    - (pm_damageSLR(ttot,regi)*(1-v53_protectSLR(ttot,regi))+v53_costProtectSLR(ttot,regi)/(vm_cesIO(ttot,regi,"inco")+1e-8))
    - (pm_damageSLR(ttot,regi)*(1-v53_protectSLR(ttot,regi))+v53_costProtectSLR(ttot,regi))
;

*** EOF ./modules/53_adaptation/ACCREU/equations.gms
