
universe u v w

theorem Yoneda_mp : (A → B) → {T : Sort u} → ((B → T) → (A → T)) := by
  intro ab T bt a
  apply bt
  apply ab
  assumption

theorem Yoneda_mpr : ({T : Sort u} → (B → T) → (A → T)) → (A → B) := by
  intro btat
  intro a
  -- wtf
  admit
  sorry
