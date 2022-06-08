import Control.Arrow (ArrowChoice (right))

--Escreva um tipo Quadruple que contem 4 elementos: dois de um mesmo tipo e outros dois de outro tipo
--Escreva as funções firstTwo e secondTwo que retornam os dois primeiros e os dois últimos, respectivamente
data Quadruple a b = QVazio | Quadruple a a b b

firstTwo QVazio = error "Sem dois primeiros"
firstTwo (Quadruple a1 a2 _ _) = (a1, a2)

secondTwo QVazio = error "Sem dois últimos"
secondTwo (Quadruple _ _ b1 b2) = (b1, b2)

--Escreva um tipo de dados que pode conter um, dois, tres ou quatro elementos, dependendo do construtor
--Implemente funções tuple1 até tuple4 que que retornam Just <valor> ou Nothing se o valor nao existe
data Tuple a b c d = TVazio | Tuple1 a | Tuple2 a b | Tuple3 a b c | Tuple4 a b c d
  deriving (Eq, Show)

tuple1 TVazio = error "Sem primeiro"
tuple1 (Tuple1 a) = a
tuple1 (Tuple2 a _) = a
tuple1 (Tuple3 a _ _) = a
tuple1 (Tuple4 a _ _ _) = a

tuple2 TVazio = error "Sem segundo"
tuple2 (Tuple1 _) = error "Sem segundo"
tuple2 (Tuple2 _ b) = b
tuple2 (Tuple3 _ b _) = b
tuple2 (Tuple4 _ b _ _) = b

tuple3 TVazio = error "Sem terceiro"
tuple3 (Tuple1 _) = error "Sem terceiro"
tuple3 (Tuple2 _ _) = error "Sem terceiro"
tuple3 (Tuple3 _ _ c) = c
tuple3 (Tuple4 _ _ c _) = c

tuple4 TVazio = error "Sem quarto"
tuple4 Tuple1 {} = error "Sem quarto"
tuple4 Tuple2 {} = error "Sem quarto"
tuple4 Tuple3 {} = error "Sem quarto"
tuple4 (Tuple4 _ _ _ d) = d

data List a = Nil | Cons a (List a) deriving (Eq, Show)

listLength Nil = 0
listLength (Cons x xs) = 1 + listLength xs

listHead Nil = error "Empty list"
listHead (Cons x xs) = x

listTail Nil = error "Empty list"
listTail (Cons x xs) = xs

listFoldr f v Nil = v
listFoldr f v (Cons x xs) = f x (listFoldr f v xs)

listFoldl f v Nil = v
listFoldl f v (Cons x xs) = listFoldl f (f v x) xs

--Escreva as funções sobre a estrutura de dados binary tree
data BinaryTree a = NIL | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Show)

sizeBST NIL = 0
sizeBST (Node left a right) = 1 + sizeBST left + sizeBST right

--verifica se uma BT é uma BST
isBST :: BinaryTree a -> Bool
isBST NIL = True

-- isBST (Node a left right) = max (order left)

--insere uma nova chave na BST retornando a BST modificada
insert = undefined

--retorna o Node da BST contendo o dado procurado ou então NIL
search = undefined

-- retorna o elemento máximo da BST
maximum = undefined

--retorna o elemento mínimo da BST
minimum = undefined

--retorna o predecessor de um elemento da BST, caso o elemento esteja na BST
predecessor = undefined

--retorna o sucessor de um elemento da BST, caso o elemento esteja na BST
successor = undefined

--remove ume elemento da BST
remove = undefined

--retorna uma lista com os dados da BST nos diversos tipos de caminhamento
preOrder :: BinaryTree a -> [a]
preOrder NIL = []
preOrder (Node left a right) = [a] ++ preOrder left ++ preOrder right

order :: BinaryTree a -> [a]
order NIL = []
order (Node left a right) = order left ++ [a] ++ order right

postOrder :: BinaryTree a -> [a]
postOrder NIL = []
postOrder (Node left a right) = postOrder left ++ postOrder right ++ [a]

-- AO FINAL DAS IMPLEMENTAÇÕES, VOCE PRECISA MODULARIZAR O SEU CÓDIGO ACIMA DA SEGUINTE FORMA
-- COLOQUE TODA A IMPLEMENTAÇÃO DE LISTA EM UM MODULO CHAMADO MYLIST
-- COLOQUE TODA A IMPLEMENTAÇÃO DE ARVORE BINARIA EM UM MODULO CHAMADO BST

-- Nós para testes
--           83
--     71          95
--   54  74
-- 6       76

noA = Node NIL 6 NIL

noB = Node noA 54 NIL

noC = Node NIL 76 NIL

noD = Node NIL 74 noC

noE = Node noB 71 noD

noF = Node NIL 95 NIL

noG = Node noE 83 noF

-- order = [6,54,71,74,76,83,95]
-- preOrder = [83,71,54,6,74,76,95]

no4 = Node NIL 4 NIL

no5 = Node NIL 5 NIL

no2 = Node no4 2 no5

no3 = Node NIL 3 NIL

no1 = Node no2 1 no3