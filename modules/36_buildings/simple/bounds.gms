*** |  (C) 2006-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/36_buildings/simple/bounds.gms

*** Upper bound for exponent to avoid exponential gams overflow (if > 20 -> 3^20 > 1e10 what would cause GAMS to get an overflow x**y error) 
v36_costExponent.up(t,regi) = 20; 


*** FS: bounds on maximum heat and electricity share in buildings for DEU from 2035 onwards, used for some ariadne scenarios
v36_Heatshare.up(t,regi)$(sameas(regi,"DEU") AND t.val gt 2030) = cm_HeatLim_b+0.05;
v36_Heatshare.up(t,regi)$(sameas(regi,"DEU") AND t.val gt 2040) = cm_HeatLim_b;

v36_Elshare.up(t,regi)$(sameas(regi,"DEU") AND t.val gt 2030) = cm_ElLim_b+0.05;
v36_Elshare.up(t,regi)$(sameas(regi,"DEU") AND t.val gt 2040) = cm_ElLim_b;


*** FS: no H2 in buildings before 2050
vm_demFeSector.up('2010',regi,'seh2','feh2s','build','ES') = 0;
vm_demFeSector.up('2015',regi,'seh2','feh2s','build','ES') = 0;
vm_demFeSector.up('2020',regi,'seh2','feh2s','build','ES') = 1e-5;
vm_demFeSector.up('2025',regi,'seh2','feh2s','build','ES') = 1e-5;

*** EOF ./modules/36_buildings/simple/bounds.gms

