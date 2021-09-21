# b(9) 
# prod = a(9, 9) => 90
# return 90
function b(z)
    prod = a(z, z)
    println(z, " ", prod)
    prod
end

# a(9, 9)
# x = 10
# return 9 * 10 => 90
function a(x, y)
    x = x + 1
    x * y
end

function c(x, y, z)
    # 1 + 5 + 3 => 9
    total = x + y + z
    # b(9) ^2 => 90^2 => 8100
    square = b(total)^2
    square
end

x = 1
y = x + 1
# x = 1 / y = 2
# c(1, 5, 3)
println(c(x, y+3, x+y))
