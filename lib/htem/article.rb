class Htem::Article

   attr_accessor :name,:infos,:url_article,:description,:location,:price,:owner
   @@all =[]

def initialize(article_hash)
 article_hash.each {|key,value| self.send(("#{key}="),value)}
 @@all << self
end

def self.create_from_collection(article_array)
     article_array.map {|article| Htem::Article.new(article)}
end

 def self.update_article_attributes(attributes_hash)
   attributes_hash.each {|key,value| self.send(("#{key}="),value)}
 end
 
def self.all
  @@all
end

end
