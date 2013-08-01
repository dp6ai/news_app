class Article < ActiveRecord::Base
  has_many :comments
  
	with_options presence: true do |p|
		p.validates :title
		p.validates :body
	end

end
