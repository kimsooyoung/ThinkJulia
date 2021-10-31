using Printf
using Random
using Test
import Base.isless

abstract type CardSet end

problem_num = 3

const suit_names = ["♧", "♢", "♡", "♤"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K"]
const pedigree_names = ["pair", "twopair", "triple", "straight", "flush",
                    "fullhouse", "fourcard"]

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
mutable struct Hand <: CardSet
    cards::Array{Card, 1}
    label::String
    function Hand(cards::Array{Card,1}=Card[], label::String="No pedigree")
        new(cards, label)
    end
end

function Base.show(io::IO, cardset::CardSet)
    for card in cardset.cards
        print(io, card, "  ")
    end

    println()
end

function Base.show(io::IO, hand::Hand)
    for card in hand.cards
        print(io, card, "  ")
    end
    println()
    println("Label : ", hand.label)
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

function classify!(hand::CardSet)
    score_checker = ScoreChecker(hand)
    check_list = [ haspair, hastwopair, hastriple, hasstraight, hasflush, hasfullhouse, hasfourcard ]

    for (i, checker) in enumerate(check_list)
        if checker(score_checker) == true
            hand.label = pedigree_names[i]
        end
    end
end

struct ScoreChecker
    rank_dict::Dict{Int64, Int64}
    suit_dict::Dict{Int64, Int64}

    function ScoreChecker(hand::CardSet)
        @assert(length(hand.cards) > 0, "There's no card in Hand")

        rank_dict = Dict{Int64, Int64}()
        suit_dict = Dict{Int64, Int64}()

        for card in hand.cards
            rank_dict[card.rank] = get!(rank_dict, card.rank, 0) + 1
            suit_dict[card.suit] = get!(suit_dict, card.suit, 0) + 1
        end

        new(rank_dict, suit_dict)
    end
end

function Base.show(io::IO, score_checker::ScoreChecker)

    println(io, score_checker.rank_dict)
    print(io, score_checker.suit_dict)
end

function rankcheck(cardset::CardSet)
    rank_dict = Dict{Int64, Int64}()

    for card in cardset.cards
        rank_dict[card.rank] = get!(rank_dict, card.rank, 0) + 1
    end

    rank_dict
end

function suitcheck(cardset::CardSet)
    suit_dict = Dict{Int64, Int64}()

    for card in cardset.cards
        suit_dict[card.suit] = get!(suit_dict, card.suit, 0) + 1
    end

    suit_dict
end

function haspair(score_checker::ScoreChecker)
    output = map(x -> (x > 1 ? true : false), collect(values(score_checker.rank_dict)))
    1 in output
end

function hastwopair(score_checker::ScoreChecker)
    output = map(x -> (x > 1 ? true : false), collect(values(score_checker.rank_dict)))
    sum(output) > 1
end

function hastriple(score_checker::ScoreChecker)
    output = map(x -> (x > 2 ? true : false), collect(values(score_checker.rank_dict)))
    1 in output
end

function hasstraight(score_checker::ScoreChecker)
    rank_list = collect(keys(score_checker.rank_dict))
    if 1 in rank_list
        push!( rank_list, 14)
    end
    sort!(rank_list)

    straight_count = 0
    for i in 2:length(rank_list)
        if rank_list[i] == rank_list[i-1] + 1
            straight_count += 1
        else
            straight_count = 0
        end

        if straight_count ≥ 4
            return true
        end
    end
    
    false
end

function hasflush(score_checker::ScoreChecker)
    output = map(x -> (x ≥ 5 ? true : false), collect(values(score_checker.suit_dict)))
    1 in output
end

function hasfullhouse(score_checker::ScoreChecker)
    pair_list = collect(values(score_checker.rank_dict))
    sort!(pair_list)

    if pair_list[lastindex(pair_list)] ≥ 3 && pair_list[lastindex(pair_list)-1] ≥ 2
        return true
    else
        return false 
    end
end

function hasfourcard(score_checker::ScoreChecker)
    output = map(x -> (x ≥ 4 ? true : false), collect(values(score_checker.rank_dict)))
    1 in output
end

deck = Deck()
shuffle!(deck)

gamers = deal!(deck, 1, 7)
prob3_result_dict = Dict()

if problem_num == 1
    score_checker = ScoreChecker(gamers[1])

    @show gamers[1]
    @show score_checker

    println("haspair : ", haspair(score_checker))
    println("hastwopair : ", hastwopair(score_checker))
    println("hastriple : ", hastriple(score_checker))
    println("hasstraight : ", hasstraight(score_checker))
    println("hasflush : ", hasflush(score_checker))
    println("hasfullhouse : ", hasfullhouse(score_checker))
    println("hasfourcard : ", hasfourcard(score_checker))
end

if problem_num == 2
    classify!(gamers[1])
    println(gamers[1])
end

if problem_num == 3 || problem_num == 4 
    retry_count = 200

    for i in 1:retry_count
        dummy_deck = Deck()
        shuffle!(dummy_deck)
        dummy_gamers = deal!(dummy_deck, 1, 7)[1]
        classify!(dummy_gamers)
        prob3_result_dict[dummy_gamers.label] = get!(prob3_result_dict, dummy_gamers.label, 1) + 1
    end

    println("="^20)
    for (k, v) in prob3_result_dict
        @printf("%11s:\t%.4f\n", k, (v / retry_count) * 100 )
    end
    println("="^20)
end

