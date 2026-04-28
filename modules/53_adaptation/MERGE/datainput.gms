*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/MERGE/datainput.gms

v53_qAdapt.l(ttot,regi)=0;

*data based on AD-MERGE, rough translation to REMIND regions

p53_adapt1("LAM") = 149;
p53_adapt1("IND") = 20;
p53_adapt1("USA") = 400;
p53_adapt1("CHA") = 170;
p53_adapt1("JPN") = 4000;
p53_adapt1("OAS") = 330;
p53_adapt1("EUR") = 2000;
p53_adapt1("NEU") = 700;
p53_adapt1("CAZ") = 160;
p53_adapt1("MEA") = 100;
p53_adapt1("REF") = 200;
p53_adapt1("SSA") = 30;

p53_adapt2("LAM") = 0.49;
p53_adapt2("IND") = 0.5;
p53_adapt2("USA") = 0.47;
p53_adapt2("CHA") = 0.35;
p53_adapt2("JPN") = 0.28;
p53_adapt2("OAS") = 0.35;
p53_adapt2("EUR") = 0.43;
p53_adapt2("NEU") = 0.55;
p53_adapt2("CAZ") = 0.4;
p53_adapt2("MEA") = 0.25;
p53_adapt2("REF") = 0.5;
p53_adapt2("SSA") = 0.56;

p53_adapt3("LAM") = 0.5;
p53_adapt3("IND") = 0.7;
p53_adapt3("USA") = 0.55;
p53_adapt3("CHA") = 0.53;
p53_adapt3("JPN") = 0.93;
p53_adapt3("OAS") = 0.46;
p53_adapt3("EUR") = 0.51;
p53_adapt3("NEU") = 0.6;
p53_adapt3("CAZ") = 0.55;
p53_adapt3("MEA") = 0.73;
p53_adapt3("REF") = 0.65;
p53_adapt3("SSA") = 0.4;

p53_adaptRho("LAM") = 0.5;
p53_adaptRho("IND") = 0.5;
p53_adaptRho("USA") = 0.4;
p53_adaptRho("CHA") = 0.4;
p53_adaptRho("JPN") = 0.4;
p53_adaptRho("OAS") = 0.4;
p53_adaptRho("EUR") = 0.5;
p53_adaptRho("NEU") = 0.4;
p53_adaptRho("CAZ") = 0.45;
p53_adaptRho("MEA") = 0.5;
p53_adaptRho("REF") = 0.45;
p53_adaptRho("SSA") = 0.4;

*** EOF ./modules/53_adaptation/MERGE/datainput.gms

