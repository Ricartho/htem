require "./lib/htem_relatives"
class Htem::Cli

  def run
    create_article
    list
  end

  def create_article
    article_array = Htem::Scraper.scrape_index_page
    Htem::Article.create_from_collection(article_array)
  end

  def list
    puts "Welcome to Htem"
    puts "Here's the list of our available articles : "
    number = 1
    Htem::Article.all.each do |article|
    puts "#{number} - #{article.name},at #{article.infos}"
    number += 1
       end
  end

end
