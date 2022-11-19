open Base
module S = Act_type.Salary


module To_test = struct
  let testSalString = S.create 75000. 2
  let rec test_sals (sals: S.t) (n: int) =
    match sals, n with
    | [], 0 -> true
    | (hd :: tl), _ -> 
        if Float.(=) hd 75000.
        then test_sals tl (n - 1)
        else false
    | _ -> false
  let sal0 () = test_sals (S.create 75000. 3) 3
  let sal1 () = test_sals (S.create 75000. 3) 4
  let sal2 () = test_sals (S.create 75000. 10) 10
  let salPV1 () = Float.(=)(S.get_PV testSalString 0.02)(((75000. *. 1.02 +. 75000.) *. 1.02) /. 1.02 /. 1.02)
  let salFV1 () = Float.(=)(S.get_FV testSalString 0.02)((75000. *. 1.02 +. 75000.) *. 1.02)

  
    
    
    
end

let sal0 () = Alcotest.(check bool) "sal0" true (To_test.sal0 ())
let sal1 () = Alcotest.(check bool) "sal1" false (To_test.sal1 ())
let sal2 () = Alcotest.(check bool) "sal2" true (To_test.sal2 ())
let salPV1 () = Alcotest.(check bool) "salPV1 " true (To_test.salPV1 ())
let salFV1 () = Alcotest.(check bool) "salFV1 " true (To_test.salFV1 ())

(* the tests *)

let test_set =
  [ 
    "sal0", `Slow, sal0;
    "sal1", `Slow, sal1;
    "sal2", `Slow, sal2;
    "salPV1", `Slow, salPV1;
    "salFV1", `Slow, salFV1; 
  ]

