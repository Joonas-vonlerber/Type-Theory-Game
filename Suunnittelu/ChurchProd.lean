universe u v w

def CProd (A B: Type u) := (T : Type v) -> (A -> B -> T) -> T

def CProd.to_prod (self : CProd A B): A × B := self (A × B) Prod.mk
def CProd.from_prod (self: A × B): CProd A B := fun _T mk => mk self.fst self.snd

instance [Repr A] [Repr B] : Repr (CProd A B) where reprPrec self := Repr.reprPrec self.to_prod

def pair12 : CProd Nat Nat := fun _T mk => mk 1 2

def CProd.fst (self: CProd A B): A := self A (fun a _b => a)
def CProd.snd (self: CProd A B): B := self B (fun _a b => b)
def CProd.map {C D : Type u} (self : CProd A B) (f : A -> C) (g : B -> D): CProd C D := fun _T mk => mk (f self.fst) (g self.snd)




-- theorem CProd.assoc : Equiv (CProd (CProd A B) C) (CProd A (CProd B C)) := by
