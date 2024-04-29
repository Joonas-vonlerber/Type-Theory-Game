-- Unit in Lean. The `Unit` type in lean contains (at least) one element, `()`

#check ()

example : Unit := by
  exact ()

-- The Unit type contains at most one element, i.e. all other elements must be **the** unit
theorem Unit.eta (u : Unit) : u = () := rfl

example (u1 u2 : Unit) : u1 = u2 := by
  rewrite [Unit.eta u1, Unit.eta u2]
  rfl
