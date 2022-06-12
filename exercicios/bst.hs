{-# LANGUAGE FlexibleContexts #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module BST
  ( BinaryTree (..),
    sizeBST,
    isBST,
    insert,
    search,
    maximumBST,
    minimumBST,
    predecessor,
    successor,
    remove,
    preOrder,
    order,
    postOrder,
  )
where

--Escreva as funções sobre a estrutura de dados binary tree

data BinaryTree a = NIL | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Show, Ord)

sizeBST NIL = 0
sizeBST (Node left a right) = 1 + sizeBST left + sizeBST right

--verifica se uma BT é uma BST
isBST NIL = True
isBST (Node left a right) = and ([x < a | x <- order left] ++ [x > a | x <- order right])

--insere uma nova chave na BST retornando a BST modificada
insert x NIL = Node NIL x NIL
insert x (Node left a right)
  | x < a = Node (insert x left) a right
  | x > a = Node left a (insert x right)
  | otherwise = Node left a right

--retorna o Node da BST contendo o dado procurado ou então NIL

search x NIL = NIL
search x (Node left a right)
  | x == a = Node left a right
  | x < a = search x left
  | otherwise = search x right

-- retorna o elemento máximo da BST
maximumBST NIL = NIL
maximumBST (Node left a right)
  | right == NIL = a
  | otherwise = maximumBST right

--retorna o elemento mínimo da BST
minimumBST NIL = NIL
minimumBST (Node left a right)
  | left == NIL = a
  | otherwise = minimumBST left

-- Input: root node, key
-- output: predecessor node, successor node

-- 1. If root is NULL
--       then return
-- 2. if key is found then
--     a. If its left subtree is not null
--         Then predecessor will be the right most
--         child of left subtree or left child itself.
--     b. If its right subtree is not null
--         The successor will be the left most child
--         of right subtree or right child itself.
--     return
-- 3. If key is smaller then root node
--         set the successor as root
--         search recursively into left subtree
--     else
--         set the predecessor as root
--         search recursively into right subtree

--retorna o predecessor de um elemento da BST, caso o elemento esteja na BST
predecessor x NIL = error "Nó não presente na árvore"
predecessor x (Node left a right)
  | x == a = last (order left)
  | x > a = predecessor x right
  | x < a = predecessor x left

--retorna o sucessor de um elemento da BST, caso o elemento esteja na BST
successor x NIL = error "Nó não presente na árvore"
successor x (Node left a right)
  | x == a = head (order right)
  | x < a = successor x left
  | x > a = successor x right

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

-- no24 = Node (Node (Node NIL 2 (Node NIL 9 (Node NIL 11 NIL))) 19 NIL) 24 (Node (Node NIL 34 (Node NIL 40 (Node NIL 50 (Node NIL 53 NIL)))) 64 (Node NIL 74 (Node (Node NIL 76 NIL) 88 NIL)))
