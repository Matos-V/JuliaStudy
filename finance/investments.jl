using Plots
include("investments_utils.jl")

BBAS3_with_dividends = Stock("Banco do Brasil", #  stock_name::String
                             35.0  ,   #  stock_price:        : Float64
                             10.0  ,   #  DY_year:            : Float64
                             550.0 ,  #  monthly_contribution:: Float64
                             5000.0,)  #  expected_earning:   : Float64

BBAS3_without_dividends = Stock("Banco do Brasil", #  stock_name::String
                                35.0  ,   #  stock_price:        : Float64
                                10.0  ,   #  DY_year:            : Float64
                                550.0 ,  #  monthly_contribution:: Float64
                                5000.0,)  #  expected_earning:   : Float64


# stock_price = round(stock_price * (1+ rand(-3:0.01:3)/100), digits=2)
invest_with_dividends(BBAS3_with_dividends)

invest_without_dividends(BBAS3_without_dividends)


println("Reinvesting dividends: You have acumulated $(BBAS3_with_dividends.n_stocks) quotas in $(round(BBAS3_with_dividends.months/12,digits=2)) years with total patrimony of \$$(round(BBAS3_with_dividends.patrimony[end],digits=2))!")
println()
println("Without reinvesting dividends: You have acumulated $(BBAS3_without_dividends.n_stocks) quotas in $(round(BBAS3_without_dividends.months/12,digits=2)) years with total patrimony of \$$(round(BBAS3_without_dividends.patrimony[end],digits=2))!")

plot(BBAS3_with_dividends.patrimony./1e5, c="blue", label = "Reinvesting Dividends")
plot!(BBAS3_without_dividends.patrimony./1e5, c="red", label = "Without Reinvesting Dividend")
title!("Patrimony Evolution")
xlabel!("Months")
ylabel!("Patrimony (million)")