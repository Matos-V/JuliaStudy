###### Dicionários
#%%
meu_dict = Dict("Nome" => "João" , "Idade" => 18 , "Peso" => 70.0 , "Altura" => 1.75)
println(meu_dict)
#%%
meu_dict["IMC"] = meu_dict["Peso"] / (meu_dict["Altura"]^2)
println(meu_dict)

###### Tuplas
#%%
comidas = ("maçã" , "pizza" , "frango")
println(comidas)
#%%
println(comidas[1])

###### Arrays
#%%
cidades = ["Salvador" , "Campinas" , "Campina Grande"]
println(cidades)

#%% Matriz
unitario = [[1,0,0],[0,1,0],[0,0,1]]
println(unitario)

println(rand(3,3))