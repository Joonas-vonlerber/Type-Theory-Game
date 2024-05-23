# Maailmat

## Church Unit

- $\forall\ T.\ T \to T$
  - Esittelemismaailma, kuinka lean...
  - syntaksi
    - `def`
    - `by`
    - `:=`
    - `:`
  - Tyypit konsepteina
    - polymorfismi

## Boolean

- $\forall\ T.\ T \to T \to T$
  - Määritellään Church Bool tyyppi.
    - true ja false
  - Not
  - And
  - Or
  - if then else

## Nat 1

- $\forall\ T.\ (T \to T) \to T \to T$
- zero
- succ
- is_zero
- mul

## Option

- mk
- toBool
- getD
- filter
- bind
- map
- toList

- Side-quest Church 4,5,6

## Product

- mk
- fst, snd
- map
- proof of associativity (A × B) × C = A × (B × C)

## Coproduct

- inl, inr
-

## List

- def ChL
- append
- snoc
- nil
- sing
- cons
- length
- isempty
- head
- tail
- isEmpty
- map
- reverse

## Nat 2

More difficult church numeral exercises

- pow
- pred
- sub

## Equiv

Proofs about equality of types

- `Coproduct Unit Unit \equiv Nat`
- `Coproduct Unit Nat \equiv Option Nat`

- Church non-empty-list
- Isomorphism
- Induction
