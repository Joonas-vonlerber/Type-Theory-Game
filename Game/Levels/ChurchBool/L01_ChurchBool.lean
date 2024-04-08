import Game.Metadata

World "ChurchBool"
Level 1

Title "Definition"

Introduction "brrbrr"

def CBool := {T: Type} -> T -> T -> T
def CTrue: CBool:= λ x _ => x
def CFalse: CBool:= λ _ y => y

def CBool.not (b: CBool): CBool:= b CTrue CFalse
def CBool.and (a b: CBool): CBool := a b CFalse
def CBool.or (a b: CBool): CBool := a CTrue b




/- Use these commands to add items to the game's inventory. -/

NewTactic rw rfl
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
