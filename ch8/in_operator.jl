function inbot(word1, word2)
    for letter ∈ word1
        if letter ∈ word2
            print(letter, " ")
        end
    end
end

inbot("Hello", "Ollws")