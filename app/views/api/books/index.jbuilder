json.data(@books) { |d| json.extract!(d, :id, :book_name, :isbn, :stocks, :created_at) }
