function histogram(word)
    output = Dict()

    for c in word
        output[c] = get(output, c, 0) + 1
    end
    
    output
end

function reversedict(d)
    output = Dict()

    for k in keys(d)
        v = d[k]
        if k ∈ values(output)
            push!(output[v], k)
        else
            output[v] = [k]
        end
    end

    output
end

h = histogram("banana")
rev_h = reversedict(h)

println(rev_h)