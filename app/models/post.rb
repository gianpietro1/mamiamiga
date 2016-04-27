class Post < ActiveRecord::Base
	include Bootsy::Container
	has_many :comments
end
