class AddCompositeIndexesToOrders < ActiveRecord::Migration[6.1]
  def change
    # Composite index for bids with bidPrice in descending order
    add_index :orders, [:startTime, :endTime, :bidPrice], order: { bidPrice: :desc }, name: 'index_orders_on_bid_times_and_price_desc'

    # Composite index for asks with askPrice in ascending order
    add_index :orders, [:startTime, :endTime, :askPrice], order: { askPrice: :asc }, name: 'index_orders_on_ask_times_and_price_asc'
  end
end
