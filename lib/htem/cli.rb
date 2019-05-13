require "./lib/htem_relatives"
class Htem::Cli
  #BASE_PATH = "http://htem.000webhostapp.com/index.php"
  def run
    create_article
    list
  end

  def create_article
    #article_array = Htem::Scraper.scrape_index_page(BASE_PATH + 'index.php')
    article_array = Htem::Scraper.scrape_index_page
    Htem::Article.create_from_collection(article_array)
  end

     def list
    	#  puts "Welcome to Htem "
      #  puts "Here is the list of our available articles :"
       Htem::Article.all.each do |article|
         puts "#{article.name} ,at #{article.infos}"

       end
     end

end
