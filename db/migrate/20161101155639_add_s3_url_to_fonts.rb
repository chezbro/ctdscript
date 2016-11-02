class AddS3UrlToFonts < ActiveRecord::Migration
  def change
    add_column :fonts, :s3_url, :string
  end
end
