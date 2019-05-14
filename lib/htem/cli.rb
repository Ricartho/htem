require "./lib/htem_relatives"
class Htem::Cli
#class responsible for action of the users
  def run
    create_article #create articles using article class
    list #list all the articles
    menu #show the menu
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
      puts "#{index} - #{article.name},at #{article.infos}"
    end
  end


  def menu
      choice = nil
      while choice != "exit"
      puts"Select a article by his number for more details,type List to see the list again or type Exit"
      choice = gets.strip.downcase

        if choice.to_i > 0 && choice.to_i <= @resultat.length
           article = @resultat[choice.to_i - 1]
           article_specific = Htem::Scraper.scrape_specific_article(article.url_article)
           sleep 1
           puts "Title : #{article_specific[:name]}"
           puts "Description : #{article_specific[:description]}"
           puts "Available at : #{article_specific[:location]}"
           puts "Price : #{article_specific[:price]}"
           puts "Seller infos : #{article_specific[:owner]}"

         elsif choice == "list"
           list
         elsif choice == "exit"
           exitApp
         else
           puts "Wrong option,Select a article by his number for more details,type List to see the list again or type Exit"
        end
      end
  end


    def exitApp
     puts "Loading..."
     sleep 2
     puts "CLI application closed"
    end

end
