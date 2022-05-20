lista = [1, 2, 3, 4, 5, 132, 42, 423]

cabeca = head lista

cauda = tail lista

ultimo = last lista

inicio = init lista

minhaCabeca [] = error
minhaCabeca (x : xs) = x

meuUltimo [] = error
meuUltimo [x] = x
meuUltimo (x : xs) = meuUltimo xs

posicaoZero = lista !! 0

concatenacao = [1, 2] ++ [2, 3]

tamanho = length lista

taVazia = null lista

invertida = reverse lista

pegaTantos = take 5 lista

pegaAPartirDe = drop 2 lista

maximo = maximum lista

minimo = minimum lista

soma = sum lista

produto = product lista

elementoEstaNaLista = 5 `elem` lista

-- Range
zeroACinco = [0 .. 5]

umADezDeDoisEmDois = [1, 3 .. 10]

listaInfinita = [1 ..]

ciclicaInfinita = cycle [1, 2]

repetidaInfinitaComElemento = repeat 10

replicaComTamanhoDeElemento = replicate 10 5
