let () =
  Alcotest.run "ActLib"
    [
      ("stats_rvs", Unit_core_sal.test_set);
      (*("fin_math_rvs", Unit_fin_math.test_set);*)
      ("rates_gen", Unit_rate_gen.test_set);
    ]
