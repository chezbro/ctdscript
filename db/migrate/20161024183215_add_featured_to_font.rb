class AddFeaturedToFont < ActiveRecord::Migration
  def change
    add_column :fonts, :featured, :boolean, default: false
  end
end
