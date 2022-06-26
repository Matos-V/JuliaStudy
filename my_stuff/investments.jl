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

function invest_with_dividends(stock::Investment)
    while stock.n_stocks <= stock.n_expected_stocks
        stock.months = stock.months + 1
        stock.n_stocks = stock.n_stocks + (stock.monthly_contribution + stock.n_stocks*stock.dividend + stock.rest)÷stock.stock_price
        stock.rest = (stock.monthly_contribution + stock.n_stocks*stock.dividend + stock.rest) % stock.stock_price
    end
    stock.patrimony = stock.n_stocks*stock.stock_price + stock.rest
end

function invest_without_dividends(stock::Investment)
    while stock.n_stocks <= stock.n_expected_stocks
        stock.months = stock.months + 1
        stock.n_stocks = stock.n_stocks + (stock.monthly_contribution + stock.rest)÷stock.stock_price
        stock.rest = (stock.monthly_contribution + stock.rest) % stock.stock_price
    end
    stock.patrimony = stock.n_stocks*stock.stock_price + stock.rest
end

BBAS3 = Investment("Banco do Brasil", #  stock_name::String
                    34.0,   #  stock_price::Float64
                    10.0,   #  DY_year::Float64
                    500.0,  #  monthly_contribution::Float64
                    1000.0,  #  expected_earning::Float64
                    true)  #  reinvest_dividends::Bool


# stock_price = round(stock_price * (1+ rand(-3:0.01:3)/100), digits=2)
if BBAS3.reinvest_dividends
    invest_with_dividends(BBAS3)
else
    invest_without_dividends(BBAS3)
end



println("You have acumulated $(BBAS3.n_stocks) quotas in $(BBAS3.months) months with total patrimony of \$$(round(BBAS3.patrimony,digits=2))!")