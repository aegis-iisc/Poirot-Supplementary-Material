let list_gen =
  let (s : [%over: int]) = (v >= 0 : [%v: int]) in
  let (x : [%over: int]) = (true : [%v: int]) in
  (len v s && fun (u : [%forall: int]) -> implies (mem v u) (u == x)
    : [%v: int list])
