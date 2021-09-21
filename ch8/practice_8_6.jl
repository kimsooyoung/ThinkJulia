function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end 

    i = firstindex(word1)
    j = lastindex(word2) 

    while j > 0
        if word1[i] != word2[j]
            return false
        end

        i = nextind(word1, i)
        j = prevind(word2, j)
    end

    true
end

println(isreverse("Hello", "olleH"))