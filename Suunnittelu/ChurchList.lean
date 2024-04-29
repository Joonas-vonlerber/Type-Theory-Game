universe u v w

def Cl (A: Type v) := (T: Type u) -> (A -> T -> T) -> T -> T

def Cl.nil {A : Type u}: Cl A := fun _T _f x => x
def Cl.singleton {A : Type u} (a : A): Cl A := fun _T f x => f a x
-- def Cl.singleton' {A : Type u} (a : A) := fun f x => f a x
--                 f a₁ (f a₂ (f a₃ .. (f aₙ x)..))
-- foldr https://hackage.haskell.org/package/base-4.19.1.0/docs/Prelude.html#v:foldr
def Cl.cons (a : A) (as : Cl A) : Cl A := fun T f x => f a (as T f x)

-- foldl
def Cl.snoc (a : A) (as : Cl A) : Cl A := fun T f x => as T f (f a x)

def Cl.from_list {A: Type u}(list : List A): Cl A :=
match list with
  | .nil => Cl.nil
  | .cons x xs => Cl.cons x (Cl.from_list xs)

def Cl.to_list {A: Type u}(clist: Cl A): List A := clist (List A) .cons .nil

instance [Repr A] : Repr (Cl A) where reprPrec self := Repr.reprPrec self.to_list

#eval Cl.from_list [1, 2, 3]

def list1 : Cl Int := Cl.cons 0 (Cl.cons 1 Cl.nil)
#eval list1.to_list
#eval list1 _ (. - .) 0

def list2 : Cl Nat := Cl.snoc 0 (Cl.snoc 1 Cl.nil)
#eval list2.to_list
#eval list2 _ (. - .) 0


def Cl.reverse(self: Cl A): Cl A := self _ (fun x rev => Cl.snoc x rev) Cl.nil
#eval Cl.reverse <| Cl.from_list [1,2,3]

-- Joonaksen ratkaisu
def Cl.append(self other: Cl A) : Cl A := self _ (fun x list => Cl.cons x list) other
def Cl.append'(self other: Cl A) : Cl A := fun T f x => self (Cl A) (fun a list T f x => f a (list T f x)) other T f x

#eval Cl.append (Cl.from_list [1,2,3]) (Cl.from_list [2,3,4])

-- Niklaksen tapa
def Cl.append''(self other: Cl A) : Cl A := fun T f x => self T f (other T f x)

#eval Cl.append'' (Cl.from_list [1,2,3]) (Cl.from_list [2,3,4])

def Cl.isnil(self: Cl A): Bool := self _ (fun _ _ => false) true
#eval Cl.isnil <| Cl.from_list [1,2,3]
#eval Cl.isnil (Cl.from_list (A := Int) [])

def Cl.head?(self: Cl A): Option A := self _ (fun x _f => .some x) .none

#eval Cl.head? <| Cl.from_list (A := Int) [1,2,3]
#eval Cl.head? <| Cl.from_list (A := Int) []

def Cl.tail?(self: Cl A): Cl A := self (Option (Cl A)) (fun x f => f.map (fun e => Cl.cons x e)) .none

#eval Option.getD  (Cl.tail? <| Cl.from_list (A := Int) [1,2,3]) (Cl.cons 1 Cl.nil)

-- def Cl.isSingOrNil(self: Cl A): Bool := self Bool (fun x t => ) true

-- FUTURE todos
-- - BUT why are cons and cons' equally valid constructors and cover all lists equally
