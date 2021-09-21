function first(word)
    first = firstindex(word)
    word[first]
end

function last(word)
    last = lastindex(word)
    word[last]
end

function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first) : prevind(word, last)]
end

function isapalindrome(word)

    middle_word = middle(word)
    @show middle_word

    if length(middle_word) == 0
        return true
    else
        if first(word) == last(word)
            isapalindrome(middle_word)
        else
            return false
        end
    end
end

println(middle("mooom"))
println(middle("mom"))
println(middle("m"))
# println(middle("")) => BoundsError

println(isapalindrome("mooo1m"))