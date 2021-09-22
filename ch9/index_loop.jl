function isabecedarian1(word)
    i = firstindex(word)
    previous = word[i]
    j = nextind(word, i)
    for c in word[j:end]
        if c < previous
            return false
        end
        previous = c
    end

    true
end

function isabecedarian2(word)
    if length(word) <= 1
        return true
    end

    i = firstindex(word)
    j = nextind(word, i)
    if word[i] > word[j]
        return false
    end

    isabecedarian2(word[j:end])
end

function isabecedarian3(word)
    i = firstindex(word)
    j = nextind(word, 1)

    while j <= sizeof(word)
        if word[j] < word[i]
            return false
        end 
        i = j
        j = nextind(word, i)
    end
    true
end

function ispalindrome(word)
    i = firstindex(word)
    j = lastindex(word)

    while i < j
        if wor[i] != word[j]
            return false
        end
        i = nextind(word, i)
        j = prevind(word, j)
    end
    
    true
end

println(isabecedarian3("flossy"))