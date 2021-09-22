function useonly(word, letters)
    for c in word
        if c ∉ letters
            return false
        end
    end 

    true
end

function acefhlo()
    for line in eachline("words.txt")
        if useonly(line, "acefhlo")
            println(line)
        end
    end
end

println(useonly("banana", "bna"))
println(useonly("hello", "bna"))

acefhlo()