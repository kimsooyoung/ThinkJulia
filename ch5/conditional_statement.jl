function compare(x, y)
    if x == y
        println("x is same with y")
    else
        if x > y
            println("x is greater than y")
        elseif x < y
            println("x is smaller than y")
        end
    end
end

function rangeChecker(num, range_min, range_max)
    if  range_min < num < range_max
        println("$num is in range!!")
    end
end

compare(20, 3)
rangeChecker(3, 1, 9)