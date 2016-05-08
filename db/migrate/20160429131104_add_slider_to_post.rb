class AddSliderToPost < ActiveRecord::Migration
  def change
    add_column :posts, :slider, :boolean, default: true
  end
end
