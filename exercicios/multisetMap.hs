module MultisetMap () where

{-
 - Um multi-conjunto (ou bag) é uma estrutura que representa uma coleção de objetos que
 - permite duplicadas. Entretanto, as duplicatas são armazenadas como a quantidade de
 - ocorrências do mesmo elemento no multi-conjunto. Exemplo, a coleção {a,b,c,c,c,b} poderia
 - ser representada como sendo {(a,1), (b,2), (c,3)}. A ideia de multi-conjunto pode ser
 - implementada de diversas formas. Uma delas é usando a implementação de Data.Map, onde
 - cada elemento da lista consiste do dado em si mapeado para sua quantidade.
 - Eh recomendável que voce consulte a documentação de Data.Map
 -}
import Data.Map as Map

{-
 - Insere um elemento na estrutura. Caso o elemento ja existe, sua quantidade na estrutura sera incrementada.
 -}
insert elem bag = undefined

{-
- Remove um elemento da estrutura, levando em consideração a manipulação de sua quantidade na estrutura.
- Caso a quantidade atinja 0 (ou menos), o elemento deve realmente ser removido da estrutura
-}
remove elem bag = undefined

{-
 - Busca um elemento na estrutura retornando sua quantidade. Caso o elemento nao exista, retorna 0 como a quantidade.
-}
search elem bag = undefined

{-
 - Faz a união deste Bag com otherBag. A união consiste em ter os elementos dos dois Bags com suas maiores quantidades.
 - Por exemplo, A = {(a,1),(c,3)}, B = {(b,2),(c,1)}. A.union(B) deixa A = {(a,1),(c,3),(b,2)}
-}
union bag1 bag2 = undefined

{-
 - Faz a interseção deste Bag com otherBag. A interseção consiste em ter os elementos que estão em ambos os bags com suas
 - menores quantidades. Por exemplo, Seja A = {(a,3),(b,1)} e B = {(a,1)}. Assim, A.intersection(B) deixa A = {(a,1)}
 - Caso nenhum elemento de A esteja contido em B ent�o a interseção deixa A vazio.
-}
intersection bag1 bag2 = undefined

{-
 - Faz a diferença deste Bag com otherBag. A diferença A \ B entre bags eh definida como segue:
   - contem os elementos de A que nao estão em B
   - contem os elementos x de A que estão em B mas com sua quantidade subtraída (quantidade em A - quantidade em B).
     Caso essa quantidade seja negativa o elemento deve ser removido do Bag.
     Por exemplo, seja A = {(a,3),(b,1)} e B = {(b,2),(a,1)}. Assim, A.minus(B) deixa A = {(a,2)}.
-}
minus bag1 bag2 = undefined

{-
 - Testa se este Bag esta incluso em otherBag. Para todo elemento deste bag, sua quantidade
 - deve ser menor or igual a sua quantidade em otherBag.
-}
inclusion bag1 bag2 = undefined

{-
 - Realiza a soma deste Bag com otherBag. A soma de dois bags contem os elementos dos dois bags com suas quantidades somadas.
-}
sum bag1 bag2 = undefined

{-
 - Retorna a quantidade total de elementos no Bag
-}
size bag = undefined