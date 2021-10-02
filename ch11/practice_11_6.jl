function getwordsdict()
    output = Dict()
    for word in eachline("words.txt")
        output[word] = 0
    end
    output
end

function rotateword(word, n)
    new_word = ""

    # A => 65 / Z => 90
    # a => 97 / z => 122
    n₁ = n % 26

    for letter in word
        is_upper = isuppercase(letter)

        n₂ = Int(letter) + n₁
        if is_upper
            if n₂ < 65
                n₂ = n₂ + 26
            elseif n₂ > 90
                n₂ = n₂ - 26
            end
        else
            if n₂ < 97
                n₂ = n₂ + 26
            elseif n₂ > 122
                n₂ = n₂ - 26
            end
        end
        new_word = new_word * Char(n₂)
    end

    new_word
end

function findrotatewords(dict, word)
    output = []

    for i in 1:26
        r_word = rotateword(word, i)
        # @show r_word
        if r_word in keys(dict)
            push!(output, r_word)
        end
    end 
    
    if length(output) != 0
        return output
    else
        return nothing
    end
end

my_dict = getwordsdict()
word = "sh"
println(findrotatewords(my_dict, word))

# for word in keys(my_dict)
#     if findrotatewords(my_dict, word) != nothing
#         println(findrotatewords(my_dict, word))
#     end
# end
