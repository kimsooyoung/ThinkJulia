function histogram(word)
    output = Dict()

    for letter in word
        if letter ∉ keys(output)
            output[letter] = 1
        else
            output[letter] += 1
        end
    end

    output
end

function invertdict(h)
    output = Dict()

    for k in keys(h)
        output[get!(h, k, 0)] = k
    end

    output
end

h = histogram("banana")
println(invertdict(h))
