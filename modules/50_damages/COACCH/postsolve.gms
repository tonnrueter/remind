*** |  (C) 2006-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF .modules/50_damages/COACCH/postsolve.gms

*** this damage function is derived for global mean temperature increase compared to 1986-2005 mean which is set to 0.6 degree Celsius:

p50_damage(tall,regi)$(tall.val ge 2010 and tall.val le 2300) = p50_damageFuncCoef0(regi)*(p50_damageFuncCoef1(regi)/100*(pm_globalMeanTemperature(tall)-0.6)+p50_damageFuncCoef2(regi)/100*(pm_globalMeanTemperature(tall)-0.6)**2);

*** derivative of damage function w.r.t. teperature (used in 51_internalizeDamages)
pm_damageMarginal(tall,regi)$(tall.val ge 2000 and tall.val le 2300) =     
  p50_damageFuncCoef0(regi)*( p50_damageFuncCoef1(regi)/100  + 2 * p50_damageFuncCoef2(regi)/100 * (pm_globalMeanTemperature(tall)-0.6));
*  ( p50_damageFuncCoef1(regi)/100  + 2 * p50_damageFuncCoef2(regi)/100 * (pm_globalMeanTemperatureZeroed1900(tall)-pm_globalMeanTemperatureZeroed1900("2005") ));

display p50_damage,pm_damageMarginal;

$ifthen.cm_COACCH_SLR %cm_COACCH_SLR% == "on"
p50_SLRdamage(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
	p50_SLRcoef1(regi)*(p50_SLRcoef2(regi)/100*pm_globalMeanSLR(tall)+p50_SLRcoef3(regi)/100*pm_globalMeanSLR(tall)*pm_globalMeanSLR(tall));

pm_SLRdamageMarginal(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
	p50_SLRcoef1(regi)*(p50_SLRcoef2(regi)/100+2*p50_SLRcoef3(regi)/100*pm_globalMeanSLR(tall));

display p50_SLRdamage;

pm_damageNonSLR(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
  p50_damage(tall,regi)-p50_damage("2025",regi)*pm_GDPGross("2025",regi)/(pm_GDPGross(tall,regi)+1e-8);

pm_damageSLR(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
  p50_SLRdamage(tall,regi)-p50_SLRdamage("2025",regi)*pm_GDPGross("2025",regi)/(pm_GDPGross(tall,regi)+1e-8);

pm_damage(tall,regi) = pm_damageNonSLR(tall,regi)+pm_damageSLR(tall,regi);

$else.cm_COACCH_SLR

pm_damage(tall,regi)$(tall.val ge 2030 and tall.val le 2300) = 
  p50_damage(tall,regi)-p50_damage("2025",regi);
*  p50_damage(tall,regi)-p50_damage("2025",regi)*pm_GDPGross("2025",regi)/(pm_GDPGross(tall,regi)+1e-8);

$endif.cm_COACCH_SLR

display pm_damage;

*** EOF .modules/50_damages/COACCH/postsolve.gms
