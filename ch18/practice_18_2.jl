using Printf
using Random
import Base.isless


const suit_names = ["♧", "♢", "♡", "♤"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K"]

struct Card
    suit::Int64 
    rank::Int64 

    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "suit should be btw 1 ~ 4")
        @assert(1 ≤ rank ≤ 13, "rank should be btw 1 ~ 13")
        new(suit, rank)
    end
end

function Base.show(io::IO, card::Card)
    print(io, "$(rank_names[card.rank])$(suit_names[card.suit])" )
end

function isless(card1::Card, card2::Card)
    (card1.suit, card1.rank) < (card2.suit, card2.rank)
end

struct Deck
    cards::Array{Card, 1}

    function Deck()
        cards = []
        for i in 1:4
            for j in 1:13
                push!(cards, Card(i, j))
            end
        end
        new(cards)
    end
end

function Base.show(io::IO, deck::Deck)
    for card in deck.cards
        print(card, " ")
    end
end 

function Base.pop!(deck::Deck)
    pop!(deck.cards)
end

function Base.push!(deck::Deck, card::Card)
    push!(deck.cards, card)
end

function Base.sort!(deck::Deck)
    sort!(deck.cards)
end 

function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    deck
end

queen_of_diamonds = Card(2, 12)
king_of_heart = Card(3, 13)

deck = Deck()
println(deck)

println("Shuffle!")
shuffle!(deck)
println(deck)

println("Sort!")
sort!(deck)
println(deck)

println("Pop!")
pop!(deck)
println(deck)

println("Push!")
push!(deck, king_of_heart)
println(deck)
