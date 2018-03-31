class Post < ActiveRecord::Base
	def self.search(term)
			if term != 'Anonymous' and term != ''
				where('author LIKE?', "%#{term}%").order('id DESC')
			elsif term == 'Anonymous'
				where('author LIKE?', "").order('id DESC')
			else
				Post.all.order("created_at DESC")
		end
	end
end