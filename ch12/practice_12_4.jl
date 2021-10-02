function getwords()
    output = [] 

    for word in eachline("words.txt")
        push!(output, word)
    end

    output
end

function anagram(words)
    output = Dict()

    for (i, word) in enumerate(words)
        letters = sort(collect(word))
        if letters ∉ keys(output)
            output[letters] = [word]
        else
            push!(output[letters], word)
        end
    end

    output
end

function checkexchange(word1, word2)
    count = 0
    for (letter1, letter2) in zip(word1, word2)
        if letter1 != letter2
            count += 1
        end
    end

    if count == 2
        return true
    end
    
    false
end

function combinationchecker(values)
    output = []

    for i in 1:lastindex(values)
        for j in i:lastindex(values)
            if checkexchange(values[i],values[j])
                push!(output, tuple(values[i], values[j]))
            end
        end
    end

    output
end

function exchage(ag_result)
    output = []

    for (key, value) in ag_result
        if length(value) > 1
            comb_result = combinationchecker(value)
            if length(comb_result) > 1
                push!(output, comb_result...)
            end
        end
    end

    output
end

words = getwords()
ag_result = anagram(words)

for pairs in exchage(ag_result)
    println(pairs)
end
