num = 32

if num % 2 == 1
    println("$num is odd!")
else 
    println("$num is even!")
end

(num % 2 == 1) ? println("$num is odd!") : println("$num is even!")