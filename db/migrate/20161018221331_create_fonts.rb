class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :family
      t.string :category

      t.timestamps
    end
  end
end
