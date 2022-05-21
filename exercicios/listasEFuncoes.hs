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
compress xs = head xs : compress (filter (/= head xs) (tail xs))

{-
- Varre a lista da esquerda para a direita e junta os elementos iguais. Ex: compact [2,5,8,2,1,8] = [2,2,5,8,8,1]
- Você pode usar funções sobre listas como : (cons), filter, etc.
-}
compact [] = []
compact xs = head xs : filter (== head xs) (tail xs) ++ compact (filter (/= head xs) (tail xs))

{-
- Retorna uma lista de pares com os elementos e suas quantidades. Ex: encode [2,2,2,3,4,2,5,2,4,5] = [(2,5),(3,1),(4,2),(5,2)]
- Você pode usar funções sobre listas como : (cons), filter, etc.
-}
encode [] = []
encode xs = (head xs, length (filter (== head xs) xs)) : encode (filter (/= head xs) (tail xs))

{-
- Divide uma lista em duas sub-listas onde o ponto de divisão é dado. Ex: split [3,6,1,9,4] 3 = [[3,6,1],[9,4]]
-}
split xs i = take i xs : [drop i xs]

{-
- Extrai um pedaço (slice) de uma lista especificado por um intervalo.
- Ex: slice [3,6,1,9,4] 2 4 = [6,1,9]
-}
slice xs iMin iMax = drop (iMin - 1) (take iMax xs)

{-
- Insere um elemento em uma posição especifica de uma lista.
- Ex: insertAt 7 4 [3,6,1,9,4] = [3,6,1,7,9,4]
-}
insertAt el 1 xs = el : xs
insertAt el pos xs = head xs : insertAt el (pos - 1) (tail xs)

{-
- Ordena uma lista em ordem crescente. Você deve seguir a ideia do Selection Sort onde os elementos
- menores são trazidos para o início da lista um a um. Esta função já está implementada.
-}
minList [] = undefined
minList [x] = x
minList (x : xs) = if x < minList xs then x else minList xs

remove e [] = []
remove e (x : xs)
  | e == x = xs
  | otherwise = x : remove e xs

sort [] = []
sort xs = x : ys
  where
    x = minList xs
    ys = sort (remove x xs)

{-
- Dada a função max que retorna o máximo entre dois números, escreva uma função que usa a função
- foldr e max para retornar o máximo de uma lista se a lista não é vazia.
-}
maxList [] = undefined
maxList xs = foldr max (head xs) xs

{-
- Transforma uma string em um palíndromo acrescentando o reverso da string ao seu final sem usar a função reverse.
- Ex: buildPalindrome [1,2,3] = [1,2,3,3,2,1].
-}
buildPalindrome [] = []
buildPalindrome xs = [head xs] ++ buildPalindrome (tail xs) ++ [head xs]

{-
- Computa a média dos elementos de uma lista de números, sem usar nenhuma função pronta de listas.
-}
mean xs = sumElements xs / fromIntegral (myLength xs)

sumElements xs = foldr (+) 0 xs

myLength [] = 0
myLength xs = 1 + myLength (tail xs)

{-
- Escreva a função myAppend que faz o append de uma lista xs com a lista ys, usando a função foldr.
-}
myAppend xs ys = undefined

{-
- Encontra o primeiro elemento da lista que satisfaz o predicado p ou então retorna um erro
-}
find p xs = undefined

{-
- Implementar Quick Sort usando compreensão de listas
-}
quickSort xs = undefined

{-
- Implementar Quick Sort usando filter
-}
quickSortFilter xs = undefined

{-
- Implemente uma função que soma todos os elementos de uma lista usando foldl
-}
sumFoldl xs = foldl (+) 0 xs

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
frequência xs = undefined

{-
- Função concat definida usando foldr
- A função concat representa a concatenação distribuída de listas. Ou seja, recebe uma lista de
- listas e realiza a concatenação de todas as listas.
- Ex: concat [[1,2],[3,4]] = [1,2,3,4]
-}
concatFoldr xs = undefined