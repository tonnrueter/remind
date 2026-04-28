*** |  (C) 2006-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF .modules/50_damages/COACCH/datainput.gms

p50_damageFuncCoef0(regi) = 1;
p50_damageFuncCoef1(regi) = 0;
p50_damageFuncCoef2(regi) = 0;

$ifthen.cm_COACCH_SLR %cm_COACCH_SLR% == "off"
* no separate SLR damage, but differentiation of adapt and no adapt for the SLR component of the overall damage, plus low/med/high damage

parameter p50_damageCoefs(dam_adapt_50,all_regi,dam_coef_50,dam_CI_50)	"coefficients for damage function" 
/
$ondelim
$include "./modules/50_damages/COACCH/input/REMIND_coefs.inc"
$offdelim
/
;

p50_damageFuncCoef1(regi)=p50_damageCoefs("%cm_damage_COACCH_adaptSpec%",regi,"b1","%cm_damage_COACCH_CIspec%");
p50_damageFuncCoef2(regi)=p50_damageCoefs("%cm_damage_COACCH_adaptSpec%",regi,"b2","%cm_damage_COACCH_CIspec%");

$else.cm_COACCH_SLR
*damage other than SLR (doesn't separate between adaptation and no adaptation)
parameter p50_damageCoefsA(all_regi,dam_coef_50,dam_CI_50)
/
$ondelim
$include "./modules/50_damages/COACCH/input/REMIND_coefs_a_noSLRdam_08092022.inc"
$offdelim
/
;
parameter p50_damageCoefsB(all_regi,dam_coef_50)
/
$ondelim
$include "./modules/50_damages/COACCH/input/REMIND_coefs_b_noSLRdam_08092022.inc"
$offdelim
/
;

p50_damageFuncCoef0(regi)=p50_damageCoefsA(regi,"a","%cm_damage_COACCH_CIspec%");
p50_damageFuncCoef1(regi)=p50_damageCoefsB(regi,"b1");
p50_damageFuncCoef2(regi)=p50_damageCoefsB(regi,"b2");

*SLR damage
*parameter p50_damageCoefs_SLRa(dam_adapt_50,all_regi,dam_coef_50,dam_CI_50)
*/
*$ondelim
*$include "./modules/50_damages/COACCH/input/REMIND_coefs_a_SLRdam_08092022.inc"
*$offdelim
*/
*;

*parameter p50_damageCoefs_SLRb(dam_adapt_50,all_regi,dam_coef_50)
parameter p50_damageCoefs_SLRb(all_regi,dam_coef_50,dam_CI_50)
/
$ondelim
*$include "./modules/50_damages/COACCH/input/REMIND_coefs_b_SLRdam_08092022.inc"
$include "./modules/50_damages/COACCH/input/REMIND_coefs_ACCREU_SLR.inc"
$offdelim
/
;

p50_SLRCoef1(regi) = 1;
p50_SLRCoef2(regi) = 0;
p50_SLRCoef3(regi) = 0;

*p50_SLRCoef1(regi)=p50_damageCoefs_SLRa("%cm_damage_COACCH_adaptSpec%",regi,"a","%cm_damage_COACCH_CIspec%");
*p50_SLRCoef2(regi)=p50_damageCoefs_SLRb("%cm_damage_COACCH_adaptSpec%",regi,"b1");
*p50_SLRCoef3(regi)=p50_damageCoefs_SLRb("%cm_damage_COACCH_adaptSpec%",regi,"b2");
p50_SLRCoef2(regi)=p50_damageCoefs_SLRb(regi,"b1","%cm_damage_COACCH_CIspec%");
p50_SLRCoef3(regi)=p50_damageCoefs_SLRb(regi,"b2","%cm_damage_COACCH_CIspec%");

p50_SLRdamage(tall,regi) = 0;
pm_damageNonSLR(tall,regi) = 0;
pm_damageSLR(tall,regi) = 0;
$endif.cm_COACCH_SLR

*initialize
p50_damage(tall,regi) = 0;
pm_damage(tall,regi) = 1;
p50_damage(tall,regi) = 1;

*** EOF .modules/50_damages/COACCH/datainput.gms
