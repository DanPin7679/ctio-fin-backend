(*let rec test_fn (x:int): (Yojson.Basic.t list) = 
  match x with
  | 99 -> []
  | _ -> `Int x :: (test_fn (x + 1))
*)
let rec age_proj (x:int): (Yojson.Basic.t list) = 
  match x with
  | 99 -> [`Int 99]
  | x -> `Int x :: age_proj (x + 1)

let rec sal_proj (sal:int) (ages: Yojson.Basic.t list): (Yojson.Basic.t list) = 
  match ages with
  | [] -> []
  | _::tl -> `Int sal :: sal_proj ((sal* 102) / 100) tl

let rec cot_proj (cot_rate:int) (sals: Yojson.Basic.t list): (Yojson.Basic.t list) = 
  match sals with
  | [] -> []
  | `Int hd::tl ->  `Int (hd * cot_rate / 100) :: cot_proj cot_rate tl
  | _ -> failwith "error"

let rec spend_proj (cots: Yojson.Basic.t list) (sals: Yojson.Basic.t list): (Yojson.Basic.t list) = 
  match  cots, sals with
  | [], [] -> []
  | `Int hdc::tlc, `Int hds::tls ->  `Int (hds - hdc) :: spend_proj tlc tls
  | _ -> failwith "error"

let rec asset_proj (cots: Yojson.Basic.t list) (asset: int): (Yojson.Basic.t list) = 
  match  cots with
  | [] -> []
  | `Int hd::tl ->  `Int (asset + hd) :: asset_proj tl (asset + hd)
  | _ -> failwith "error"