using Printf

struct Markov
    order::Int64
    # String, Vararg{String} => 일단 String 하나, 
    # 그 뒤에 여러개의 String이 가변적으로 올 수 있다는 뜻
    suffixes::Dict{Tuple{String, Vararg{String}}, Array{String, 1}}
    prefix::Array{String, 1}
    voca::Set{String}
    function Markov(order::Int64=2)
        suffixes = Dict{Tuple{String, Vararg{String}}, Array{String, 1}}()
        prefix = Array{String, 1}()
        voca = Set{String}()
        new(order, suffixes, prefix, voca)
    end
end

function Base.show(io::IO, markov::Markov)
    println(io, "Order : $(markov.order)")
    println(io, "Prefix : $(markov.prefix)")
    println(io, "Voca : $(markov.voca)")

    println(io, "Suffixes")
    for (key, val) ∈ markov.suffixes
        println(io, "$(key) => $(val)")
    end
end

function markov_mapping(markov::Markov, file_name::String)
    p = []
    for line in eachline(file_name)
        p = process_markovline(line, markov)
    end
end

function process_markovline(line::String, markov::Markov)
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    line = replace(line, '—'=>' ')
    line = replace(line, '_'=>' ')
    line = replace(line, ';'=>' ')

    splited_line = split(line)
    if length(splited_line) < markov.order
        return nothing
    end

    if markov.prefix == []
        for i in 1:markov.order
            push!(markov.prefix, popfirst!(splited_line))
        end
    end

    for word in splited_line
        # @show typeof(word) word
        processword(markov, String(word))
    end
end

function processword(markov::Markov, word::String)
    if length(markov.prefix) < markov.order
        push!(markov.prefix, word)
        return
    end

    get!(markov.suffixes, (markov.prefix...,), Array{String, 1}() )
    push!(markov.suffixes[(markov.prefix...,)], word)
    popfirst!(markov.prefix)
    push!(markov.prefix, word)

    push!(markov.voca, word) 
end

function markov_analysis(markov::Markov, words_len::Int64)
    start_word, _ = rand(markov.suffixes)
    output = collect(start_word)
    
    for i in 1:words_len-2
        next = rand(markov.suffixes[start_word])
        push!(output, next)
        start_word = (start_word[2:end]..., next)
    end

    join(output, " ")
end

markov = Markov(2)
# # Test 1 : Markov Struct itself test.
# words  = split("This is for test Application")
# words  = map(elem -> String(elem), words)
# for word in words
#     processword(markov, word)
# end
# println(markov)
"""Output
    Order : 2
    Prefix : ["test", "Application"]
    Suffixes
    ("is", "for") => ["test"]
    ("This", "is") => ["for"]
    ("for", "test") => ["Application"]
"""

# Test 2 : Markov Mapping test.
# markov_mapping(markov, "short_emma.txt")
# markov_mapping(markov, "emma.txt")
# println(markov)


# Test 3 : Markov Analysis test.
markov_mapping(markov, "emma.txt")
sentence = markov_analysis(markov, 3)
println(sentence)
