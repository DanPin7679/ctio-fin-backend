open Core.Sys
open Coordinator

let () =

  let buf = get_argv () in

  let json1 = Yojson.Basic.from_string buf.(1) in

  let open Yojson.Basic.Util in
  let age = json1 |> member "age" |> to_int in
  let ages = (age_proj age) in
  let sal = json1 |> member "salary" |> to_int in
  let sals = (sal_proj sal ages) in
  let cot = json1 |> member "contribution" |> to_int in
  let cots = (cot_proj cot sals) in
  let spends = (spend_proj cots sals) in
  let assets = (asset_proj cots 0) in
  let (person : Yojson.Basic.t) = `Assoc [ ("ages" , `List ages); ("sals" , `List  sals); ("cots" , `List  cots); ("spends" , `List  spends); ("assets" , `List  assets) ] in
  print_endline (Yojson.Basic.pretty_to_string person)
