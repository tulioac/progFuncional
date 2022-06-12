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

tuple1 TVazio = Nothing
tuple1 (Tuple1 a) = Just a
tuple1 (Tuple2 a _) = Just a
tuple1 (Tuple3 a _ _) = Just a
tuple1 (Tuple4 a _ _ _) = Just a

tuple2 TVazio = Nothing
tuple2 (Tuple1 _) = Nothing
tuple2 (Tuple2 _ b) = Just b
tuple2 (Tuple3 _ b _) = Just b
tuple2 (Tuple4 _ b _ _) = Just b

tuple3 TVazio = Nothing
tuple3 (Tuple1 _) = Nothing
tuple3 (Tuple2 _ _) = Nothing
tuple3 (Tuple3 _ _ c) = Just c
tuple3 (Tuple4 _ _ c _) = Just c

tuple4 TVazio = Nothing
tuple4 (Tuple1 _) = Nothing
tuple4 (Tuple2 _ _) = Nothing
tuple4 (Tuple3 _ _ _) = Nothing
tuple4 (Tuple4 _ _ _ d) = Just d
