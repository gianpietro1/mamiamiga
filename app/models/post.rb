class Post < ActiveRecord::Base

	include Bootsy::Container

	has_many :comments
	belongs_to :topic
	belongs_to :user

	mount_uploader :featured_image, FeaturedImageUploader
	mount_uploader :slider_image, SliderImageUploader

  scope :not_private, -> { where(private: false) }
  scope :featured, -> { where(private: false, featured: true) }
  scope :slider, -> { where(private: false, slider: true) }

  default_scope { order('created_at DESC') }

  def content_notags
  	self.content.gsub(/<.*>/m,"")
  end

end