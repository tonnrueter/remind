*** |  (C) 2006-2023 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/80_optimization/nash/solve.gms

regi(all_regi) = no;
hybrid.solvelink = 3;
hybrid.optfile   = 9;

$ifthene.debug (sameas("%cm_nash_mode%","serial"))OR(sameas("%cm_nash_mode%","debug"))
hybrid.solvelink = 0;
$endif.debug

loop (all_regi,
  !! only solve for regions that do not have a valid solution for this nash
  !! iteration
  if (    sol_itr.val gt 1
      AND (   p80_repy(all_regi,"modelstat") eq 2
           OR p80_repy(all_regi,"modelstat") eq 7),

    p80_repy(all_regi,solveinfo80) = 0;
    continue;
  );

  regi(all_regi) = yes;

  if (execError > 0,
    execute_unload "abort.gdx";
    abort "at least one execution error occured, possibly in the loop";
  );

  if (cm_keep_presolve_gdxes eq 1,
    execute_unload "presolve_nash.gdx";
    sm_tmp  = logfile.nr;
    sm_tmp2 = logfile.nd;
    logfile.nr = 1;
    logfile.nd = 0;
    put_utility logfile, "shell" /
      "mv presolve_nash.gdx presolve_nash_" all_regi.tl "_CES-"
       sm_CES_calibration_iteration "_Nash-" iteration.val "_Sol-" sol_itr.val
       ".gdx";
    logfile.nr = sm_tmp;
    logfile.nd = sm_tmp2;
  );
  
  solve hybrid using nlp maximizing vm_welfareGlob;

$ifthene.debug (sameas("%cm_nash_mode%","serial"))OR(sameas("%cm_nash_mode%","debug"))
  p80_repy(all_regi,"solvestat") = hybrid.solvestat;
  p80_repy(all_regi,"modelstat") = hybrid.modelstat;
  p80_repy(all_regi,"resusd")    = hybrid.resusd;
  p80_repy(all_regi,"objval")    = hybrid.objval;
  if (p80_repy(all_regi,"modelstat") eq 2,
    p80_repyLastOptim(all_regi,"objval") = p80_repy(all_regi,"objval");
  );
$endif.debug

  regi(all_regi) = NO;
  p80_handle(all_regi) = hybrid.handle;
);  !! close regi loop

$ifthen.parallel %cm_nash_mode% == "parallel"
repeat
  loop (all_regi$handlecollect(p80_handle(all_regi)),
    p80_repy(all_regi,"solvestat") = hybrid.solvestat;
    p80_repy(all_regi,"modelstat") = hybrid.modelstat;
    p80_repy(all_regi,"resusd")    = hybrid.resusd;
    p80_repy(all_regi,"objval")    = hybrid.objval;

    if (p80_repy(all_regi,"modelstat") eq 2,
      p80_repyLastOptim(all_regi,"objval") = p80_repy(all_regi,"objval");
    );

    display$handledelete(p80_handle(all_regi)) "trouble deleting handles" ;
    p80_handle(all_regi) = 0
  );
  display$sleep(5) "sleep some time";
until card(p80_handle) = 0;
$endif.parallel

regi(all_regi) = YES;

*** internal nash helper paramter:
pm_SolNonInfes(regi) = 0;
p80_SolNonOpt(regi)  = 0;
loop (regi,
  if (p80_repy(regi,"modelstat") eq 2 OR p80_repy(regi,"modelstat") eq 7,
    pm_SolNonInfes(regi) = 1;
  );
  if (p80_repy(regi,"modelstat") eq 7, p80_SolNonOpt(regi) = 1);
);

*** set o_modelstat to the highest value across all regions, ignoring status 7 
o_modelstat
  = smax(regi, p80_repy(regi,"modelstat")$(p80_repy(regi,"modelstat") ne 7));

*** in cm_nash_mode=debug mode, enable solprint for next sol_itr when last
*** iteration was non-optimal:
$ifthen.solprint %cm_nash_mode% == "debug" 
if (o_modelstat ne 2,   
    option solprint = on;
);
$endif.solprint

p80_repy_iteration(all_regi,solveinfo80,iteration)$(
                                                p80_repy(all_regi,solveinfo80) )
    !! store sum of resusd for all sol_itrs
  = ( p80_repy_iteration(all_regi,solveinfo80,iteration)
    + p80_repy(all_regi,solveinfo80)
    )$( sameas(solveinfo80,"resusd") )
  + p80_repy(all_regi,solveinfo80)$( NOT sameas(solveinfo80,"resusd") );

p80_repy_nashitr_solitr(all_regi,solveinfo80,iteration,sol_itr)$(
                                                p80_repy(all_regi,solveinfo80) )
  = p80_repy(all_regi,solveinfo80);

*** EOF ./modules/80_optimization/nash/solve.gms
