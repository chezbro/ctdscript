class CreateTattoos < ActiveRecord::Migration
  def change
    create_table :tattoos do |t|
      t.string :script
      t.integer :number_of_views
      t.references :font, index: true
      t.integer :font_id

      t.timestamps
    end
  end
end
