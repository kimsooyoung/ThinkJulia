using Plots

f_x = x -> x^2 + 2x -1
println(f_x(3)) # 9 + 6 - 1 => 14

my_plot = plot(x -> x^2 + 2x -1, 0, 10, xlabel="x", ylabel="y")
display(my_plot)

# To prevent immediate quit
readline()