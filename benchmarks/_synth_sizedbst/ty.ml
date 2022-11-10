let[@library] int_range =
  let (a : [%over: int]) = (true : [%v: int]) in
  let (b : [%over: int]) = (a <= v : [%v: int]) in
  (a <= v && v <= b : [%v: int])

  let[@library] int_gen =
  let (dummy : [%over: unit]) = (true : [%v: unit]) in
  (true : [%v: int])


let[@library] increment =
  let (n : [%over: int]) = (true : [%v: int]) in
  (v == (n + 1) : [%v: int])


let[@library] decrement =
  let (n : [%over: int]) = (true : [%v: int]) in
  (v == (n - 1) : [%v: int])



let[@library] lt_eq_one =
  let (s : [%over: int]) = (true : [%v: int]) in
  (iff v (s <= 1) && iff (not v) (s > 1) : [%v: bool])

let[@library] subs =
    let (s : [%over: int]) = (true : [%v: int]) in
    (v == (s - 1) : [%v: int])

let[@library] bool_gen =
  let (dummy : [%over: unit]) = (true : [%v: unit]) in
  (true : [%v: bool])

let[@library] s = (true : [%v: int])

let[@library] d1 = (true : [%v: int])

let[@library] n = (true : [%v: int])

let goal =
  let (d : [%over: int]) = (0 <= v : [%v: int]) in
  let (s0 : [%over: int]) = (d <= v : [%v: int]) in
  let (lo : [%over: int]) = (true : [%v: int]) in
  let (hi : [%over: int]) = (v == lo + d : [%v: int]) in
  (fun (u : [%forall: int]) ->
     implies (mem v u) (lo < u && u < hi) && sorted v && rng v d
    : [%v: int tree])
