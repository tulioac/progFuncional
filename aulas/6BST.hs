data BST a = Nil | Node a (BST a) (BST a) deriving (Eq, Show)

bstIsEmpty Nil = True
bstIsEmpty _ = False

bstHeight Nil = -1
bstHeight (Node a left right) = 1 + max leftHeight rightHeight
  where
    leftHeight = bstHeight left
    rightHeight = bstHeight right

bstInsert = undefined

bstSearch = undefined

bstRemove = undefined

bstPreOrder = undefined

bstOrder = undefined

bstPostOrder = undefined

bstMaximum = undefined

bstMinimum = undefined

bstPredecessor = undefined

bstSuccessor = undefined