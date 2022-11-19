module F = Fin_math

let eps = 1e-10
let approx_equal a b = Stdlib.(abs_float (a -. b) < eps)

module To_test = struct
  let s0_1 () =
    approx_equal
      (F.Saving.s0 (F.Interest.Rate 0.05) 5.)
      (1. /. (1.05 *. 1.05 *. 1.05 *. 1.05 *. 1.05))

  let st_1 () =
    approx_equal
      (F.Saving.st (F.Interest.Rate 0.07) 10.)
      (1.07 *. 1.07 *. 1.07 *. 1.07 *. 1.07
      *. (1.07 *. 1.07 *. 1.07 *. 1.07 *. 1.07))

  let i_1 () =
    let st_minus_1 = F.Saving.st (F.Interest.Rate 0.07) 9. in
    let st = F.Saving.st (F.Interest.Rate 0.07) 10. in
    approx_equal (F.Saving.i st st_minus_1) 0.07

  let st_sj_1 () =
    approx_equal
      (F.Saving.sj_to_st (F.Interest.Rate 0.11) 5. 10.)
      (F.Saving.st (F.Interest.Rate 0.11) 5.)
end

let s0_1 () = Alcotest.(check bool) "s0_1" true (To_test.s0_1 ())
let st_1 () = Alcotest.(check bool) "st_1" true (To_test.st_1 ())
let st_sj () = Alcotest.(check bool) "st_sj" true (To_test.st_sj_1 ())
let i_1 () = Alcotest.(check bool) "i_1" true (To_test.i_1 ())

(* the tests *)

let test_set =
  [
    ("s0_1", `Slow, s0_1);
    ("st_1", `Slow, st_1);
    ("i_1", `Slow, i_1);
    ("st_sj", `Slow, st_sj);
  ]
