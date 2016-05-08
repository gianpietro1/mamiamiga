class AddFeaturedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :boolean, default: true
  end
end
