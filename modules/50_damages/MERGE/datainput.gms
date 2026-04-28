*** |  (C) 2006-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF .modules/50_damages/MERGE/datainput.gms

p50_damageFuncCoef0(regi) = 1;
p50_damageFuncCoef1(regi) = 0;
p50_damageFuncCoef2(regi) = 0;
p50_damageFuncCoef3(regi) = 0;

p50_damageFuncCoef0("LAM") = 0.0107;
p50_damageFuncCoef0("IND") = 0.017;
p50_damageFuncCoef0("USA") = 0.007;
p50_damageFuncCoef0("CHA") = 0.006;
p50_damageFuncCoef0("JPN") = 0.0015;
p50_damageFuncCoef0("OAS") = 0.035;
p50_damageFuncCoef0("EUR") = 0.013;
p50_damageFuncCoef0("NEU") = 0.0023;
p50_damageFuncCoef0("CAZ") = 0.012;
p50_damageFuncCoef0("MEA") = 0.016;
p50_damageFuncCoef0("REF") = 0.0024;
p50_damageFuncCoef0("SSA") = 0.05;

p50_damageFuncCoef1(regi) = 1;
p50_damageFuncCoef1("CAZ") = 0.75;

p50_damageFuncCoef2("LAM") = 0.0002;
p50_damageFuncCoef2("IND") = 0.0015;
p50_damageFuncCoef2("USA") = 0.0002;
p50_damageFuncCoef2("CHA") = 0.0006;
p50_damageFuncCoef2("JPN") = 0.0015;
p50_damageFuncCoef2("OAS") = 0.0075;
p50_damageFuncCoef2("EUR") = 0.0005;
p50_damageFuncCoef2("NEU") = 0.0001;
p50_damageFuncCoef2("CAZ") = 0.0003;
p50_damageFuncCoef2("MEA") = 0.0001;
p50_damageFuncCoef2("REF") = 0.000125;
p50_damageFuncCoef2("SSA") = 0.001;

p50_damageFuncCoef3(regi) = 2;
p50_damageFuncCoef3("CAZ") = 1.75;

*initialize
pm_damage(tall,regi) = 0;
p50_damage(tall,regi) = 0;

*** EOF .modules/50_damages/COACCH/datainput.gms
