open Core.Sys

(*open Owl.Dense.Ndarray.Generic*)
module S = Act_type.Salary
module F = Fin_math.Saving
module I = Fin_math.Interest

let () =
  (* Read JSON file into an OCaml string *)
  let buf = get_argv () in
  (* Use the string JSON constructor *)
  let json1 = Yojson.Basic.from_string buf.(1) in

  let open Yojson.Basic.Util in
  let name = json1 |> member "name" |> to_string in
  let person = `Assoc [ ("nameFromOCAML", `String name) ] in
  print_endline (Yojson.Basic.pretty_to_string person)
(*let int_inf1 = I.Rate 0.05 in
  I.Arr.print (I.create int_inf1);
  let int_inf2 = I.Rate_param [ (0.05, 15.); (0.4, 99. -. 15.) ] in
  I.Arr.print (I.create int_inf2);
  let int_inf3 =
    I.Rate_list
      [
        0.07;
        0.07;
        0.07;
        0.07;
        0.07;
        0.07;
        0.05;
        0.05;
        0.05;
        0.05;
        0.05;
        0.05;
        0.05;
      ]
  in
  I.Arr.print (I.create int_inf3)*)