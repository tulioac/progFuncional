module Cards
  ( Card (..),
    Suit (..),
    Face (..),
    Deck (),
    newDeck,
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
