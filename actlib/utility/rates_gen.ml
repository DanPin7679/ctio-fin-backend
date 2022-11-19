module Arr = Owl_dense_ndarray_generic
module BigArr = Bigarray

type ('a, 'b) t = ('a, 'b) Owl_dense_ndarray_generic.t
type rate = float
type period = float

type rate_infos =
  | Rate_param of (rate * period) list
  | Rate of rate
  | Rate_list of float list

let rec fill_from_param (r_infos : (rate * period) list) (arr : ('a, 'b) t)
    (idx : int) : ('a, 'b) t =
  match r_infos with
  | [] -> arr
  | hd :: tl -> (
      match hd with
      | _, 0. -> fill_from_param tl arr idx
      | r, p ->
          Arr.set arr [| idx |] r;
          fill_from_param ((r, p -. 1.) :: tl) arr (idx + 1))

let rec fill_from_list l arr idx =
  match l with
  | [] -> arr
  | hd :: tl ->
      Arr.set arr [| idx |] hd;
      fill_from_list tl arr (idx + 1)

let create (r_infos : rate_infos) : ('a, 'b) t =
  let new_arr = Arr.create Bigarray.Float64 [| 99 |] 0. in
  match r_infos with
  | Rate r -> Arr.map (fun _ -> r) new_arr
  | Rate_param p -> fill_from_param p new_arr 0
  | Rate_list l -> fill_from_list l new_arr 0
