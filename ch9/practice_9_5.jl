function usesall(word, letters)
    for letter in letters
        if letter ∉ word
            return false
        end
    end

    true
end

function aeiou()
    for line in eachline("words.txt")
        if usesall(line, "aeiouy")
            println(line)
        end
    end
end


println(usesall("hello", "eloeeh"))
aeiou()