###### Dicionários
#%%
my_dict = Dict("Name" => "João" , "Age" => 18 , "Weight" => 70.0 , "Height" => 1.75)
println(my_dict)
#%%
my_dict["BMI"] = my_dict["Weight"] / (my_dict["Height"]^2)
println(my_dict)

###### Tuplas
#%%
food = ("apple" , "pizza" , "chicken")
println(food)
#%%
println(food[1])

###### Arrays
#%%
cities = ["Salvador" , "Campinas" , "Campina Grande"]
println(cities)

#%% Matriz
unitary = [[1,0,0],[0,1,0],[0,0,1]]
println(unitary)

println(rand(3,3))