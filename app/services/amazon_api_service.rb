class AmazonApiService

  def book_detail_show(book)
    args = set_args
    args.store("isbn", book.isbn)
    Amazon::Ecs.item_search(
      search_index: args[:search_index],
      dataType: args[:dataType],
      response_group: args[:response_group],
      country: args[:country],
      power: "ISBN: #{args[:isbn]}"
    )
  end

  private
  def set_args
    args = {
      dataType: 'json',
      search_index: 'Books',
      response_group: 'Medium',
      country: 'jp',
    }
  end
end
