class AddSymbolToExistingIndexOnOrders < ActiveRecord::Migration[6.1]
  def change
    remove_index :orders, name: 'index_orders_on_bid_times_and_price_desc'
    add_index :orders, [:symbol, :startTime, :endTime, :bidPrice], name: 'index_orders_on_bid_times_and_price_desc', order: { bidPrice: :desc }

    remove_index :orders, name: 'index_orders_on_ask_times_and_price_asc'
    add_index :orders, [:symbol, :startTime, :endTime, :askPrice], name: 'index_orders_on_ask_times_and_price_asc', order: { askPrice: :asc }
  end
end
