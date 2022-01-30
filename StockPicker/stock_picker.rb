class StockPicker
  def stock_picker(stocks)
    prices = []
    current_streak = []

    stocks.each_with_index do |curr, idx|
      current_streak << curr
      nxt = stocks[idx + 1] || stocks[idx]

      if curr >= nxt
        prices << [current_streak.last - current_streak.first, [stocks.index(current_streak.first), idx]] if current_streak.length > 1
        current_streak.clear
      end
    end
    
    prices.max[1]
  end
end
