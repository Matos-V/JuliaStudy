using Plots

mutable struct Stock
    stock_name::String
    stock_price::Float64
    DY_year::Float64
    monthly_contribution::Float64
    expected_earning::Float64

    dividend::Float64
    months::Int64
    patrimony::Vector
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
            [0.0],
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
        push!(stock.patrimony,  stock.n_stocks*stock.stock_price + stock.rest)
    end
end

function invest_without_dividends(stock::Stock)
    while stock.n_stocks <= stock.n_expected_stocks
        stock.months = stock.months + 1
        stock.n_stocks = stock.n_stocks + (stock.monthly_contribution + stock.rest)÷stock.stock_price
        stock.rest = (stock.monthly_contribution + stock.rest) % stock.stock_price
        push!(stock.patrimony , stock.n_stocks*stock.stock_price + stock.rest)
    end
end