
universe u v w

def Co (A : Type v) := (T : Type u) -> (A -> T) -> T -> T


def Co.none : Co A := fun _T _f t => t
def Co.some (a : A) : Co A := fun _T f _t => f a -- use a here

def Co.from_option {A : Type u} (op: Option A) : Co A :=
match op with
  | .none => fun _T _f t => t
  | .some x => fun _T f _t => f x

#check Option.none

def Co.to_option {A : Type u} (self : Co A) : Option A := self (Option A) Option.some Option.none

instance [Repr A] : Repr (Co A) where reprPrec self := Repr.reprPrec self.to_option

#eval Co.from_option (.some 5)
