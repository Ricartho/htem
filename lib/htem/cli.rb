require "./lib/htem_relatives"
class Htem::Cli

  def run
    create_article
    list
    menu
  end

  def create_article
    article_array = Htem::Scraper.scrape_index_page
    Htem::Article.create_from_collection(article_array)
  end

  def list
    puts "Welcome to Htem"
    puts "Here's the list of our available articles : "
    @resultat = Htem::Article.all
    @resultat.each.with_index(1) do |article,index|
      puts "#{index} - #{article.price},at #{article.infos}"
    end
  end

  def menu
      choice = nil
      while choice != "exit"
      puts"Select a article by his number for more details,type List to see the list again or type Exit"
      choice = gets.strip.downcase

        if choice.to_i > 0 && choice.to_i <= @resultat.length
           article = @resultat[choice.to_i - 1]
           puts "Title : #{article.name}"

         elsif choice == "list"
           list
         else
           puts "Wrong option,Select a article by his number for more details,type List to see the list again or type Exit"
        end
      end
  end

end
