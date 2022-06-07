# Módulos

## Exportação

### Sem construtores

```haskell
module Cards -- Lista de exportações
  ( Card (), -- Exporta Card, mas não os construtores
    Deck (),
    newDeck, -- Exporta a função
    shuffle,
    deal,
  )
where

data Card = Card Suit Face

data Deck = Nil

data Suit
  = Hearts
  | Spades
  | Diamonds
  | Clubs

data Face
  = Jack
  | Queen
  | King
  | Ace
  | Number Int

newDeck = undefined

shuffle = undefined

deal = undefined
```

### Com construtores

```haskell
module Cards
  ( Card (Card), -- Define os construtores a serem exportados
    Suit
      ( Hearts,
        Spades,
        Diamonds,
        Clubs
      ),
    Face
      ( Jack,
        Queen,
        King,
        Ace,
        Number
      ),
    Deck (),
    newDeck,
    shuffle,
    deal,
  )
where
...
```

```haskell
module Cards
  ( Card (..), -- Exporta todos os construtores
    Suit (..),
    Face (..),
    Deck (),
    newDeck,
    shuffle,
    deal,
  )
where
```

## Importação

```haskell
import Cards -- Importa o módulo Cards

newDeck  -- Função de Cards
-- ou
Cards.newDeck -- Uso com nome completo
```

```haskell
import qualified Cards -- Importa o módulo Cards com nome completo

Cards.newDeck
```

```haskell
import Cards (newDeck) -- Importa apenas newDeck de Cards
```

```haskell
import Cards hiding (newDeck) -- Importa tudo, exceto newDeck de Cards
```

```haskell
import qualified Cards as C -- Importa o módulo Cards com nome completo e renomeia para C

C.newDeck
```
