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

println(rotateword("A", -2600))
println(rotateword("cheer", 7))