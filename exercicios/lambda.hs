{-# HLINT ignore "Redundant lambda" #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
--Exemplos de expressões lambda
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

square = \x -> x * x

--Implemente as funções anteriormente escritas usando expressões lambda
--consulte suas implementações anteriores para a documentação dessas funções

pow = \x y ->
  case y of
    0 -> 1
    1 -> x
    y -> x * pow x (y - 1)

fatorial = \case
  0 -> 1
  1 -> 1
  x -> x * fatorial (x - 1)

isPrime = \x -> x <= 3 || (odd x && isPrimeAux x [3, 5 .. (x - 1)])

isPrimeAux = \x ys ->
  case ys of
    [] -> True
    ys -> mod x (head ys) /= 0 && isPrimeAux x (tail ys)

fib = \case
  0 -> 0
  1 -> 1
  2 -> 1
  x -> fib (x - 1) + fib (x - 2)

mdc = \x y ->
  case x of
    0 -> y
    y -> if y == 0 then x else mdc y x `mod` y

mmc = \x y -> head (filter (divisible x y) [(max x y) .. x * y])
  where
    divisible x y n = (n `mod` x == 0) && (n `mod` y == 0)

coprimo = \x y -> mdc x y == 1

goldbach x = undefined

--Implemente as funções sobre listas escritas previamente usando expressões lambda
--consulte suas implementações anteriores para a documentação dessas funções
meuLast = \case
  [] -> error "Lista sem último"
  [x] -> x
  (x : xs) -> meuLast xs

penúltimo = \case
  [] -> error "Lista sem penúltimo"
  [x] -> error "Lista sem penúltimo"
  xs -> last (init xs)

elementAt = \i xs ->
  case (i, xs) of
    (_, []) -> error "Lista vazia"
    (0, xs) -> head xs
    (i, xs) -> elementAt (i - 1) (tail xs)

meuLength = \case
  [] -> 0
  xs -> 1 + meuLength (tail xs)

meuReverso = \case
  [] -> []
  xs -> last xs : meuReverso (init xs)

isPalindrome :: Eq a => [a] -> Bool
isPalindrome = \case
  [] -> True
  [x] -> True
  xs -> head xs == last xs && isPalindrome (init (tail xs))

compress :: Eq a => [a] -> [a]
compress = \case
  [] -> []
  xs -> head xs : compress (filter (/= head xs) (tail xs))

compact :: Eq a => [a] -> [a]
compact = \case
  [] -> []
  xs -> head xs : filter (== head xs) (tail xs) ++ compact (filter (/= head xs) (tail xs))

encode :: Eq a => [a] -> [(a, Int)]
encode = \case
  [] -> []
  xs -> (head xs, length (filter (== head xs) xs)) : encode (filter (/= head xs) (tail xs))

split = \xs i -> take i xs : [drop i xs]

slice = \xs iMin iMax -> drop (iMin - 1) (take iMax xs)

insertAt = \el pos xs ->
  case (el, pos, xs) of
    (el, 1, xs) -> el : xs
    (el, pos, xs) -> head xs : insertAt el (pos - 1) (tail xs)

minList :: Ord a => [a] -> a
minList = \case
  [] -> undefined
  [x] -> x
  (x : xs) -> if x < minList xs then x else minList xs

remove :: Eq t => t -> [t] -> [t]
remove = \e xs ->
  case (e, xs) of
    (e, []) -> []
    (e, x : xs) -> if e == x then xs else x : remove e xs

sort :: Ord a => [a] -> [a]
sort = \case
  [] -> []
  xs -> x : ys
    where
      x = minList xs
      ys = sort (remove x xs)

mySum = \case
  [] -> 0
  [x] -> x
  (x : xs) -> x + mySum xs

maxList :: Ord p => [p] -> p
maxList = \case
  [] -> undefined
  xs -> foldr max (head xs) xs

buildPalindrome = \case
  [] -> []
  xs -> [head xs] ++ buildPalindrome (tail xs) ++ [head xs]

mean = \xs -> sumElements xs / fromIntegral (myLength xs)

sumElements :: (Foldable t, Num b) => t b -> b
sumElements = foldr (+) 0

myLength = \case
  [] -> 0
  xs -> 1 + myLength (tail xs)

myAppend :: Foldable t => [a] -> t a -> [a]
myAppend = foldr (:)
