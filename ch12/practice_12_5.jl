const compressable = Dict()

function getwords()
    output = Dict()

    for word in eachline("words.txt")
        get!(output, word, 0) + 1
    end

    output
end

valid_words = getwords()

function splicecheck(word)
    output = []
    global valid_words

    for i in 1:lastindex(word)
        spliced_word = word[1:i-1] * word[i+1:end]
        if spliced_word ∈ keys(valid_words)
            push!(output, spliced_word)
        end
    end

    output
end

function splice(word)

    global compressable

    if length(word) == 0 || word ∈ keys(compressable)
        return true
    end

    splice_result = splicecheck(word)
    # @show splice_result
    if length(splicecheck(word)) > 0
        for child in splice_result
            return splice(child)
        end
    else
        return false
    end
end

# println(splice("float"))

result_list = []
for word in keys(valid_words)
    global compressable

    if splice(word)
        push!(result_list, (length(word), word))
        get!(compressable, word, 0)
    end
end

# println(compressable)
println(maximum(result_list))