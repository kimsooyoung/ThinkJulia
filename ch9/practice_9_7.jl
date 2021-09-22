function puzzler1(word)
    if length(word) < 6
        return false
    end
    
    first_idx = firstindex(word)
    sixth_idx = first_idx

    while sixth_idx < length(word)
        second_idx = nextind(word, first_idx)
        third_idx = nextind(word, second_idx)
        fourth_idx = nextind(word, third_idx)
        fifth_idx = nextind(word, fourth_idx)
        sixth_idx = nextind(word, fifth_idx)

        # @show first_idx second_idx third_idx fourth_idx fifth_idx sixth_idx
        
        if word[first_idx] == word[second_idx]
            if word[second_idx] != word[third_idx]
                if word[third_idx] == word[fourth_idx]
                    if word[fourth_idx] != word[fifth_idx]
                        if word[fifth_idx] == word[sixth_idx]
                            return true
                        end
                    end
                end
            end
        end

        first_idx = second_idx
    end

    false
end

function puzzlercheck()
    for line in eachline("words.txt")
        if puzzler1(line)
            println(line)
        end
    end
end

puzzlercheck()