
function my_func(x, y; style="solid", width=1, color="black")
    println("x: $(x)  y: $(y)  style: $(style)  width: $(width)  color: $(color)")
end

my_func(0:10, 0:10, style="dotted", color="blue")