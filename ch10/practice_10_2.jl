function cumulsum(t)
    output = []
    sum = 0

    for val in t
        sum += val
        push!(output, sum)
    end

    output
end

println(cumulsum([1,2,3,4,5,6,7,8,9,10]))