class AddAttributesToTattoo < ActiveRecord::Migration
  def change
    add_column :tattoos, :size, :string
    add_column :tattoos, :hex, :string
  end
end
