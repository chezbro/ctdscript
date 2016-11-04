class Tattoo < ActiveRecord::Base
  belongs_to :font
  # before_save :rgb_to_hex

  

  def rgb_to_hex(value)
    value.match(/[\d,\s]+/)[0].split(',').map(&:strip).map { |value|
      value.to_i.to_s(16).rjust(2, '0')
    }.join('')
    # self.hex_value = value
  end


end
