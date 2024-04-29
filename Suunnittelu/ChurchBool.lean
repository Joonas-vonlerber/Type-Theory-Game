universe u v w

def Cb := (T: Type u) -> T -> T -> T
def Cb.t: Cb := fun _T x _ => x
def Cb.f: Cb := fun _T _ y => y

def Cb.not (b: Cb): Cb := b _ Cb.t Cb.f
def Cb.and (a b: Cb): Cb := a _ b Cb.f
def Cb.or (a b: Cb): Cb := a _ Cb.t b

def Cb.from_bool(self: Bool): Cb := if self then Cb.t else Cb.f
def Cb.to_bool(self: Cb): Bool := self Bool true false

instance : Repr Cb where reprPrec self := Repr.reprPrec self.to_bool

#eval Cb.and Cb.t Cb.t
