class Post < ActiveRecord::Base

	include Bootsy::Container

	has_many :comments
	belongs_to :topic
	belongs_to :user

	mount_uploader :featured_image, FeaturedImageUploader
	mount_uploader :slider_image, SliderImageUploader
  # mount_uploader :image, PostImageUploader

  scope :not_private, -> { where(private: false) }
  scope :featured, -> { where(private: false, featured: true) }
  scope :slider, -> { where(private: false, slider: true) }

  default_scope { order('published_at DESC') }

  extend FriendlyId
  friendly_id :title, use: :slugged

 	def should_generate_new_friendly_id?
  	slug.blank? || title_changed?
  end

  def content_notags
  	self.content.gsub(/<img([^>])+/, '').gsub(/<br\s*\/?>/, '')
  end

  def make_public
    self.update_attributes(private: false)
  end

end