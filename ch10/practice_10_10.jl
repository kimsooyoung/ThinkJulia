function getVocab()
    my_list = []

    for line in eachline("words.txt")
        push!(my_list, line)
    end

    my_list
end

function inbisect(sorted_arr, t)
    
    if length(sorted_arr) == 1 || length(sorted_arr) == 2 || length(sorted_arr) == 3
        if t in sorted_arr
            return true
        else
            return false
        end
    end

    cur_index = length(sorted_arr) ÷ 2
    cur_value = sorted_arr[cur_index]
    
    # @show sorted_arr cur_index cur_value
    
    if cur_value == t
        return true
    elseif cur_value > t
        # println("big")
        inbisect(sorted_arr[1:cur_index], t)
    else
        # println("small")
        inbisect(sorted_arr[cur_index:end], t)
    end
end

my_list = getVocab()
sort!(my_list)

my_word = "zoosdfdsf"
println(inbisect(my_list, my_word))