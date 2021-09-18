"""
execution example
    recurse(3, 20)
        => recurse(2, 23)
        => recurse(1, 25)
        => recurse(0, 26)
        => result is 26
"""

function recurse(n, s)
    if n == 0
        println(s)
    else
        recurse(n-1, n+s)
    end
end

recurse(3, 20)

# StackOverflowError
# recurse(-1, 0)