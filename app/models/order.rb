class Order < ApplicationRecord
    scope :top_bids_for, ->(symbol, time) {
        where(symbol: symbol)
        .where('"startTime" <= ? AND "endTime" >= ?', time, time)
        .order(bidPrice: :desc)
        .limit(5)
    }

    scope :top_asks_for, ->(symbol, time) {
        where(symbol: symbol)
        .where('"startTime" <= ? AND "endTime" >= ?', time, time)
        .order(askPrice: :asc)
        .limit(5)
    }
end