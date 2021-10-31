using Printf
using Random
using Test
import Base.isless

abstract type CardSet end

const suit_names = ["♧", "♢", "♡", "♤"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K"] 

struct Card
    suit::Int64
    rank::Int64
    function Card(suit::Int64, rank::Int64)
        @assert(1 ≤ suit ≤ 4, "Suit should be btw 1 ~ 4")
        @assert(1 ≤ rank ≤ 13, "Rank should be btw 1 ~ 13")
        new(suit, rank)
    end
end

function Base.show(io::IO, card::Card)
    print(io, "$(rank_names[card.rank])$(suit_names[card.suit])")
end

function isless(card1::Card, card2::Card)
    (card1.suit, card1.rank) < (card2.suit, card2.rank)
end

struct Deck <: CardSet
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


# cards::Array{Card,1}=Card[] => 이 부분에 주의 !!!
struct Hand <: CardSet
    cards::Array{Card, 1}
    label::String
    function Hand(cards::Array{Card,1}=Card[], label::String="")
        new(cards, label)
    end
end

function Base.show(io::IO, cardset::CardSet)
    for card in cardset.cards
        print(io, card, "  ")
    end

    println()
end

function Base.pop!(cardset::CardSet)
    pop!(cardset.cards)
end

function Base.push!(cardset::CardSet, card::Card)
    push!(cardset.cards, card)
    nothing
end

function Random.shuffle!(cardset::CardSet)
    shuffle!(cardset.cards)
end

function Base.sort!(cardset::CardSet)
    sort!(cardset.cards)
end

function move(cardset1::CardSet, cardset2::CardSet, n::Int64=1)
    @assert(1 ≤ n ≤ length(cardset1.cards), "Not enough cards for move")

    for i in 1:n
        card = pop!(cardset1)
        push!(cardset2, card)
    end
end

function deal!(deck::Deck, participants::Int64, num_card::Int64)
    hands = []
    for i in 1:participants
        push!(hands, Hand())
    end

    for i in 1:num_card
        for j in 1:participants
            move(deck, hands[j], 1)
        end
    end
    hands
end


deck = Deck()
shuffle!(deck)
gamers = deal!(deck, 2, 6)

for gamer in gamers
    println(gamer)
end