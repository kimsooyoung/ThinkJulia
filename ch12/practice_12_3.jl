function getwords()
    output = [] 

    for word in eachline("words.txt")
        push!(output, word)
    end

    output
end

function anagram(words)
    prob1_output = Dict()
    prob2_output = tuple()

    for (i, word) in enumerate(words)
        letters = sort(collect(word))
        if letters ∉ keys(prob1_output)
            prob1_output[letters] = [word]
        else
            push!(prob1_output[letters], word)
        end

        # if i >= 1000
        #     return prob1_output
        # end
    end

    prob2_output = []
    for (key, value) in prob1_output
        if length(value) > 1
            push!(prob2_output, (length(value), key, value))
        end
    end
    reverse!(sort!(prob2_output))

    println(prob2_output[1:3])
    println(prob2_output[end-2:end])

    # prob3 output
    for (len, letters, words) in prob2_output
        if length(letters) == 8
            println(letters, words)
            break
        end
    end

    prob2_output
end

words = getwords()
# words = ["aaab", "aaba", "baaa"]
ag_result = anagram(words)

