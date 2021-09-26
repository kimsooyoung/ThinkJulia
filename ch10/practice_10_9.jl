

function pushwords()
    my_list = []

    for line in eachline("words.txt")
        push!(my_list, line)
    end

    my_list
end

function appendwords()
    my_list = []

    for line in eachline("words.txt")
        my_list = [my_list..., line]
    end
    
    my_list
end

# pushwords()
# println("Done")

# This method will be Super Slow
appendwords()
println("Done")
