function mySqrt(a)
    x = 3
    ϵ = 0.00000000001

    while true
        y = ( x + a/x ) / 2

        if abs(x-y) < ϵ
            return y
        end

        x = y
    end
end

function testSquareRoot(a)
    parsed_a = float(a)
    my_sqrt = mySqrt(parsed_a)
    inline_sqrt = sqrt(parsed_a)
    diff = abs(my_sqrt - inline_sqrt)

    my_sqrt = string(my_sqrt)
    inline_sqrt = string(inline_sqrt)

    println(parsed_a, " ", my_sqrt, " " ^ (20-length(my_sqrt)), inline_sqrt, " " ^ (20-length(inline_sqrt)), diff )
end

function showSqrtTable(num)
    println("a   mySqrt              sqrt                diff")
    println("-   ------              ----                ----")
    for i in 1:num
        testSquareRoot(i)
    end
end

showSqrtTable(9)