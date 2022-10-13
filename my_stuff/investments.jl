mutable struct Stock
    stock_name::String
    stock_price::Float64
    DY_year::Float64
    monthly_contribution::Float64
    expected_earning::Float64

    dividend::Float64
    months::Int64
    patrimony::Float64
    DY_month::Float64
    n_expected_stocks::Int64
    n_stocks::Int64
    rest::Float64
    isActive

    function Stock(stock_name::String,
                        stock_price::Float64,
                        DY_year::Float64,
                        monthly_contribution::Float64,
                        expected_earning::Float64,)

        DY_month = (1+DY_year/100)^(1/12) - 1
        dividend = stock_price*DY_month
        n_expected_stocks = expected_earning ÷ dividend

        new(stock_name,
            stock_price,
            DY_year,
            monthly_contribution,
            expected_earning,
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

function invest_with_dividends(stock::Stock)
    while stock.n_stocks <= stock.n_expected_stocks
        stock.months = stock.months + 1
        stock.n_stocks = stock.n_stocks + (stock.monthly_contribution + stock.n_stocks*stock.dividend + stock.rest)÷stock.stock_price
        stock.rest = (stock.monthly_contribution + stock.n_stocks*stock.dividend + stock.rest) % stock.stock_price
    end
    stock.patrimony = stock.n_stocks*stock.stock_price + stock.rest
end

function invest_without_dividends(stock::Stock)
    while stock.n_stocks <= stock.n_expected_stocks
        stock.months = stock.months + 1
        stock.n_stocks = stock.n_stocks + (stock.monthly_contribution + stock.rest)÷stock.stock_price
        stock.rest = (stock.monthly_contribution + stock.rest) % stock.stock_price
    end
    stock.patrimony = stock.n_stocks*stock.stock_price + stock.rest
end

BBAS3_with_dividends = Stock("Banco do Brasil", #  stock_name::String
                            35.0,   #  stock_price::Float64
                            10.0,   #  DY_year::Float64
                            550.0,  #  monthly_contribution::Float64
                            5000.0,)  #  expected_earning::Float64

BBAS3_without_dividends = Stock("Banco do Brasil", #  stock_name::String
                                35.0,   #  stock_price::Float64
                                10.0,   #  DY_year::Float64
                                550.0,  #  monthly_contribution::Float64
                                5000.0,)  #  expected_earning::Float64


# stock_price = round(stock_price * (1+ rand(-3:0.01:3)/100), digits=2)
invest_with_dividends(BBAS3_with_dividends)

invest_without_dividends(BBAS3_without_dividends)


println("Reinvesting dividends: You have acumulated $(BBAS3_with_dividends.n_stocks) quotas in $(round(BBAS3_with_dividends.months/12,digits=2)) years with total patrimony of \$$(round(BBAS3_with_dividends.patrimony,digits=2))!")
println()
println("Without reinvesting dividends: You have acumulated $(BBAS3_without_dividends.n_stocks) quotas in $(round(BBAS3_without_dividends.months/12,digits=2)) years with total patrimony of \$$(round(BBAS3_without_dividends.patrimony,digits=2))!")