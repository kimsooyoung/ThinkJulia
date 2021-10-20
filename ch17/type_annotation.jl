using Printf

# a = (1+2)::Int32 => Error

a = (1+2)::Int64
# b = (1+2)::Float64 # => Error

function returnFloat()
    x::Float64 = 100
    x
end

function sinc(x)::Float64
    if x == 0
        x = 1
    end
    sin(x)/x
end

x = returnFloat()
@printf("%f, %s\n", x, typeof(x))

sinc_x = sinc(x)
@printf("%f, %s\n", sinc_x, typeof(sinc_x))
