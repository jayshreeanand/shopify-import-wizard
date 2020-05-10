require 'google/apis/books_v1'
require 'google/apis/translate_v2'

module BookFetcher
  def self.book_info(query)
    client = Google::Apis::BooksV1::BooksService.new
    client.key = ENV['GOOGLE_API_KEY']
    result = client.list_volumes(q: query)
    book_info = result.items.first.volume_info
    sale_info = result.items.first.sale_info

    { 
      title: book_info.title,
      authors: book_info.authors,
      description: book_info.description,
      image: book_info.image_links.thumbnail,
      categories: book_info.categories,
      list_price: { amount: sale_info.list_price.try(:amount), currency: sale_info.list_price.try(:currency_code) },
      retail_price: { amount: sale_info.retail_price.try(:amount), currency: sale_info.retail_price.try(:currency_code) }
    }
  end
end