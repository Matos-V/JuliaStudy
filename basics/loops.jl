###### While
println("Sequencia de de base 2!")
n = 0
while n <= 10
    val = 2^n
    println(val)
    n+=1
end

###### For
#%%
for x in 0:10
    println(2^x)
end

#%%
frutas = ["kiwi", "umbu", "siriguela", "cajá", "cajú"]
for x in frutas
    println("Eu gosto de $(x)!")
end

#%%
m,n = 5,5
A = zeros(m,n)
for i in 1:m
    for j in 1:n
        A[i,j] = i+j
    end
end
A

#%%
m,n = 5,5
A = zeros(m,n)
for i in 1:m, j in 1:n
    A[i,j] = i+j
end
A

#%%
A = [i+j for i in 1:m , j in 1:n]
A