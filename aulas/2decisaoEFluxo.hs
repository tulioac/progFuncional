menorQueCinco x = if x < 5 then "Menor" else "Maior"

guardas x
  | x < 5 = 1
  | x < 10 = 8
  | x > 10 = 11
  | otherwise = 100
