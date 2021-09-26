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

function checkInterlock(word, my_list)
    if length(word) < 2
        return false
    end

    odd = word[1:2:end]
    even = word[2:2:end]

    if inbisect(my_list, odd) && inbisect(my_list, even)
        return true
    end

    false
end

function checkTriplelock(word, my_list)
    if length(word) < 3
        return false
    end

    first = word[1:3:end]
    second = word[2:3:end]
    third = word[3:3:end]

    if inbisect(my_list, first) && inbisect(my_list, second) && inbisect(my_list, third)
        return true
    end

    false
end


function interlock(my_list)
    result = []

    for word in my_list 
        if checkInterlock(word, my_list)
            push!(result, word)
        end
    end
    
    result
end

function triplelock(my_list)
    result = []

    for word in my_list 
        if checkTriplelock(word, my_list)
            push!(result, word)
        end
    end
    
    result
end


my_list = getVocab()
# sort!(my_list)

println(triplelock(my_list))

