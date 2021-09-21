function evalloop()
    while true
        print("> ")
        user_input = readline()
        if user_input == "done"
            println("Exit ...")
            break
        end

        user_expr = Meta.parse(user_input)
        user_eval = eval(user_expr)

        println(user_eval)
    end
end

evalloop()