valor_da_cota = 7.38
DY_anual = false
if DY_anual
    DY = 6/100
    DY_mensal = (1+DY)^(1/12) - 1
else
    DY_mensal = 0.87/100
end
rendimento_esperado = 2000
aporte_mensal = 600

rendimento = valor_da_cota*DY_mensal
n_cotas_esperado = rendimento_esperado / rendimento
meses = 0
patrimonio = 0
n_cotas = 0
resto = 0
reinvestir_dividendos = true

while n_cotas <= n_cotas_esperado
    global meses = meses + 1
    if reinvestir_dividendos
        global n_cotas = n_cotas + (aporte_mensal + n_cotas*rendimento + resto)÷valor_da_cota
        global resto = (aporte_mensal + n_cotas*rendimento + resto) % valor_da_cota
    else
        global n_cotas = n_cotas + (aporte_mensal + resto)÷valor_da_cota
        global resto = (aporte_mensal + resto) % valor_da_cota
        
    end
    #global valor_da_cota = round(valor_da_cota * (1+ rand(-3:0.01:3)/100), digits=2)
end
patrimonio = n_cotas*valor_da_cota + resto
    
println("Você acumulou $n_cotas cotas em $meses meses, acumulando um patrimonio de $(round(patrimonio,digits=2))!")
println("O valor da cota ao final do percurso é de $valor_da_cota:")