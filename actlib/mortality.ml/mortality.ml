(*module Mat = Owl_dense_matrix_generic*)

type ('a, 'b) t = ('a, 'b) Owl_dense_matrix_generic.t
type lx = float
type dx = float
type qx = float
type px = float

module M = struct
  include Owl_dense_matrix_generic
  include Owl_operator.Make_Basic (Owl_dense_matrix_generic)
  include Owl_operator.Make_Extend (Owl_dense_matrix_generic)
  include Owl_operator.Make_Matrix (Owl_dense_matrix_generic)
end

let dx_t (lx_t : lx) (lx_t1 : lx) : dx = lx_t -. lx_t1
let qx_t (dx_t : lx) (lx_t : lx) : qx = dx_t /. lx_t
let px_t_from_lxs (lx_t : lx) (lx_t1 : lx) : px = lx_t1 /. lx_t
let px_t_from_qx (qx_t : qx) = 1. -. qx_t
