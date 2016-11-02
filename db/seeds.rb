require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'ctd_ttf_fonts.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  f = Font.new
  f.name = row['Name']
  f.s3_url = row['URL']
  f.save
  puts "#{f.name}, #{f.s3_url} saved"
end

puts "There are now #{Font.count} rows in the transactions table"