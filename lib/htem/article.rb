class Htem::Article

   def self.list_article
    	puts "Welcome to Htem :"
    	puts <<-DOC.gsub /^\s*/, ''
    		1- name - location - price
    		2- name - location - price
    		3- name - location - price
    	DOC
    end

end