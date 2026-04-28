*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/ACCREU/bounds.gms

*vm_damageFactorAdapt.fx(ttot,regi)$(ttot.val lt cm_startyear) = 1;
*vm_damageFactorAdapt.fx(ttot,regi)$(ttot.val le 2025) = 1;
v53_qAdapt.up(tall,regi) = 1;
v53_protectSLR.up(tall,regi) = 1;
v53_costProtectSLR.lo(tall,regi) = 0;

*** EOF ./modules/53_adaptation/ACCREU/bounds.gms
