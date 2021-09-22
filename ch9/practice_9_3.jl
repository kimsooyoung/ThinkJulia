

function aviods(word, ban_word)
    
    for ban_letter in ban_word
        ban_count = count(letter->(letter == ban_letter), word)
        if ban_count != 0
            return false
        end
    end

    true
end

function avoidsfraction()
    print("> ")
    user_input = readline() 

    count = 0 
    
    for line in eachline("words.txt")
        if aviods(line, user_input)
            count += 1
        end
    end

    count
end

println(aviods("banaea", "cd"))
println(avoidsfraction())