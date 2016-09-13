if @book.errors.any?
  json.status "error"
  json.data do
    json.errors do
      json.array! @book.errors.messages.keys do |key|
        json.key key
        json.message I18n.t('activerecord.attributes.book.' + key.to_s) + @book.errors.messages[key][0]
      end
    end
  end
else
  json.status "success"
  json.data do
    json.book do
      json.extract! @book,
        :id,
        :book_name,
        :isbn,
        :stocks,
        :created_at
    end
  end
end
