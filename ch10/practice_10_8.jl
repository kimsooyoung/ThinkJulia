

function Bdaycheck()
    b_day_list = []

    case = 500000
    count = 0
    
    for k in 1:case
        b_day_list = []

        for i in 1:23
            push!(b_day_list, rand(1:365))
        end
        
        sort!(b_day_list)
        # println(b_day_list)
        i = firstindex(b_day_list)
        
        while i < length(b_day_list)
            if b_day_list[i] == b_day_list[i+1]
                count += 1
                break
            end 
            i = nextind(b_day_list, i)
        end
    end

    println(b_day_list)

    return count / case
end

println(Bdaycheck())