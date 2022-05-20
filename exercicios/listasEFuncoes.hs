{-
- Encontra o penúltimo elemento de uma lista. Caso a lista seja vazia ou tenha apenas um elemento retorne o seguinte comando: error "Lista sem penúltimo"
-}

penúltimo [] = error "Lista sem penúltimo"
penúltimo [x] = error "Lista sem penúltimo"
penúltimo xs = last (init xs)

{-
- Retorna o k-ésimo (k varia de 0 ate N-1) elemento de uma lista. Ex: elementAt 2 [4,7,1,9] = 7
-}
elementAt _ [] = error
elementAt 0 xs = head xs
elementAt i xs = elementAt (i - 1) (tail xs)

{-
- Diz se uma lista é palíndromo.
-}
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome xs
  | head xs == last xs = isPalindrome (init (tail xs))
  | otherwise = False

{-
- Remove os elementos duplicados de uma lista. Ex: compress [2,5,8,2,1,8] = [2,5,8,1]
- Você pode usar a função elem de Haskell
-}
compress [] = []
compress xs = compress (init xs) ++ [y | y <- [last xs], not y `elem` init xs]

-- CONTINUAR DAQUI
{-
- Varre a lista da esquerda para a direita e junta os elementos iguais. Ex: compact [2,5,8,2,1,8] = [2,2,5,8,8,1]
- Você pode usar funções sobre listas como : (cons), filter, etc.
-}
-- for each element, create a list
compact xs = undefined

{-
- Retorna uma lista de pares com os elementos e suas quantidades. Ex: encode [2,2,2,3,4,2,5,2,4,5] = [(2,5),(3,1),(4,2),(5,2)]
- Você pode usar funções sobre listas como : (cons), filter, etc.
-}
encode xs = undefined

{-
- Divide uma lista em duas sublistas onde o ponto de divisão é dado. Ex: split [3,6,1,9,4] 3 = [[3,6,1],[9,4]]
-}
split xs i = undefined

{-
- Extrai um pedaço (slice) de uma lista especificado por um intervalo.
- Ex: slice [3,6,1,9,4] 2 4 = [6,1,9]
-}
slice xs imin imax = undefined

{-
- Insere um elemento em uma posição especifica de uma lista.
- Ex: insertAt 7 4 [3,6,1,9,4] = [3,6,1,7,9,4]
-}
insertAt el pos xs = undefined

{-
- Ordena uma lista em ordem crescente. Você deve seguir a ideia do selectionsort onde os elementos
- menores sao trazidos para o inicio da lista um a um. Esta função ja esta implementada.
-}
minList [x] = x
minList (x : xs) = if (x < (minList xs)) then x else minList xs

remove e (x : xs)
  | e == x = xs
  | otherwise = x : (remove e xs)

sort [] = []
sort xs = x : ys
  where
    x = minList xs
    ys = sort (remove x xs)

{-
- Dada a função max que retorna o máximo entre dois números, escreva uma função que usa a função
- foldr e max para retornar o máximo de uma lista se a lista não é vazia.
-}
maxList xs = undefined

{-
- Transforma uma string em uma palindrome acrescentando o reverso da string ao seu final sem usar a função reverse.
- Ex: buildPalindrome [1,2,3] = [1,2,3,3,2,1].
-}
buildPalindrome xs = undefined

{-
- Computa a media dos elementos de uma lista de números, sem usar nenhuma função pronta de listas.
-}
mean xs = undefined

{-
- Escreva a função myAppend que faz o append de uma lista xs com a lista ys, usando a função foldr.
-}
myAppend xs ys = undefined

{-
- Encontra o primeiro elemento da lista que satisfaz o predicado p ou então retorna um erro
-}
find p xs = undefined

{-
- Implementar quick sort usando compreensão de listas
-}
quickSort xs = undefined

{-
- Implementar quick sort usando filter
-}
quickSortFilter xs = undefined

{-
- Implemente uma função que soma todos os elementos de uma lista usando foldl
-}
sumFoldl xs = undefined

{-
- Retorna uma lista sem repetição a partir de uma lista possivelmente com elementos repetidos
-}
unique xs = undefined

{-
- Conta a quantidade de ocorrências de um elemento em uma lista
-}
count x xs = undefined

{-
- Dada uma lista de elementos possivelmente repetidos, retorna uma lista de
- pares contendo um elemento da lista original e sua quantidade de ocorrências
- Cada elemento da lista original possui apenas um par correspondente na lista de resposta
-}
frequencia xs = undefined

{-
- Função concat definida usando foldr
- A função concat representa a concatenação distribuída de listas. Ou seja, recebe uma lista de
- listas e realiza a concatenação de todas as listas.
- Ex: concat [[1,2],[3,4]] = [1,2,3,4]
-}
concatFoldr xs = undefined