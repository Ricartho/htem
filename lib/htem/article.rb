class Htem::Article

   attr_accessor :name,:infos,:url
   @@all =[]

def initialize(article_hash)
@name = article_hash[:name]
@infos = article_hash[:infos]
@url = article_hash[:url_article]
@@all << self
end

def self.create_from_collection(article_array)
     article_array.map {|article| Htem::Article.new(article)}
  end

def self.all
  @@all
end

  #  def self.list_article
  #
  #   	puts <<-DOC.gsub /^\s*/, ''
  #   		1- name - location - price
  #   		2- name - location - price
  #   		3- name - location - price
  #   	DOC
  #   end

end
