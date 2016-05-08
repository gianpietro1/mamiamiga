class AddSliderImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slider_image, :string
  end
end
