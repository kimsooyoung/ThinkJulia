using Printf
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
    print(io, "$(rank_names[card.rank]) $(suit_names[card.suit])" )
end

function isless(card1::Card, card2::Card)
    (card1.suit, card1.rank) < (card2.suit, card2.rank)
end

queen_of_diamonds = Card(2, 12)
king_of_heart = Card(3, 12)
println( "$(queen_of_diamonds), $(king_of_heart)" )
println(isless(queen_of_diamonds, king_of_heart))
