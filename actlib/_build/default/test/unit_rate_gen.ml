module RG = Utility.Rates_gen
module Arr = Owl_dense_ndarray_generic
module BigArr = Bigarray

module To_test = struct
  let rg_1 () =
    let arr = Arr.create Bigarray.Float64 [| 99 |] 0.07 in
    let int_inf1 = RG.Rate 0.07 in
    RG.create int_inf1 = arr

  let rg_2 () =
    let arr = Arr.create Bigarray.Float64 [| 99 |] 0. in
    let int_inf = RG.Rate_param [ (0.3, 2.); (0.4, 2.); (0.5, 1.) ] in
    Arr.set arr [| 0 |] 0.3;
    Arr.set arr [| 1 |] 0.3;
    Arr.set arr [| 2 |] 0.4;
    Arr.set arr [| 3 |] 0.4;
    Arr.set arr [| 4 |] 0.5;
    RG.create int_inf = arr
end

let rg_1 () = Alcotest.(check bool) "rg_1" true (To_test.rg_1 ())
let rg_2 () = Alcotest.(check bool) "rg_2" true (To_test.rg_2 ())

(* the tests *)

let test_set = [ ("rg_1", `Slow, rg_1); ("rg_2", `Slow, rg_2) ]
