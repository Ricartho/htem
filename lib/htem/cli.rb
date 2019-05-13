class Htem::Cli

  def run
    list
  end

     def list
       Htem::Article.list_article
     end

end
