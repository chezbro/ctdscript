class AddFontCategoryIdToFont < ActiveRecord::Migration
  def change
    add_column :fonts, :font_category_id, :integer
  end
end
