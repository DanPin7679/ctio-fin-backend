(*open Bigarray*)
module Arr = Owl_dense_ndarray_generic
(*module Int = Interest*)

type ('a, 'b) t = ('a, 'b) Owl_dense_ndarray_generic.t

module M = struct
  include Owl_dense_matrix_generic
  include Owl_operator.Make_Basic (Owl_dense_matrix_generic)
  include Owl_operator.Make_Extend (Owl_dense_matrix_generic)
  include Owl_operator.Make_Matrix (Owl_dense_matrix_generic)
end

(********** One Amount ***********)
let st i t = Owl_maths.pow (1. +. i) t
let sj_to_st i j t = st i t /. st i j
let s0 i t = sj_to_st i t 0.
let i st st_minus_1 = (st -. st_minus_1) /. st_minus_1

(********** CF string ***********)
let net_CF (c : (float, 'a) t) (b : (float, 'a) t) = Arr.map2 ( -. ) c b
let accum_t_helper i f t cf = cf *. f i (float_of_int t)

let acc_CF_t0 (cf : (float, 'a) t) (i : float) =
  Arr.mapi (accum_t_helper i s0) cf

let acc_CF_t (cf : (float, 'a) t) (i : float) =
  Arr.mapi (accum_t_helper i st) cf

let acc_net_CF_t0 (c : (float, 'a) t) (b : (float, 'a) t) i =
  Arr.map2 ( -. ) (acc_CF_t0 c i) (acc_CF_t0 b i)

let acc_net_CF_t (c : (float, 'a) t) (b : (float, 'a) t) i =
  Arr.map2 ( -. ) (acc_CF_t c i) (acc_CF_t b i)

let ut (c : (float, 'a) t) (b : (float, 'a) t) (i : float) =
  let x = acc_net_CF_t c b i |> Arr.fold ( +. ) 0. in
  Arr.get x [| 0 |]

let pv_t0 (c : (float, 'a) t) (b : (float, 'a) t) (i : float) =
  let x = acc_net_CF_t0 c b i |> Arr.fold ( +. ) 0. in
  Arr.get x [| 0 |]
