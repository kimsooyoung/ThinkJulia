function find(word, letter, start_idx)
    index = start_idx

    while index <= length(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end

    return -1
end


function count(word, letter)
    cnt = 0
    index = firstindex(word)

    while true
        temp_idx = find(word, letter, index)
        if temp_idx == -1
            return cnt
            break
        end
        index = nextind(word, temp_idx) 
        cnt += 1
    end
end

println(count("bananananan",'a'))
println(count("nnnnnnnnnnn",'a'))