class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :symbol
      t.string :marketCenter
      t.integer :bidQuantity
      t.integer :askQuantity
      t.decimal :bidPrice
      t.decimal :askPrice
      t.datetime :startTime
      t.datetime :endTime  
      t.string :quoteConditions
      t.string :sipFeed
      t.string :sipfeedSeq
      
      t.timestamps  # This adds created_at and updated_at columns automatically
    end
  end
end