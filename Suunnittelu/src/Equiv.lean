import Mathlib




structure myEquiv (A B : Type) where
  toFun : A → B
  invFun : B → A
  left_inv : toFun ∘ invFun = id
  right_inv : invFun ∘ toFun = id

example : (Nat ⊕ Nat) ≃ (Nat × Bool) := {
  toFun := fun natnat => match natnat with
    | .inl a => (a, true)
    | .inr a => (a, false)
  invFun := fun natbool => match natbool with
    | (a,true) => .inl a
    | (a,false) => .inr a
  left_inv := by
    intro natnat
    simp
    cases natnat
    case _ a =>
      simp
    case _ b =>
      simp
  right_inv := by
    intro natbool
    simp
    cases natbool
    case _ fst snd =>
      cases snd
      case _ =>
        simp
      case _ =>
        simp


}
