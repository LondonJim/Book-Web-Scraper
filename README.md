# Book Web Scraper

I created a web scraper to use with the website http://books.toscrape.com. The information I obtained is returned as an array includes the name of the book, the cost and the url link.

### Installation and executing

Clone repo:

`git clone git@github.com:LondonJim/webscraper.git`

Then install the gems:

 `bundle`

To run the web scraper and return a text file with all the book information:

`ruby runBookscraper.rb`

It will create a file called `books.txt` in the root containing all the book information as saved in the array

To run the methods within irb:

`irb`

Enter the following to execute:

`2.5.1 :001 > require './bookscraper.rb'`

`2.5.1 :002 > book_scraper = BookScraper.new`

Return the book information from the website:

`2.5.1 :003 > book_scraper.return_books_info`

To make a file with the information in the root:

`2.5.1 :004 > book_scraper.create_file`



### Testing

Testing is using the `vcr` and `webmock` gems with in the Rspec testing framework. The test mocks the website through the use of a snapshot saved in `/spec/vcr/bookscraper.yml` and when running the test compares the outcome of reading the mock website against a saved text file that contains the expected outcome.

To run tests:

`rspec`
