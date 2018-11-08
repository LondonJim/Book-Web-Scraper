require_relative './bookscraper'

bookscraper = BookScraper.new

bookscraper.return_books_info
bookscraper.create_file
