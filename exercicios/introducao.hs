{-
- Usando os predicados not,and e or prontos de Haskell, implemente os predicados (funções) xor (or exclusivo),
- impl (implicação A => B é equivalente a (not A or B)) e equiv (A <=> B é definido como A => B and B => A)
- Procure usar casamento de padrões e reutilizar as funções.
-}

xor True False = True
xor False True = True
xor _ _ = False

impl a b = not a || b

equiv a b = impl a b && impl b a

{-
A função square esta implementada e eleva ao quadrado um determinado numero
-}
square x = x * x

{-
- Implemente a função potencia, que retorna o resultado de x elevado a y
-}
pow x 0 = 1
pow x 1 = x
pow x y = x * pow x (y - 1)

{-
- Implemente a função fatorial que calcula o fatorial de um numero
-}
factorial x
  | x == 0 || x == 1 = 1
  | otherwise = x * factorial (x -1)

{-
- Determina se um numero eh primo ou não. Preocupe-se apenas em resolver o problema.
- não precisa usar conhecimentos mais sofisticados da teoria dos números. Voce pode trabalhar com listas.
-}
isPrime x
  | x <= 3 = True
  | even x = False
  | otherwise = isPrimeAux x [3, 5 .. (x - 1)]

isPrimeAux x [] = True
isPrimeAux x (y : ys)
  | mod x y == 0 = False
  | otherwise = isPrimeAux x ys

{-
- Calcula um termo da sequencia de Fibonacci. Voce pode trabalhar com listas.
-}
fib 0 = 0
fib 1 = 1
fib 2 = 1
fib x = fib (x - 1) + fib (x - 2)

{-
- Calcula um MDC de dois números usando o algoritmo de Euclides.
-}
mdc 0 y = y
mdc x 0 = x
mdc x y = mdc y rest
  where
    rest = x `mod` y

{-
- Calcula um MMC de dois números.
-}
-- O filter pega cada elemento da lista passada e envia como parâmetro para a função de teste. No caso, cada elemento de [(max x y) .. x * y] será passado como terceiro argumento para divisible x y
mmc x y = head (filter (divisible x y) [(max x y) .. x * y])
  where
    divisible x y n = (n `mod` x == 0) && (n `mod` y == 0)

{-
- Determina se dois números inteiros positivos sao co-primos. Dois números sao co-primos se
- o mdc deles for igual a 1. Ex: coprimo 35 64 = True
-}
coprimo x y = mdc x y == 1

{- funções SOBRE LISTAS -}
{-
- Implemente suas versões para as funções abaixo sobre listas "myFunc", seguindo a mesma semântica da função original "func"
- Use pattern matching sempre que possível ou então guardas.
- Voce não pode utilizar as respectivas funções originais, mas implementar sua própria lógica
-}
myLength [] = 0
myLength (x : xs) = 1 + myLength xs

myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]

myTake _ [] = []
myTake 0 _ = []
myTake k (x : xs) = x : myTake (k - 1) xs

-- verifique se sua solução produz o mesmo resultado que "take 5 [1..]"

myDrop _ [] = []
myDrop 0 xs = xs
myDrop k (x : xs) = myDrop (k - 1) xs

myMaximum [] = 0
myMaximum [x] = x
myMaximum (x : xs)
  | x > myMaximum xs = x
  | otherwise = myMaximum xs

myMinimum [] = 0
myMinimum [x] = x
myMinimum (x : xs)
  | x < myMinimum xs = x
  | otherwise = myMinimum xs

mySum [] = 0
mySum [x] = x
mySum (x : xs) = x + mySum xs

myProduct [] = 0
myProduct [x] = x
myProduct (x : xs) = x * myProduct xs

myElem _ [] = False
myElem k (x : xs)
  | k == x = True
  | otherwise = myElem k xs

-- sua versão da função [k..m]. existem as funções succ e pred (sucessor e predecessor que podem ser uteis)
myRange k m
  | k <= m = k : myRange (succ k) m
  | otherwise = []

-- sua versão da função [k,p..m]
myRangeStep k p m
  | k > m = []
  | k < m = k : myRangeStep nextK nextP m
  | otherwise = [m]
  where
    difference = p - k
    nextK = k + difference
    nextP = p + difference

myCycle [] = []
myCycle xs = xs ++ myCycle xs

myRepeat n = n : myRepeat n

myReplicate k 0 = []
myReplicate k n = k : myReplicate k (n - 1)
