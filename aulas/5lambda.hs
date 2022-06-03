{-# LANGUAGE LambdaCase #-}

square = \x -> x * x

add = \x -> \y -> x + y

add2 = \x y -> x + y

insertAt = \el pos xs ->
  case (el, pos, xs) of
    (el, 1, xs) -> el : xs
    (el, pos, xs) -> head xs : insertAt el (pos - 1) (tail xs)

myLength = \case
  [] -> 0
  xs -> 1 + myLength (tail xs)