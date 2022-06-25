##
function say_hello(name)
    println("Hello $(name)!")
end

function fibonacci(n)
    fib = [0,1]
    if n <=2
        return fib
    else
        while n > 2
            push!(fib,fib[end] + fib[end-1])
            n-=1
        end
        return fib
    end
end

sla = fibonacci(15)
say_hello("Vitor")

##
say_hello(name) = println("Olá $(name)!")
say_hello("GitHub")
square(x) = x^2
square(50)

##
square(ones(3,3))

##
square.(ones(2,2))
##
hello = name -> println("Hello $(name)!")
hello("pessoal")
