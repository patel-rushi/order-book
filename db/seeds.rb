require 'csv'

csv_file_path = 'quotes_2021-02-18.csv'

order_books = []

CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|
  row_hash = row.to_hash
  
  row_hash[:marketCenter] = row_hash.delete(:marketcenter) if row_hash.key?(:marketcenter)
  row_hash[:bidQuantity] = row_hash.delete(:bidquantity) if row_hash.key?(:bidquantity)
  row_hash[:askQuantity] = row_hash.delete(:askquantity) if row_hash.key?(:askquantity)
  row_hash[:bidPrice] = row_hash.delete(:bidprice) if row_hash.key?(:bidprice)
  row_hash[:askPrice] = row_hash.delete(:askprice) if row_hash.key?(:askprice)
  row_hash[:startTime] = row_hash.delete(:starttime) if row_hash.key?(:starttime)
  row_hash[:endTime] = row_hash.delete(:endtime) if row_hash.key?(:endtime)
  row_hash[:quoteConditions] = row_hash.delete(:quoteconditions) if row_hash.key?(:quoteconditions)
  row_hash[:sipFeed] = row_hash.delete(:sipfeed) if row_hash.key?(:sipfeed)
  row_hash[:sipfeedSeq] = row_hash.delete(:sipfeedseq) if row_hash.key?(:sipfeedseq)

  order_books << Order.new(row_hash)
  
  if order_books.size >= 1000
    Order.import order_books
    order_books.clear
  end
end

Order.import order_books unless order_books.empty?