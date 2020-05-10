require 'google/apis/books_v1'
require 'google/apis/translate_v2'

module BookFetcher
  def self.book_info
    client = Google::Apis::BooksV1::BooksService.new
    client.key = ENV['GOOGLE_API_KEY']
    result = client.list_volumes(q: 'The Great Gatsby')
    book_info = result.items.first.volume_info
    sale_info = result.items.first.sale_info

    book = { 
      title: book_info.title,
      authors: book_info.authors,
      description: book_info.description,
      image: book_info.image_links.thumbnail,
      categories: book_info.categories,
      list_price: { amount: sale_info.list_price.amount, currency: sale_info.list_price.currency_code },
      retail_price: { amount: sale_info.retail_price.amount, currency: sale_info.retail_price.currency_code }
    }
    book

    # book_info
  end
end