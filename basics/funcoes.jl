function diga_olá(nome)
    println("Olá $(nome)!")
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
diga_olá("Vitor")

#%%
diga_olá(nome) = println("Olá $(nome)!")
diga_olá("GitHub")
quadrado(x) = x^2
quadrado(50)

quadrado(ones(3,3))

#%%
olá = nome -> println("Olá $(nome)!")
olá("pessoal")
