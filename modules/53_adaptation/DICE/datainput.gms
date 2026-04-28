*** |  (C) 2006-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/53_adaptation/DICE/datainput.gms

v53_qAdapt.l(ttot,regi)=0;

*data based on AD-DICE, rough translation to REMIND regions

p53_adapt1("LAM") = 0.0527;
p53_adapt1("IND") = 0.2233;
p53_adapt1("USA") = 0.0377;
p53_adapt1("CHA") = 0.5591;
p53_adapt1("JPN") = 0.0092;
p53_adapt1("OAS") = 0.0422;
p53_adapt1("EUR") = 0.0544;
p53_adapt1("NEU") = 0.0544;
p53_adapt1("CAZ") = 0.0544;
p53_adapt1("MEA") = 0.03865;
p53_adapt1("REF") = 0.0527;
p53_adapt1("SSA") = 0.2897;

p53_adapt2("LAM") = 2.3524;
p53_adapt2("IND") = 3.1357;
p53_adapt2("USA") = 6.8446;
p53_adapt2("CHA") = 9.691;
p53_adapt2("JPN") = 3.1683;
p53_adapt2("OAS") = 2.4951;
p53_adapt2("EUR") = 4.4843;
p53_adapt2("NEU") = 4.4843;
p53_adapt2("CAZ") = 4.4843;
p53_adapt2("MEA") = 2.53975;
p53_adapt2("REF") = 2.3524;
p53_adapt2("SSA") = 3.7589;

*p53_adapt1(regi)=0.115;
*p53_adapt2(regi)=3.6;

*** EOF ./modules/53_adaptation/DICE/datainput.gms

