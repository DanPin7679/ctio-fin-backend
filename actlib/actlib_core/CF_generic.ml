type t = float list

let rec create (s: float)(n: int): t =
  match n with
  | 0 -> []
  | _ -> s :: create s (n - 1)

let accum (i:float)(x:float)(y:float) = (x +. y) *. (1.0 +. i)

let get_FV (sals: t)(i: float) = List.fold_left (accum i) 0.0 sals

let get_PV (sals: t)(i: float) = get_FV sals i /. Float.pow (1.0 +. i)(float_of_int (List.length sals))
  

