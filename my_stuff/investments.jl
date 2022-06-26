mutable struct Investment
    stock_name::String
    stock_price::Float64
    DY_year::Float64
    monthly_contribution::Float64
    expected_earning::Float64
    reinvest_dividends::Bool

    dividend::Float64
    months::Int64
    patrimony::Float64
    DY_month::Float64
    n_expected_stocks::Int64
    n_stocks::Int64
    rest::Float64
    isActive

    function Investment(stock_name::String,
                        stock_price::Float64,
                        DY_year::Float64,
                        monthly_contribution::Float64,
                        expected_earning::Float64,
                        reinvest_dividends::Bool,)
        DY_month = (1+DY_year/100)^(1/12) - 1
        dividend = stock_price*DY_month
        n_expected_stocks = expected_earning ÷ dividend

        new(stock_name,
            stock_price,
            DY_year,
            monthly_contribution,
            expected_earning,
            reinvest_dividends,
            dividend,
            0,
            0,
            DY_month,
            n_expected_stocks,
            0,
            0,
            true)
    end
end

BBAS3 = Investment("BBAS3", 34.0, 10.0, 500.0, 500.0, true)

while BBAS3.n_stocks <= BBAS3.n_expected_stocks
    BBAS3.months = BBAS3.months + 1
    if BBAS3.reinvest_dividends
        BBAS3.n_stocks = BBAS3.n_stocks + (BBAS3.monthly_contribution + BBAS3.n_stocks*BBAS3.dividend + BBAS3.rest)÷BBAS3.stock_price
        BBAS3.rest = (BBAS3.monthly_contribution + BBAS3.n_stocks*BBAS3.dividend + BBAS3.rest) % BBAS3.stock_price
    else
        BBAS3.n_stocks = BBAS3.n_stocks + (BBAS3.monthly_contribution + BBAS3.rest)÷BBAS3.stock_price
        BBAS3.rest = (BBAS3.monthly_contribution + BBAS3.rest) % BBAS3.stock_price
        
    end
    #global stock_price = round(stock_price * (1+ rand(-3:0.01:3)/100), digits=2)
end
BBAS3.patrimony = BBAS3.n_stocks*BBAS3.stock_price + BBAS3.rest
    
println("You have acumulated $(BBAS3.n_stocks) quotas in $(BBAS3.months) months with total patrimony of \$$(round(BBAS3.patrimony,digits=2))!")
println("O valor da cota ao final do percurso é de $(BBAS3.stock_price):")
println(BBAS3)