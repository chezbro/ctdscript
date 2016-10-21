class CreateFontCategories < ActiveRecord::Migration
  def change
    create_table :font_categories do |t|
      t.string :name
      t.integer :number_of_fonts

      t.timestamps
    end
  end
end
