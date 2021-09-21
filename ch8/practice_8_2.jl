prefixes = "JKLMNOPQ"
suffix = "ack"

for letter in prefixes
    # Caution, "O" and 'O' are different!!
    if letter == 'O' || letter == 'Q'
        println(letter * "uack")
    else
        println(letter * suffix)
    end
end
