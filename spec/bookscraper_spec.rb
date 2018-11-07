require_relative "../bookscraper"

describe BookScraper do

  def books_file
    books = Marshal.load File.read("./spec/vcr/bookscraper.txt")
    books[0]
  end

  describe "#get_books_info" do
    it "returns a lists of books" do
      VCR.use_cassette('bookscraper') do
        book_scraper = BookScraper.new
        expect(book_scraper.get_books_info).to include(books_file)
      end
    end
  end

end
