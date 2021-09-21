ϵ = 0.00000000001

a = 4
x = 3

function mySqrt(a, x)
    while true
        y = ( x + a/x ) / 2
        if abs(x-y) < ϵ
            break
        end

        x = y
        println(x)
    end
end

mySqrt(a, x)