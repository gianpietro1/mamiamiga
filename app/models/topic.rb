class Topic < ActiveRecord::Base
	has_many :posts
	belongs_to :user

  scope :ordered_by_name, ->   { order('LOWER(name)') }

end

