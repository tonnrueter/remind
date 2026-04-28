*** |  (C) 2006-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF .modules/50_damages/MERGE/postsolve.gms


p50_damage(tall,regi)$(tall.val ge 2010 and tall.val le 2300) = p50_damageFuncCoef0(regi)*pm_globalMeanTemperature(tall)**p50_damageFuncCoef1(regi)+p50_damageFuncCoef2(regi)*pm_globalMeanTemperature(tall)**p50_damageFuncCoef3(regi);

*** derivative of damage function w.r.t. teperature (used in 51_internalizeDamages)
pm_damageMarginal(tall,regi)$(tall.val ge 2000 and tall.val le 2300) =     
  p50_damageFuncCoef0(regi)*p50_damageFuncCoef1(regi)*pm_globalMeanTemperature(tall)**(p50_damageFuncCoef2(regi)-1)  + p50_damageFuncCoef2(regi)*p50_damageFuncCoef3(regi)*pm_globalMeanTemperature(tall)**(p50_damageFuncCoef3(regi)-1)
;

pm_damage(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
*  1-(p50_damage(tall,regi)-p50_damage("2025",regi)*pm_GDPGross("2025",regi)/(pm_GDPGross(tall,regi)+1e-8));
  (p50_damage(tall,regi)-p50_damage("2025",regi)*pm_GDPGross("2025",regi)/(pm_GDPGross(tall,regi)+1e-8));
*  1-(p50_damage(tall,regi)-p50_damage("2020",regi));

display pm_damage,pm_damageMarginal;

*** EOF .modules/50_damages/MERGE/postsolve.gms
