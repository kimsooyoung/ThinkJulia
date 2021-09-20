function fact(n)
    space = " " ^ (4 * n)
    println(space, "factorial", n)
    if n == 0
        println(space, "returning 1")
        return 1
    else
        recurse = fact(n-1)
        result = n * recurse
        println(space, "returning ", result)
        return result
    end
end

fact(4)

#                 factorial4
#             factorial3
#         factorial2
#     factorial1
# factorial0
# returning 1
#     returning 1
#         returning 2
#             returning 6
#                 returning 24