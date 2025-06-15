// counter
#let q-counter = counter("question")
#let sq-counter = counter("subquestion")
#let c-counter = counter("choices")

// state
#let choices = state("choices", ())
#let current-type = state("current-type", "general")

// reset
#let reset-all() = {
  q-counter.update(0)
  sq-counter.update(0)
  c-counter.update(0)
  choices.update(())
  current-type.update("general")
}
#let reset-c() = {
  c-counter.update(0)
  choices.update(())
}
#let reset-sq() = {
  sq-counter.update(0)
}