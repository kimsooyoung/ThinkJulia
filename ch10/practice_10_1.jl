function nestedsum(t)
    total = 0

    for list in t
        for val in list
            total += val
        end
    end

    total
end

println(nestedsum([1,2,3,4,5,6,7,8,9,10]))