require 'httparty'
require 'nokogiri'

class BookScraper

  attr_reader :books

  def initialize
    unparsed_page = HTTParty.get("http://books.toscrape.com/")
    parse_page = Nokogiri::HTML(unparsed_page)
    books_on_page = parse_page.css('article.product_pod')
    total_on_page = books_on_page.count
    total_books = parse_page.css('strong').first.text.to_i

    @total_pages = (total_books / total_on_page).round
    @books = []
  end

  def get_books_info
    page = 1
    while page <= @total_pages
      paginate_page(page).each do |book|
        individual_book = {
          name: book.css('a').text,
          price: book.css('p.price_color').text,
          url: "http://books.toscrape.com/" + book.css('a')[0].attributes["href"].value
        }
        @books << individual_book
      end
      page += 1
    end
    @books
  end

  private

  def paginate_page(page_number)
    paginate_url = "http://books.toscrape.com/catalogue/page-#{page_number}.html"
    paginate_unparsed = HTTParty.get(paginate_url)
    paginate_parse_page = Nokogiri::HTML(paginate_unparsed)
    paginate_books = paginate_parse_page.css('article.product_pod')
  end

end
