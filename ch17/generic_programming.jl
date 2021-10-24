function hist(s)
    output = Dict()

    for elem in s
        if elem ∈ keys(output)
            output[elem] += 1
        else 
            output[elem] = 1
        end
    end

    output
end

t = ("spam", "egg", "spam", "spam", "bacon", "spam")
println(hist(t))