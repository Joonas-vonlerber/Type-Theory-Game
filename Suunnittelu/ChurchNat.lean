universe u v w

def Cn := (T : Type u) → (T → T) → T → T

-- lol :D
-- def zero : Cn := fun _f x => x
def zero : Cn := fun _T _f x => x
def succ : Cn → Cn := (T : Type u) (n : Cn) → fun (f : T → T) (x :)

def Cn.from_nat (n : Nat) : Cn := match n with
  | 0 => fun _T _f x => x
  | Nat.succ m => fun T f x => f (Cn.from_nat m T f x)

def Cn.to_nat (self : Cn) : Nat := self Nat Nat.succ Nat.zero

def four := Cn.from_nat 4

#check four
#eval four Nat (. + 1) 2

def Cn.pow (n m : Cn) := fun T => m (T → T) (n T)


#check Cn.pow
#eval Cn.pow four four |> Cn.to_nat

instance : Repr Cn where reprPrec self := Repr.reprPrec self.to_nat
#eval four
#eval zero
