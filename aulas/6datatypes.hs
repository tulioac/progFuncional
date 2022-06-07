data Pair a b = Pair a b

pairFirst (Pair x y) = x

pairSecond (Pair x y) = y

data Maybe a = Nothing | Just a

firstElement [] = Prelude.Nothing
firstElement (x : xs) = Prelude.Just x

data Color
  = Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Purple
  | White
  | Black
  | Custom Int Int Int -- RGB components

data Triple a b c = Triple a b c deriving (Eq, Show)

tripleFirst (Triple a _ _) = a

tripleSecond (Triple _ b _) = b

tripleThird (Triple _ _ c) = c

data List a = Nil | Cons a (List a) deriving (Eq, Show)

listNull Nil = True
listNull _ = False

listLength Nil = 0
listLength (Cons x xs) = 1 + listLength xs

listHead Nil = error "Lista vazia"
listHead (Cons x xs) = x

listTail Nil = error "Lista vazia"
listTail (Cons x xs) = xs

listFoldr f v Nil = v
listFoldr f v (Cons x xs) = f x (listFoldr f v xs)

listFoldl f v Nil = v
listFoldl f v (Cons x xs) = listFoldl f (f v x) xs
