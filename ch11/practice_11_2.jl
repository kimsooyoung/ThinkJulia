function getVocab()
    my_list = []

    for line in eachline("words.txt")
        push!(my_list, line)
    end

    my_list
end

function inbisect(sorted_arr, t)
    
    if length(sorted_arr) == 1 || length(sorted_arr) == 2 || length(sorted_arr) == 3
        if t in sorted_arr
            return true
        else
            return false
        end
    end

    cur_index = length(sorted_arr) ÷ 2
    cur_value = sorted_arr[cur_index]
    
    # @show sorted_arr cur_index cur_value
    
    if cur_value == t
        return true
    elseif cur_value > t
        # println("big")
        inbisect(sorted_arr[1:cur_index], t)
    else
        # println("small")
        inbisect(sorted_arr[cur_index:end], t)
    end
end

function searchBruteForce(my_word)
    for word in eachline("words.txt")
        if word == my_word
            return true
        end
    end
    false
end

function getWords()
    word_dict = Dict()

    for word in eachline("words.txt")
        word_dict[word] = 0
    end

    word_dict
end

function searchDict(word, dict)
    if word ∈ keys(dict)
        return true
    end
    false
end


word = "reducible"

my_dict = getWords()
println(searchDict(word, my_dict))

my_list = getVocab()
sort!(my_list)
println(inbisect(my_list, word))

println(searchBruteForce(word))