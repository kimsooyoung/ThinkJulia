using ThinkJulia

db = DBM("test_db", "c")
db["cheese"] = "LOVE"
db["mint"] = "LOVE"
db["coriander"] = "FUCK"

println(db["cheese"])

for (k, v) in db
    println("$k : $v")
end

close(db)