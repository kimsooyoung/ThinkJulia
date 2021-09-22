

function hasno_e(word)
    count_e = count(letter->(letter == 'e'), word)
    if count_e == 0
        return true
    else
        return false
    end
end

function hasno_e_fraction()
    count_no_e = 0
    total_words = 113809

    for line in eachline("words.txt")
        if hasno_e(line)
            println(line)
            count_no_e +=1
        end
    end

    count_no_e / total_words
end

println(hasno_e("banaea"))
println(hasno_e_fraction())