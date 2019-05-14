require 'open-uri'
require 'nokogiri'
class Htem::Scraper

  # this method is responsible for scraping the index page that lists all of the articles on Htem webpage
  def self.scrape_index_page
    doc = Nokogiri::HTML(open("http://htem.000webhostapp.com/index.php"))
    articles = []
    doc.css(".portfolio").each do |article|
      title = article.css(".title-wrap h5").text
      simple_infos = article.css(".subtitle-wrap p").text
      url = article.css("a").attribute("href").value

      article_infos = { :name => title,
                        :infos =>simple_infos,
                        :url_article => url
                      }
                      articles.push(article_infos)
    end
        articles
  end
  #end of first class method

  # this method is responsible for scraping specific articles from Htem webpage
      def self.scrape_specific_article(article_url)
        doc = Nokogiri::HTML(open("http://htem.000webhostapp.com/"+ article_url))
          article = {}
          article[:name] = doc.css(".libele").text
          article[:description] = doc.css(".description").text
          article[:location] = doc.css(".small.location").text
          article[:price] = doc.css(".small.price").text
          article[:owner] = doc.css(".owner").text
          article
      end
end
